# GEOTAS — Flutter Client
### Geo-Temporal Attendance System — Mobile & Web Frontend

A dual-target Flutter application powering the student mobile app and lecturer web dashboard for the GEOTAS attendance system.

---

## Overview

The GEOTAS Flutter client is a single codebase that compiles to two separate targets — a mobile app for students and a web dashboard for lecturers. Both targets share all business logic, models, providers, and network code. The platform split affects only the entry point and presentation layer.

Roles are not global. A user has no fixed identity as "lecturer" or "student" — their role is scoped per course, determined at join time and returned by the backend on every course fetch.

---

## Architecture

```
lib/
├── main.dart                  # Shared entry point
├── core/                      # Shared infrastructure
│   ├── constants/             # API base URLs, route names
│   ├── errors/                # Failure types
│   ├── models/                # Shared response models
│   ├── network/               # Dio client + interceptors
│   ├── router/                # GoRouter configuration
│   ├── storage/               # Token persistence (SharedPreferences)
│   └── utils/                 # Date formatting, helpers
├── features/                  # Feature modules (shared logic)
│   ├── auth/                  # Register, login, JWT handling
│   ├── courses/               # Create, join, list courses
│   ├── sessions/              # Start session, QR polling, close
│   └── attendance/            # Mark via QR or OTP, view records
├── lecturer/                  # Web-only presentation layer
│   ├── app.dart               # Lecturer app root
│   ├── screens/               # Dashboard, session, attendance views
│   └── widgets/               # Lecturer-specific UI components
└── student/                   # Mobile-only presentation layer
    ├── app.dart               # Student app root
    ├── screens/               # Course list, scanner, OTP views
    └── widgets/               # Student-specific UI components
```

---

## How It Works

**Lecturer flow (web):**
1. Creates an account and logs into the web dashboard
2. Creates a course — receives a unique invite code to share with students
3. Starts an attendance session — selects geofence radius, week number, QR rotation interval, and an optional title
4. A rotating QR code is displayed, refreshing at the interval set at session start
5. Watches the live attendance list update as students mark in
6. Closes the session when done
7. Views the full attendance register per session or per course

**Student flow (mobile):**
1. Creates an account and logs into the mobile app
2. Joins a course using the lecturer's invite code — submits their matric number at this point
3. Opens the course inside the classroom — GPS is captured automatically
4. Scans the rotating QR code to mark attendance
5. If camera fails, requests an OTP — enters the code manually instead
6. Receives confirmation with their confidence score

---

## Role Handling

There is no global role picker at signup. When a user fetches their enrolled courses via `GET /courses/enrolled`, each course in the response includes a `role` field — either `"lecturer"` or `"student"`. The Flutter app uses this field to branch the UI at the course detail level:

```dart
final role = course.role;

return role == 'lecturer'
    ? LecturerCourseView(course: course)
    : StudentCourseView(course: course);
```

This means a user can be a lecturer in one course and a student in another within the same session, without logging out.

---

## QR Polling

The lecturer screen polls `GET /sessions/{id}/qr-token` on a timer. The interval is not hardcoded — it is read from the session's `qr_rotation_secs` field returned when the session is created. The Flutter app sets a `Timer.periodic` using that value, ensuring the display always stays in sync with the backend's rotation cycle.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter 3.38.7 |
| State management | Riverpod (hooks_riverpod + riverpod_generator) |
| Navigation | GoRouter |
| HTTP client | Dio + custom auth interceptor |
| Code generation | Freezed + json_serializable + build_runner |
| Token storage | SharedPreferences |
| QR display | qr_flutter |
| UI components | shadcn_ui |
| Web target | Flutter Web (lecturer dashboard) |
| Mobile target | Android (student app) |

---

## Project Structure

```
lib/
├── main.dart
├── core/
│   ├── constants/
│   │   └── api_constants.dart       # base URL, endpoint paths
│   ├── errors/
│   │   └── failures.dart            # typed failure classes
│   ├── network/
│   │   ├── dio_client.dart          # Dio instance + provider
│   │   └── interceptors/
│   │       └── auth_interceptor.dart # JWT injection on every request
│   ├── router/
│   │   └── router.dart              # GoRouter with role-aware redirects
│   ├── storage/
│   │   └── secure_storage.dart      # token read/write
│   └── utils/
│       └── date_formatter.dart
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── models/user_model.dart
│   │   │   └── repositories/auth_repository.dart
│   │   ├── presentation/
│   │   │   ├── screens/auth_screen.dart
│   │   │   └── widgets/auth_widget.dart
│   │   └── providers/auth_provider.dart
│   ├── courses/
│   │   ├── data/
│   │   │   ├── models/course_responses.dart
│   │   │   └── repositories/course_repository.dart
│   │   ├── presentation/
│   │   │   ├── screens/course_screen.dart
│   │   │   └── widgets/                     # modular course UI components
│   │   └── providers/course_provider.dart
│   ├── sessions/
│   │   ├── data/
│   │   │   ├── models/session_model.dart
│   │   │   └── repositories/session_repository.dart
│   │   ├── presentation/
│   │   │   ├── screens/session_screen.dart
│   │   │   └── widgets/session_widget.dart
│   │   └── providers/session_provider.dart
│   └── attendance/
│       ├── data/
│       │   ├── models/attendance_model.dart
│       │   └── repositories/attendance_repository.dart
│       ├── presentation/
│       │   ├── screens/attendance_screen.dart
│       │   └── widgets/attendance_widget.dart
│       └── providers/attendance_provider.dart
├── lecturer/
│   ├── app.dart
│   ├── screens/
│   └── widgets/
└── student/
    ├── app.dart
    ├── screens/
    └── widgets/
```

---

## Running Locally

```bash
# clone the repo
git clone https://github.com/niyiayooluwa/geotas
cd geotas/flutter

# install dependencies
flutter pub get

# generate Freezed + Riverpod code
dart run build_runner build --delete-conflicting-outputs

# run as mobile (student app)
flutter run -d android

# run as web (lecturer dashboard)
flutter run -d chrome
```

---

## Environment

Update `lib/core/constants/api_constants.dart` with your backend URL before running:

```dart
const String baseUrl = 'http://localhost:8080'; // local
// const String baseUrl = 'https://your-deployed-url'; // production
```

---

## Author

Toluwalase Abiola Ayooluwa
B.Tech Software Engineering — Federal University of Technology, Akure (FUTA)
Final Year Project — 2026