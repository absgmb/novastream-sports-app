# NovaStream Sports

A separate Flutter application for football news, fixtures, results, and live scores.

## Current status

The starter foundation includes:

- Material 3 app shell
- Home, Matches, News, and Favorites navigation
- Placeholder states ready for API integration
- No changes to `novastream-player`

## Planned next steps

1. Add a football data-service abstraction.
2. Connect fixtures, results, and live scores through a backend-safe API layer.
3. Add news/RSS ingestion and caching.
4. Add teams, leagues, favorites, and notifications.
5. Add a legal “Where to Watch” layer for official broadcaster links.

## Development

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```
