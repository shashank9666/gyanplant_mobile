# GyanPlant Mobile App

A React Native mobile application for the GyanPlant Learning Management System.

## Features

- User authentication with Supabase
- Dashboard with user profile and stats
- Course listing and progress tracking
- Gamification elements (XP, levels, streaks)
- Cross-platform support (iOS & Android)

## Setup

### Prerequisites

- Node.js 18+
- Expo CLI: `npm install -g expo-cli`

### Installation

1. Install dependencies:
```bash
npm install
```

2. Create `.env` file with Supabase credentials:
```
EXPO_PUBLIC_SUPABASE_URL=your_supabase_url
EXPO_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
```

### Running the App

- **iOS Simulator**: `npm run ios`
- **Android Emulator**: `npm run android`
- **Web**: `npm run web`
- **Start Development**: `npm start`

## Project Structure

```
src/
├── contexts/        # Auth and app contexts
├── lib/            # Utility libraries (Supabase client)
└── screens/        # Screen components
```

## Database Setup

Run migrations to set up the required tables:
- `users` - User profiles and stats
- `courses` - Course data
- `enrollments` - User course enrollments
- `progress` - Learning progress tracking
