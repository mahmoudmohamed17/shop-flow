import 'dart:developer';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermission() async {
  var status = await Permission.photos.request();
  if (status.isDenied) {
    log('Permission Denied!');
  } else {
    log('Permission Granted!');
  }
}
