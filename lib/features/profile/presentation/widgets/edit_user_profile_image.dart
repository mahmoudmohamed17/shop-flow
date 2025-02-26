import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';

class EditUserProfileImage extends StatefulWidget {
  const EditUserProfileImage({
    super.key,
    this.onTap,
  });

  final Function(bool)? onTap;

  @override
  State<EditUserProfileImage> createState() => _EditUserProfileImageState();
}

class _EditUserProfileImageState extends State<EditUserProfileImage> {
  File? _imageFile;
  final _imagePicker = ImagePicker();
  bool isImageChanged = false;

  Future<void> _pickImage() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
      await Future.delayed(const Duration(seconds: 2), () {
        SharedPrefs.setString(profileImage, _imageFile!.path);
        widget.onTap?.call(!isImageChanged);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        decoration: BoxDecoration(
          color: borderFillColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(4),
        child: Icon(
          FontAwesomeIcons.penToSquare,
          size: 20,
          color: Color(0xff1E3050),
        ),
      ),
    );
  }
}
