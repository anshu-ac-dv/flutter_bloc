import 'dart:io';
import 'package:bloc_learning/Bloc/ImagePicker/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Picker")),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            if (state.file == null) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<ImagePickerBloc>().add(CameraCapture());
                    },
                    child: const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.camera_alt, size: 40),
                    ),
                  ),
                  const SizedBox(width: 40),
                  InkWell(
                    onTap: () {
                      context.read<ImagePickerBloc>().add(GalleryPicker());
                    },
                    child: const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.photo_library, size: 40),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.file(File(state.file!.path)),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<ImagePickerBloc>().add(CameraCapture());
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text("Retake"),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
