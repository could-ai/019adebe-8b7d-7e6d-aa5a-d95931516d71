import 'package:flutter/material.dart';
import 'package:couldai_user_app/theme/app_theme.dart';
import 'package:couldai_user_app/screens/login_screen.dart';
import 'package:couldai_user_app/screens/home_screen.dart';
import 'package:couldai_user_app/screens/schedule_screen.dart';
import 'package:couldai_user_app/screens/assignments_screen.dart';

void main() {
  runApp(const SchoolApp());
}

class SchoolApp extends StatelessWidget {
  const SchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/login',
      routes: {
        '/': (context) => const LoginScreen(), // Default route
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/schedule': (context) => const ScheduleScreen(),
        '/assignments': (context) => const AssignmentsScreen(),
      },
    );
  }
}
