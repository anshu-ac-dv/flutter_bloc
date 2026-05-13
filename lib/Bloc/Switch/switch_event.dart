part of 'switch_bloc.dart';

@immutable
sealed class SwitchEvent {
  const SwitchEvent();
}

class EnableOrDisableNotification extends SwitchEvent {
  const EnableOrDisableNotification();
}

class SliderEvent extends SwitchEvent {
  final double slider;
  const SliderEvent({required this.slider});
}
