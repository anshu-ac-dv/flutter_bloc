import 'dart:io';
import 'package:bloc_learning/Bloc/ImagePicker/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// [ImagePickerScreen] demonstrates BLoC with native device interaction.
/// It uses a separate Utility class for the platform-specific logic.
class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Capture Moment", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- STATE: No Image Selected ---
                if (state.file == null) ...[
                  _buildEmptyStatePlaceholder(),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSourceButton(
                        context,
                        icon: FontAwesomeIcons.camera,
                        label: "Camera",
                        color: Colors.green,
                        onTap: () => context.read<ImagePickerBloc>().add(CameraCapture()),
                      ),
                      _buildSourceButton(
                        context,
                        icon: FontAwesomeIcons.images,
                        label: "Gallery",
                        color: Colors.blue,
                        onTap: () => context.read<ImagePickerBloc>().add(GalleryPicker()),
                      ),
                    ],
                  ),
                ] 
                // --- STATE: Image is Selected & Displayed ---
                else ...[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withAlpha(25), blurRadius: 20, spreadRadius: 2)
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.file(File(state.file!.path), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => context.read<ImagePickerBloc>().add(CameraCapture()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    icon: const FaIcon(FontAwesomeIcons.arrowsRotate, size: 18),
                    label: const Text("Retake Photo", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 30),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  // Visual placeholder when no image is selected
  Widget _buildEmptyStatePlaceholder() {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
          ),
          child: Center(child: const FaIcon(FontAwesomeIcons.image, size: 80, color: Color(0xFFE0E0E0))),
        ),
        const SizedBox(height: 24),
        const Text(
          "No image selected yet",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black54),
        ),
        const SizedBox(height: 8),
        const Text(
          "Choose a source below to get started",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  // Custom button for Camera/Gallery selection
  Widget _buildSourceButton(
    BuildContext context, {
    required dynamic icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color.withAlpha(25),
              borderRadius: BorderRadius.circular(20),
            ),
            child: FaIcon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 12),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }
}
