# Web Challenge Analysis - Flag Command

## Summary
- This lab involved a web-based mini-game where the visible gameplay did not provide any actionable path to extract the flag. The intended solution required analyzing web application behavior through the browser’s Developer Tools, specifically the Network tab, to uncover hidden API requests and retrieve a secret value from a JSON response.

-The goal was to locate a hidden “secret command,” use it in the application’s input field, and obtain the flag.

## Steps
1. Explore the application normally
The game seemed playable, but:
- No visible path led to a flag.
- Every choice led to a loop.
- The UI was a distraction.

### This teaches don’t trust the UI.

2. Inspect Network Traffic

Open DevTools → Network → Refresh page.

Observed:
- A request to an /options endpoint(this happened after i refreshed the page).
- A JSON response that included a hidden field.

3. Read JSON response & extract the secret

The response contained a key/value pair:

- clearly described in secrect.json

4. Input secret into game to trigger hidden logic

Entering the phrase unlocked the final step → flag output.

This demonstrates:
- Client-side trust issues
- Hidden developer logic



## WHAT i learnt
1. Never trust the interface — inspect the network.
2. Modern apps expose tons of data via API calls.
3. Hidden flags often live in JSON, JS, or response headers. Developers should be careful not to leave sensitive keys or instructions in client-side accessible areas
4. When you see a weird endpoint → inspect it.
