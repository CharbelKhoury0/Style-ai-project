# Preflight Testing Matrix

Use this checklist before every production store submission.

## Devices
- iOS latest (physical)
- iOS previous major (physical or simulator)
- Android latest (physical)
- Android previous major (physical or emulator)

## Functional Smoke Tests
- Sign up with a new account
- Sign in with existing account
- Sign out and re-authenticate
- Session restore after app restart
- Supabase connectivity in normal network conditions
- Graceful error message on offline/airplane mode

## Permissions and Platform Behavior
- Camera permission prompt appears with clear rationale
- Photo library permission prompt appears with clear rationale
- Location permission prompt appears with clear rationale
- Denied permission path does not crash and provides fallback UX

## Store Compliance Preflight
- Privacy policy URL published and accessible
- Support URL published and accessible
- iOS privacy answers in App Store Connect updated for this build
- Android Data Safety form updated for this build
- Age/content rating reviewed

## Go/No-Go Criteria
- No P0/P1 bugs in auth or startup flow
- No crashes in smoke test paths
- All mandatory metadata and screenshots complete in both stores
