import 'dart:math';

int generateRandomNumber() {
  final random = Random();
  int number = random.nextInt(4800) + 1750;
  return number;
}
