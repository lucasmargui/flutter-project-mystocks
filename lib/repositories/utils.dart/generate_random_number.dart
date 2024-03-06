import 'dart:math';

class GenerateRandomNumber {
  GenerateRandomNumber._();

  static double generate() {
    int sign = Random().nextInt(2); // 0 ou 1
    int number = Random().nextInt(999); // números de 0 a 100
    return (sign == 0 ? number : -number).toDouble();
  }
}
