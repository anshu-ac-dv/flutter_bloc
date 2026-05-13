part of 'switch_bloc.dart';

@immutable
sealed class SwitchState {
  final bool isEnable;
  final double slider;

  const SwitchState({
    this.isEnable = false,
    this.slider = 1.0,
  });

  SwitchState copyWith({bool? isEnable, double? slider}) {
    return SwitchInitial(
      isEnable: isEnable ?? this.isEnable,
      slider: slider ?? this.slider,
    );
  }
}

final class SwitchInitial extends SwitchState {
  const SwitchInitial({
    super.isEnable = false,
    super.slider = 1.0,
  });
}
