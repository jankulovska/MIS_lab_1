import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class HomeScreen extends StatefulWidget{
  final String indexNumber;
  const HomeScreen({super.key, required this.indexNumber});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  late List<Exam> exams;

  @override
  void initState(){
    super.initState();
    exams = _loadExams();
    exams.sort((a,b) => a.dateTime.compareTo(b.dateTime)); // hronoloski
  }

  List<Exam> _loadExams(){
    final now = DateTime.now();
    return [
      Exam(title: 'Структурно програмирање', dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: 1, hours: 9)), rooms: ['A1']),
      Exam(title: 'Објектно програмирање', dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: -1, hours: 3)), rooms: ['B1']),
      Exam(title: 'Основи на веб дизајн', dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: 5, hours: 10)), rooms: ['C1', 'C2']),
      Exam(title: 'Бизнис статистика', dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: -3, hours: 2)), rooms: ['D1']),
      Exam(title: 'Бази на податоци', dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: 4, hours: 9)), rooms: ['E1']),
      Exam(title: 'Алгоритми и податочни структури', dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: 6, hours: 6)), rooms: ['F1', 'F2']),
      Exam(title: 'Софтверско инженерство', dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: 2, hours: 4)), rooms: ['G1']),
      Exam(title: 'Маркетинг', dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: 1, hours: 9)), rooms: ['H1']),
      Exam(title: 'Вештачка интелигенција', dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: -7, hours: 5)), rooms: ['I1', 'I2', 'I3']),
      Exam(title: 'Електронска и мобилна трговија', dateTime: DateTime(now.year, now.month, now.day).add(const Duration(days: 3, hours: 8)), rooms: ['J1'])
    ];
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text('Распоред за испити - ${widget.indexNumber}',),
        // backgroundColor: Colors.orange.shade100,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: exams.length,
          itemBuilder: (context, index){
            final exam = exams[index];
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, ExamDetailScreen.routeName, arguments: exam);
              },
              child: ExamCard(exam: exam),
            );
          }
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Chip(
                label: Text('Вкупно: ${exams.length}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
