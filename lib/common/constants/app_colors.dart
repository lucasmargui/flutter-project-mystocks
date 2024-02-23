//Criando uma classe AppColors passando o construtor internamente AppColors._(); para que não seja necessário instancia-la pois só queremos acessar suas propriedades

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color bluedarkOne = Color.fromARGB(246, 1, 10, 24);
  static const Color bluedarkTwo = Color.fromARGB(255, 0, 0, 0);
  static const Color white = Colors.white;

  static const List<Color> blueDarkGradient = [
    Color.fromARGB(246, 1, 10, 24),
    Color.fromARGB(255, 0, 0, 0)
  ];
}
