import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget{
  final Exam exams;

  const ExamCard({super.key,required this.exams});

  Color _getCardColor() {
    final now = DateTime.now();
    final today = DateTime(now.year,now.month,now.day);
    final examDay = DateTime(exams.date.year,exams.date.month,exams.date.day);

    if (examDay.isBefore(today)){
      return Colors.grey.shade300;
    } else if (examDay.isAtSameMomentAs(today)){
      return Colors.red.shade300;
    } else {
      return Colors.green.shade300;
    }
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context,
            '/details',
            arguments: {'exam' : exams, 'color': _getCardColor()});
      },
      child: Card(
      color: _getCardColor(),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.purple.shade300, width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(exams.subject,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,),
              ),
            Divider(),
            Text(DateFormat('dd.MM.yyyy').format(exams.date),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,),
            ),
          ],
        )
        ),
      )
    );
  }
}