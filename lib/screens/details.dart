import 'package:flutter/material.dart';

import '../models/exam.dart';
import 'package:intl/intl.dart';
class DetailsPage extends StatelessWidget{
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final exam = arguments['exam'] as Exam;
    final remaining = exam.date.difference(DateTime.now());
    final cardColor = arguments['color'] as Color;


    Text _timeLeft() {
      if (remaining.inDays < 0){
        final days_passed = remaining.inDays.abs();
        return Text(
          "Испитот заврши пред $days_passed дена",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight:FontWeight.bold
              ,color: Colors.red,
              fontSize: 18)
        );
      }else if(remaining.inDays == 0 && remaining.inHours>=0)
      {
        return Text(
          'Време преостанато: ${remaining.inHours} часа',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        );
      }
      else
        {
          return Text(
            'Време преостанато: ${remaining.inDays} дена, ${remaining.inHours % 24} часа',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          );
        }
    }

    return Scaffold(
      backgroundColor: cardColor,
      appBar: AppBar(
        title: Text(
          exam.subject.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Color.lerp(cardColor, Colors.black, 0.1),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child:Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.blue.shade300,
                width: 5),
            borderRadius: BorderRadius.circular(20),
          ),
          child:Padding(
              padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.school_rounded,
                  size: 60,
                  color: Colors.green,
                ),
                const SizedBox(height: 10,),
                Text(
                  exam.subject.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),),
                const SizedBox(height: 5),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.meeting_room_rounded,
                      color: Colors.blue,
                      size: 24,
                    ),
                      const SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                        'Просторија: ${exam.classrooms.join(', ')}',
                        textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                  ]
                ),
                const SizedBox(height: 20),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        color: Colors.blue,
                        size: 24,
                      ),
                      const SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'Датум и време: ${DateFormat('dd.MM.yyyy, HH:mm').format(exam.date)}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ]
                ),

                const SizedBox(height: 20),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.blue,
                        size: 24,
                      ),
                      const SizedBox(width: 10,),
                      Flexible(
                        child: _timeLeft(),
                        ),
                    ],
                ),


              ],
            ))),
        ),
    );
  }
}