import 'package:intl/intl.dart';

String setupDateFormate(String date) {
  DateTime value = DateTime.parse(date);
  var result = DateFormat('yMMMMd').format(value);
  return result;
}
