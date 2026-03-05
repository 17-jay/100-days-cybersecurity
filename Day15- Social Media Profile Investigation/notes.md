# Day 15 - CTF: OSINT / Social Media Profile Investigation

## Objective
- Investigate a fake social media profile (TechReviewer2024) on a simulated platform called SocialConnect, and extract the real contact email behind the account.

## What i did
1. used curl command to find out what the website had
- Check commands.sh to see all the commands
- All urls brought the same results 

2. but from the curl commands i did find the JS file which would help later on on finding the suspecting email.
(/assets/index-fPbXfhd6.js)

3. Downloaded and used regex that i researched about to find the email(check the commands.sh)


## Key Takeaway
* When a web app is a SPA (React, Vue, Angular), the HTML source tells you nothing — always inspect the JS bundle.
 - CTF developers often embed "hidden" data directly in the compiled frontend code, assuming users will only interact with the UI. Downloading and grepping the bundle is a fast, effective technique to bypass that assumption.



# How to determine a web app is SPA 
- (<div id="root"></div>)  No actual content, no profile data, nothing — just an empty div. In a traditional server-rendered site, /profile/TechReviewer2024 would return different HTML than /robots.txt. Every route returned the exact same page — that's the signature of a SPA
- Vite (/vite.svg) is a build tool almost exclusively used with frontend frameworks like React, Vue, or Svelte.