import 'dart:io';
import 'package:bloc_learning/Bloc/ImagePicker/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagePickerBloc, ImagePickerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Image Picker")),
          body: Center(
            child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
                if (state.file == null) {
                  return InkWell(
                    onTap: () {
                      context.read<ImagePickerBloc>().add(CameraCapture());
                    },
                    child: CircleAvatar(child: Icon(Icons.camera)),
                  );
                } else {
                  return Image.file(File(state.file!.path.toString()));
                }
              },
            ),
          ),
        );
      },
    );
  }
}
