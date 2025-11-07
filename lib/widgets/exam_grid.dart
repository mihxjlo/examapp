import 'package:flutter/cupertino.dart';
import 'package:test_proj/models/exam.dart';
import 'package:test_proj/widgets/exam_card.dart';

class ExamGrid extends StatefulWidget {
  final List<Exam> exams;

  const ExamGrid({super.key, required this.exams});


  @override
  State<StatefulWidget> createState() => _ExamGridState();

}

class _ExamGridState extends State<ExamGrid>{

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: 200/244
        ),
        itemCount: widget.exams.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index) {
          return ExamCard(exams: widget.exams[index]);
        },
    );
  }

}