// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proyecto_currys/dtos/request/curriculum_request_dto.dart';
import 'package:proyecto_currys/dtos/response/curriculums_responseDto.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_currys/pages/home/paginas_principales/creacion_curriculum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurriculumsProviders extends ChangeNotifier {
  final logger = Logger();
  bool isloading = true;
  bool userFound = true;
  CurriculumRequestDto? _CurriculumRequestDto;
  // CurriculumResponseDto? get curriculumResponseDto => _CurriculumResponseDto;
  List<CurriculumRequestDto>? _curriculums;

  Future createCurriculum(
      String nombre,
      String apellidos,
      String correo,
      String telefono,
      String direccion,
      String descripcion,
      List<Education> educacion,
      List<Experience> experiencia,
      BuildContext context) async {
    print("entrooo");
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? nombres = prefs.getString('nombres');

    // String? apellidos = prefs.getString('apellidos');
    // String? email = prefs.getString('email');
    // String? telefono = prefs.getString('telefono');
    // String? direccion = prefs.getString('direccion');
    // String? descripcionn = prefs.getString('descripcionn');

    // List<String>? institucion = prefs.getStringList('institucion');
    // List<String>? grado = prefs.getStringList('grado');
    // List<String>? campoEstudio = prefs.getStringList('campoEstudio');
    // List<String>? fechaInicioo = prefs.getStringList('fechaInicio2');
    // List<String>? fechafiin = prefs.getStringList('fechafiin2');

    // List<String>? compania = prefs.getStringList('compania');
    // List<String>? posicion = prefs.getStringList('posicion');
    // List<String>? fechainicioo = prefs.getStringList('fechaInicio');
    // List<String>? fechafiiin = prefs.getStringList('fechafiin');
    // Imprimir los valores
    // print("DATOS PERSONALES se debe crear el post ");
    // print('nombre: $nombres');
    // print('apellidos: $apellidos');
    // print('email: $email');
    // print('telefono: $telefono');
    // print('direccion $direccion');
    // print('descripcion:$descripcionn');

    // print("EXPERINCIA LABORAL");
    // print('compania: $compania');
    // print('posicion: $posicion');
    // print('fecha_inicioo: $fechainicioo');
    // print('fecha_fiin: $fechafiiin');

    // print("FORMACION");
    // print('institucion: $institucion');
    // print('formacion: $grado');
    // print('localidad: $campoEstudio');
    // print('inicio: $fechaInicioo');
    // print('fin: $fechafiin');
    final curriculum = CurriculumRequestDto(
        firstName: nombre,
        lastName: apellidos,
        email: correo,
        phoneNumber: telefono,
        address: direccion,
        summary: descripcion,
        education: educacion,
        experience: experiencia);

    // final curriculum = CurriculumRequestDto(
    //     firstName: nombres.toString(),
    //     lastName: apellidos.toString(),
    //     email: email.toString(),
    //     phoneNumber: telefono.toString(),
    //     address: direccion.toString(),
    //     summary: descripcionn.toString(),
    //     education: [
    //       Education(
    //           institution: institucion.toString(),
    //           degree: grado.toString(),
    //           fieldOfStudy: campoEstudio.toString(),
    //           startDate: fechaInicioo.toString(),
    //           endDate: fechafiin.toString())
    //     ],
    //     experience: [
    //       Experience(
    //           company: compania.toString(),
    //           position: posicion.toString(),
    //           startDate: fechainicioo.toString(),
    //           endDate: fechafiiin.toString())
    //     ]);

    final response = await http.post(
        Uri.parse('http://currysapi.somee.com/api/curriculum'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(curriculum));
    print(response.statusCode);
    if (response.statusCode == 200) {
      if (context.mounted) {
        userFound = true;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Haz creado tu Curriculum Vitae'),
              content:
                  const Text('ya puedes Consultar tu curriculum desde la web'),
              actions: [
                TextButton(
                  child: const Text('Entendido'),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const SecondRoute()));
                  },
                ),
              ],
            );
          },
        );
      } else {
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error al crear'),
                content: const Text('no se pudo crear tu Curriculum Vitae'),
                actions: [
                  TextButton(
                    child: const Text('Entendido'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      }
    }
  }
}
