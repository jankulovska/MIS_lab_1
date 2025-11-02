import 'package:flutter/material.dart';
import 'models/exam.dart';
import 'screens/home_screen.dart';
import 'screens/exam_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      routes: {
        '/': (context) => const HomeScreen(indexNumber:'223227'),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ExamDetailScreen.routeName) {
          final args = settings.arguments as Exam;
          return MaterialPageRoute(
            builder: (context) => ExamDetailScreen(exam: args),
          );
        }
        return null;
      },
    );
  }
}

