//Criando uma classe AppColors passando o construtor internamente AppTextStyles._(); para que não seja necessário instancia-la pois só queremos acessar suas propriedades

import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle bigText =
      TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700);

  static const TextStyle mediumText =
      TextStyle(fontSize: 36.0, fontWeight: FontWeight.w700);

  static const TextStyle mediumText18 =
      TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);

  static const TextStyle smallText =
      TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500);

  static const TextStyle inputLabelText =
      TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500);
}
