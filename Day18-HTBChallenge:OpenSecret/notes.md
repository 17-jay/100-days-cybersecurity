# Day 18 - HTB Challenge: OpenSecret 🔐

## Overview
OpenSecret is a Very Easy web challenge on Hack The Box. It involves a 
help desk portal that uses JWT tokens for session management. The vulnerability 
is a hardcoded JWT secret key exposed in client-side JavaScript.



---

## Concepts Learned

### 1. JWT — JSON Web Tokens
JWT is a standard for securely transmitting information between parties as a 
JSON object. A JWT has three parts separated by dots:
```
header.payload.signature
```

- **Header** → algorithm used (e.g. HS256)
- **Payload** → the actual data (e.g. username, role)
- **Signature** → proves the token hasn't been tampered with

The signature is created by signing the header + payload with a **secret key**.
If the secret key is known, anyone can forge valid tokens.

### 2. The Vulnerability — Hardcoded Secret in Client-Side JS
The application generated JWT tokens entirely in the browser using JavaScript.
The secret key used to sign the tokens was hardcoded directly in the JS code:
```javascript
const SECRET_KEY = "HTB{0p3n_s3cr3ts_ar3_n0t_s3cr3ts}";
```

Since browsers download and execute JavaScript, any user can view this code
and read the secret — making the entire JWT security model useless.

### 3. Why This Is Dangerous
JWT security depends entirely on keeping the secret key private. If an attacker
knows the secret they can:
- Forge tokens with any username or role
- Impersonate any user including admins
- Bypass authentication entirely

### 4. How to Find Hardcoded Secrets
Always inspect client-side JavaScript for hardcoded secrets:
- Press `F12` → Sources tab
- Press `Ctrl+Shift+F` to search across all files
- Search for keywords: `secret`, `key`, `token`, `password`, `api_key`

### 5. Where Secrets Should Live
Secrets must NEVER be in client-side code. They should:
- Live only on the server side
- Be stored in environment variables
- Never be committed to source code or git repositories

---

## Attack Chain
```
Visit helpdesk site
  → F12 → Sources → view main.js
  → Find hardcoded SECRET_KEY in JavaScript
  → Secret key IS the flag
  → Submit HTB{0p3n_s3cr3ts_ar3_n0t_s3cr3ts}
```

## Flag
```
HTB{0p3n_s3cr3ts_ar3_n0t_s3cr3ts}
```

## Key Takeaways
- Never hardcode secrets in client-side JavaScript — users can always read it
- JWT security is only as strong as the secrecy of the signing key
- Always audit JS source files for exposed credentials during web pentests
- Search for: secret, key, token, password, api_key in all JS files