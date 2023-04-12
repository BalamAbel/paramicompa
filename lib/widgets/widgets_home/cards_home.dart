// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proyecto_currys/pages/home/consumo/login_page.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/configuracion.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/creacion_curriculum.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/ver_curriculums.dart';
import 'package:proyecto_currys/widgets/skills_seletion.dart';
import 'package:proyecto_currys/widgets/widgets_home/card_home.dart';

class cardsHome extends StatelessWidget {
  const cardsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const innecesario(),
          const SizedBox(
            height: 20,
          ),
          cardHome(
            texto: 'Crear Curriculum',
            icono: Icons.edit_document,
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: ((context) => const SecondRoute())),
            ),
          ),
          cardHome(
            texto: 'Ver Curriculums',
            icono: Icons.remove_red_eye_sharp,
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: ((context) => const Ver_curriculum())),
            ),
          ),
        ],
      ),
    );
  }
}

class innecesario extends StatelessWidget {
  const innecesario({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Bienvedid@ a",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  "Curry's",
                  style: TextStyle(
                    color: Color.fromARGB(255, 57, 73, 171),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
