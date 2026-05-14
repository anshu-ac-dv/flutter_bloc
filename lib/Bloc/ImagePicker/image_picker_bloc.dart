import 'package:bloc/bloc.dart';
import 'package:bloc_learning/Utils/image_picker_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerInitial()) {
    on<CameraCapture>(cameraCapture);
  }

  void cameraCapture(CameraCapture event, Emitter<ImagePickerState> states)async{
    XFile? file =await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }
}
