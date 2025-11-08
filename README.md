# FGSK Loading

Minimal loading screen resource for FGSK servers. Shows a custom HTML/CSS page, tracks load progress, and hands control to the spawn flow once the session is ready.

## Features
- FXDK-ready loadscreen (`fxmanifest.lua` + `index.html`, `style.css`, `script.js`).
- Displays progress updates received via `loadProgress` events from FXServer.
- Client script shuts down both the loadscreen and loadscreen NUI, then triggers the custom spawn pipeline (`fgsk-spawn-manager-wrapper`) after the player becomes active.
- Optional `/intro_force_spawn` command and `intro:beginSpawnFlow` event for manual testing.

## Usage
1. **FXDK** – ensure `fgsk-loading` is enabled in `fxproject.json`; FXDK will include it automatically on server boot.
2. **Standalone server.cfg** – add `ensure fgsk-loading` (before your intro/spawn resources) so the loadscreen runs outside FXDK.
3. Customize `index.html`, `style.css`, and `logo.jpg` to match your branding.
4. If you change the spawn wrapper resource name, update `client.lua` to call the correct event when the loading screen finishes.

## Files
- `fxmanifest.lua` – declares loadscreen files and client script.
- `index.html`, `style.css`, `script.js`, `logo.jpg` – visual assets and UI logic.
- `client.lua` – waits for session ready, shuts down the loadscreen, and kicks off the spawn flow.
