# Student Task Manager

A simple Flutter mobile application for managing student tasks.

## Features

- Add new tasks
- Select task category
- Select task priority
- View all tasks
- Mark tasks as Completed or Pending
- Delete tasks
- Prevent empty task submission

## Categories

- Assignment
- Lecture
- Research
- Exam
- Personal

## Priority

- High
- Medium
- Low

## Project Structure

```text
lib/
├── controllers/
│   └── task_controller.dart
├── models/
│   └── task.dart
├── repositories/
│   └── task_repository.dart
├── services/
│   └── task_service.dart
├── views/
│   ├── home_page.dart
│   └── add_task_page.dart
└── main.dart
