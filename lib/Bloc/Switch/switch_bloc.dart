import 'package:bloc/bloc.dart';
import "package:meta/meta.dart";

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial()) {
    on<EnableOrDisableNotification>(_onEnableOrDisableNotification);
    on<SliderEvent>(_onSliderEvent);
  }

  void _onEnableOrDisableNotification(EnableOrDisableNotification event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isEnable: !state.isEnable));
  }

  void _onSliderEvent(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
