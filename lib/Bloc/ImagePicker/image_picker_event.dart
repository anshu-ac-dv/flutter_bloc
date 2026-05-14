part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerEvent {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

class CameraCapture extends ImagePickerEvent{

}

class GalleryPicker extends ImagePickerEvent{
  
}