// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proyecto_currys/dtos/response/curriculums_responseDto.dart';
import 'package:proyecto_currys/widgets/widgets_home/notification_home.dart';

class HomeCurriculums extends StatelessWidget {
  final CurriculumResponseDto curriculums;
  const HomeCurriculums({super.key, required this.curriculums});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Curry`s',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Text(
              'Cv Profesional',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            )
          ],
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: <Widget>[
          const notification_home(),
        ],
        shadowColor: Colors.blue[700],
        backgroundColor: Colors.blue[700],
        elevation: 5,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Card(
            color: Colors.amber.shade100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${curriculums.nombre} ${curriculums.apellidos} ${curriculums.codigoPostal}',
                  style: const TextStyle(fontSize: 40),
                ),
                Text(curriculums.puesto)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
