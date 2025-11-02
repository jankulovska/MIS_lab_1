import 'package:flutter/material.dart';
import '../models/exam.dart';


class ExamDetailScreen extends StatelessWidget {
  static const routeName = '/detail';
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});


  String _formatDateTime(DateTime dt) {
    final local = dt.toLocal();
    final day = local.day.toString().padLeft(2, '0');
    final month = local.month.toString().padLeft(2, '0');
    final year = local.year;
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '$day.$month.$year $hour:$minute';
  }


  String _remainingTimeString(DateTime dt) {
    final now = DateTime.now();
    final diff = dt.difference(now);
    if (diff.isNegative) {
      return 'Испитот е поминат';
    }
    final days = diff.inDays;
    final hours = diff.inHours - days * 24;
    return '$days дена, $hours часа';
  }


  @override
  Widget build(BuildContext context) {
    final isPast = exam.dateTime.isBefore(DateTime.now());
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text(exam.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exam.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(children: [const Icon(Icons.calendar_today), const SizedBox(width: 8), Text(_formatDateTime(exam.dateTime))]),
                    const SizedBox(height: 8),
                    Row(children: [const Icon(Icons.meeting_room), const SizedBox(width: 8), Text(exam.rooms.join(', '))]),
                    const SizedBox(height: 12),
                    Row(children: [const Icon(Icons.access_time), const SizedBox(width: 8), Text(_remainingTimeString(exam.dateTime))]),
                    const SizedBox(height: 12),
                    if (isPast) Text('Статус: Завршен', style: TextStyle(color: Colors.grey[700])) else Text('Статус: Не е завршен', style: TextStyle(color: Colors.green[700])),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}