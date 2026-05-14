import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/Switch/switch_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Notifications'),
                        Switch(
                          value: state.isEnable,
                          onChanged: (newValue) {
                            context.read<SwitchBloc>().add(const EnableOrDisableNotification());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: 200,
                      color: Colors.red.withOpacity(state.slider),
                    ),
                    const SizedBox(height: 30),
                    Slider(
                      value: state.slider,
                      onChanged: (value) {
                        context.read<SwitchBloc>().add(SliderEvent(slider: value));
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
