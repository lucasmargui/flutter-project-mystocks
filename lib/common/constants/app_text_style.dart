//Criando uma classe AppColors passando o construtor internamente AppTextStyles._(); para que não seja necessário instancia-la pois só queremos acessar suas propriedades

import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle bigText =
      TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700);
}
