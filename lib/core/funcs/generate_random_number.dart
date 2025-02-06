import 'dart:math';

int generateRandomNumber() {
  final random = Random();
  //generate random numbers starting from 1750 to 6550
  int number = random.nextInt(4800) + 1750;
  return number;
}
