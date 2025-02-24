import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickingWidget extends StatefulWidget {
  const ImagePickingWidget({super.key, this.onTap});
  final Function(String)? onTap;

  @override
  State<ImagePickingWidget> createState() => _ImagePickingWidgetState();
}

class _ImagePickingWidgetState extends State<ImagePickingWidget> {
  File? _imageFile;
  final _imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
      widget.onTap?.call(_imageFile!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: _imageFile == null
          ? DottedBorder(
              borderType: BorderType.Circle,
              strokeWidth: 2,
              dashPattern: [6, 3],
              color: Colors.grey,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 45,
                  color: Colors.grey,
                ),
              ))
          : CircleAvatar(
              radius: 75,
              backgroundImage: FileImage(_imageFile!),
            ),
    );
  }
}
