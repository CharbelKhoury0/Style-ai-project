# Style AI Mobile

Expo + React Native app for AI-assisted styling workflows.

## Local Development

1. Install dependencies:
   - `npm ci`
2. Configure environment variables:
   - `EXPO_PUBLIC_SUPABASE_URL`
   - `EXPO_PUBLIC_SUPABASE_ANON_KEY`
   - `EXPO_PUBLIC_WEATHER_API_KEY`
3. Start development:
   - `npm run dev`

## Quality Checks
- `npm run typecheck`
- `npm run lint`

## Release Commands
- iOS build: `npm run eas:build:ios`
- Android build: `npm run eas:build:android`
- iOS submit: `npm run eas:submit:ios`
- Android submit: `npm run eas:submit:android`

See `docs/release-checklist.md` for the full release process.
