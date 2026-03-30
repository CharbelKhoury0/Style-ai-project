# Mobile Release Checklist

## 1) Prerequisites
- Apple Developer account (active)
- App Store Connect app created for `com.styleai.mobile`
- Google Play Console app created for `com.styleai.mobile`
- EAS account linked to this project (`eas init` if needed)
- Environment variables configured in EAS:
  - `EXPO_PUBLIC_SUPABASE_URL`
  - `EXPO_PUBLIC_SUPABASE_ANON_KEY`
  - `EXPO_PUBLIC_WEATHER_API_KEY`

## 2) Versioning
- Update `expo.version` in `app.json` (semantic version)
- Ensure iOS/Android build numbers are auto-incremented via EAS production profile
- Confirm release notes/changelog are ready for both stores

## 3) Quality Gates
- Run: `npm ci`
- Run: `npm run typecheck`
- Run: `npm run lint`
- Validate auth flow on iOS and Android test devices

## 4) Build
- iOS build: `npm run eas:build:ios`
- Android build: `npm run eas:build:android`

## 5) Submit
- iOS submit (to App Store Connect/TestFlight): `npm run eas:submit:ios`
- Android submit (to Internal track): `npm run eas:submit:android`

## 6) Store Compliance
- iOS privacy details and app metadata complete
- Android Data Safety and content rating complete
- Support URL and privacy policy URL published and reachable

## 7) Rollout
- Validate TestFlight and Internal track installs
- Promote Android staged rollout: 10% -> 50% -> 100%
- Release iOS to production after review approval and smoke verification

## 8) Post-Release Monitoring
- Track authentication errors and crash rates
- Monitor API and Supabase latency/error rates
- Prepare hotfix path using the same EAS production pipeline
