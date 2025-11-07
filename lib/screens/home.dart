import 'package:flutter/material.dart';
import 'package:test_proj/models/exam.dart';
import 'dart:math';
import '../widgets/exam_grid.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  final List<Exam> exams = List.generate(10, (index){
    final subjects = [
      "Математика 1",
      "Структурно програмирање",
      "Објектно-ориентирано програмирање",
      "Дискретна математика",
      "Веројатност и статистика",
      "Напредно програмирање",
      "Вештачка интелигенција",
      "Вовед во наука на податоци",
      "Бази на податоци",
      "МИС"
    ];

    final rand = Random();
    final examDate = DateTime.now().add(
                        Duration(
                          days: rand.nextInt(15) - 7,
                          hours: 9+index,));
    final rooms = ['L${index+1}', 'B${index + 2}'];

    return Exam(
      subject: subjects[index % subjects.length],
      date: examDate,
      classrooms: rooms,
    );
  });

  @override
  void initState() {
    super.initState();
    exams.sort((a, b) => a.date.compareTo(b.date));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        foregroundColor: Colors.white,
        title: Text(
          textAlign: TextAlign.center,
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(
            child: ExamGrid(exams: exams),
          ),
          SizedBox(height: 8),
          //Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),

            ),
            child: Text(
              'Вкупно испити ${exams.length}',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      ),
    );
  }

}