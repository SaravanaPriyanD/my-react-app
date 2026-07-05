# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A minimal Create React App (CRA, via `react-scripts` 5.0.1) project. This is a teaching/demo repo (used in a DevOps course) whose main purpose is to demonstrate the pipeline: React app -> Docker multi-stage build (Nginx) -> GitHub Actions CI/CD -> Docker registry push. The app itself (`src/App.js`) is a single static page, not a real product.

## Commands

- `npm install` — install dependencies
- `npm start` — run dev server (CRA default, http://localhost:3000)
- `npm run build` — production build to `build/`
- `npm test` — runs `react-scripts test tests` (note the literal `tests` arg — this restricts Jest's test path pattern to files under `src/tests/`, so `src/App.test.js` at the root is normally NOT run by `npm test`). Add `-- --watch=false` for a single non-interactive run (this is what CI does).
- To run a single test file directly: `npx react-scripts test src/tests/App.test.js --watch=false`

Note: `src/App.test.js` is a leftover CRA-default test (asserts a "learn react" link) that no longer matches `App.js` content and would fail if run — it's excluded from the normal `npm test` invocation because of the `tests` path filter above. Be aware of this when adding/moving test files, and don't assume `src/App.test.js` is exercised by CI.

## Architecture / structure

- `src/App.js` — the entire application UI (single component, inline styles, no routing, no state).
- `src/tests/App.test.js` — the actual test suite that runs in CI.
- `Dockerfile` — two-stage build: `node:18-alpine` builds the CRA app, then `nginx:alpine` serves the static `build/` output on port 80.
- `.github/workflows/ci-cd.yml` — on push/PR to `main`: install -> test (`npm test -- --watch=false`) -> `npm run build` -> Docker login -> build & push image to Docker Hub as `<REGISTRY_USERNAME>/my-react-app:latest`. Requires `REGISTRY_USERNAME`/`REGISTRY_PASSWORD` secrets.
- No routing library, state management, or backend — everything is contained in `src/`.
