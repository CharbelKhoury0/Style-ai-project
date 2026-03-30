# Submit and Rollout Runbook

## 1) Prepare Credentials (one-time)
- Authenticate EAS: `npx eas-cli login`
- Configure project: `npx eas-cli init` (if not already linked)
- Configure iOS credentials with EAS managed signing
- Configure Android keystore with EAS managed signing
- Ensure App Store Connect and Play Console app records already exist

## 2) Build Production Artifacts
- iOS IPA: `npm run eas:build:ios`
- Android AAB: `npm run eas:build:android`

## 3) Submit to Test Tracks
- iOS TestFlight: `npm run eas:submit:ios`
- Android Internal track: `npm run eas:submit:android`

## 4) Validate Test Tracks
- Install TestFlight build and run smoke tests
- Install Internal track build and run smoke tests
- Review logs/crashes before promoting to production

## 5) Public Rollout
- Android staged rollout: 10% -> 50% -> 100%
- iOS release after review approval and final verification

## 6) Post-Release Monitoring (first 48 hours)
- Monitor auth failures and startup errors
- Watch crash-free rate and ANR metrics
- Validate backend health and key API latency
