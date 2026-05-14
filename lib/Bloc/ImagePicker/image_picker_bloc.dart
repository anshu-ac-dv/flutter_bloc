import 'package:bloc/bloc.dart';
import 'package:bloc_learning/Utils/image_picker_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryPicker>(_galleryPicker);
  }

  Future<void> _cameraCapture(CameraCapture event, Emitter<ImagePickerState> emit) async {
    try {
      XFile? file = await imagePickerUtils.cameraCapture();
      if (file != null) {
        emit(state.copyWith(file: file));
      }
    } catch (e) {
      if (kDebugMode) {
        print("Camera Error: $e");
      }
    }
  }

  Future<void> _galleryPicker(GalleryPicker event, Emitter<ImagePickerState> emit) async {
    try {
      XFile? file = await imagePickerUtils.galleryPicker();
      if (file != null) {
        emit(state.copyWith(file: file));
      }
    } catch (e) {
      if (kDebugMode) {
        print("Gallery Error: $e");
      }
    }
  }
}
