# TODO Application

A modern Flutter TODO application built using **Clean Architecture**, **GetX**, and **Hive**. The application allows users to efficiently manage their daily tasks with offline storage, task categorization, theme switching, and an intuitive user interface.

---

## Tech Stack

- Flutter
- Dart
- GetX (State Management & Navigation)
- Hive (Local Database)
- Hive Flutter
- Clean Architecture

---

## Project Structure

```
lib/
│
├── core/
├── data/
├── domain/
├── presentation/
│   ├── controllers/
│   ├── screens/
│   └── widgets/
└── main.dart
```

---

# Features

## Splash Screen

- Displays a custom animated splash screen using a GIF.
- Automatically navigates to the Login Screen after a few seconds.
- Supports both Light and Dark themes.

---

## Login Screen

The application starts with a login screen using hardcoded credentials.

### Credentials

Email

```
vayuz@gmail.com
```

Password

```
vayuz123
```

### Features

- Email validation
- Password validation
- Remember Me functionality
- Login loading indicator
- Invalid credential handling using SnackBar

### Remember Me

When the **Remember Me** checkbox is selected:

- Email is saved locally using Hive.
- Password is saved locally using Hive.
- Credentials are automatically filled when the application is opened again.

If Remember Me is unchecked, the stored credentials are removed.

---

## Home Screen

The Home Screen provides a dashboard showing task statistics.

### Dashboard Cards

- Total Tasks
- Completed Tasks
- Pending Tasks
- Today's Tasks

The dashboard updates automatically whenever:

- A task is added
- A task is edited
- A task is deleted
- Task status changes

The Home Screen also supports Light and Dark themes.

---

## Task Management

The Task Screen is the core of the application.

### Add Task

Users can create a new task by providing:

- Title (Required)
- Description
- Date
- Status
    - Pending
    - Completed

A calendar picker is used to select the task date.

---

## Automatic Date Categorization

Tasks are automatically categorized based on the selected date.

| Category | Condition |
|----------|-----------|
| Yesterday | Task Date < Today |
| Today | Task Date = Today |
| Future | Task Date > Today |

The category is assigned automatically without user intervention.

---

## Edit Task

Tasks can be edited in two ways:

- Tap the Edit icon
- Swipe left on a task

The Add Task screen opens with all existing task details pre-filled.

Users can update:

- Title
- Description
- Date
- Status

After saving, the task is updated immediately using Hive.

---

## Delete Task

Tasks can be deleted in two ways:

- Tap the Delete icon
- Swipe right on a task

Before deleting, a confirmation dialog appears asking:

```
Are you sure you want to delete this task?
```

Options:

- Yes
- No

If the user confirms:

- Task is removed from Hive.
- Dashboard statistics update automatically.
- A red SnackBar is displayed indicating successful deletion.

---

## Swipe Gestures

The application uses Flutter's `Dismissible` widget for quick task actions.

### Swipe Left

- Opens Edit Task screen.
- Existing task details are loaded automatically.

### Swipe Right

- Opens Delete confirmation dialog.
- Deletes the task after confirmation.

---

## Search

The Task Screen includes a search bar.

Users can search tasks by title.

The search results update in real time while typing.

---

## Task Filters

The following filters are available:

- All
- Yesterday
- Today
- Future
- Completed
- Pending

Selecting a filter updates the task list instantly.

---

## Theme Support

The application supports:

- Light Theme
- Dark Theme

A theme toggle button is available on every major screen.

The selected theme is stored locally using Hive and is automatically restored when the application is reopened.

---

## Profile Screen

The Profile Screen contains:

- User Avatar
- User Name
- Email Address
- Application Version
- Change Password
- Logout

The screen fully supports both Light and Dark themes.

---

## Change Password

Users can change their login password from the Profile Screen.

The workflow includes:

- Current Password
- New Password
- Confirm Password

Validation ensures:

- Current password is correct.
- New password and confirm password match.

The updated password is stored securely in Hive and is used for future logins.

---

## Logout

Selecting Logout:

- Ends the current session.
- Returns the user to the Login Screen.
- Stored credentials remain available only if Remember Me was enabled.

---

## Local Storage

Hive is used for offline storage.

The application stores:

- Tasks
- Task Status
- Task Categories
- Selected Theme
- Remember Me Credentials
- Updated Password

All data persists after restarting the application.

---

## State Management

GetX is used for:

- Navigation
- State Management
- Dependency Injection
- Reactive UI Updates

---

## Responsive Design

The application is designed to work on:

- Android
- iOS

The interface adapts well to different screen sizes while maintaining a consistent user experience.

---

## Key Functionalities

- Splash Screen
- Login Authentication
- Remember Me
- Dashboard
- Add Task
- Edit Task
- Delete Task
- Swipe Actions
- Search Tasks
- Date Categorization
- Task Filters
- Completed / Pending Status
- Light & Dark Theme
- Change Password
- Logout
- Hive Local Storage
- Responsive UI

---


