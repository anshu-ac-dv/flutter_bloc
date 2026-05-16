import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Bloc/Counter/counter_bloc.dart';
import '../Bloc/Counter/counter_event.dart';
import '../Bloc/Counter/counter_state.dart';

/// [CounterScreen] demonstrates the most basic BLoC implementation.
/// It uses [BlocBuilder] to rebuild only the text widget when the state changes.
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Counter Master', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- UI: The Counter Display Card ---
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withAlpha(25),
                    blurRadius: 20,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Current Value',
                    style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  // BLoC Integration: BlocBuilder listens for state changes
                  BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      return Text(
                        '${state.counter}',
                        style: const TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            
            // --- UI: Interactive Control Buttons ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton(
                  context,
                  icon: FontAwesomeIcons.minus,
                  color: Colors.redAccent,
                  // Dispatching Decrement Event
                  onPressed: () => context.read<CounterBloc>().add(CounterDecrementEvent()),
                ),
                const SizedBox(width: 20),
                _buildActionButton(
                  context,
                  icon: FontAwesomeIcons.rotate,
                  color: Colors.orangeAccent,
                  isLarge: false,
                  // Dispatching Reset Event
                  onPressed: () => context.read<CounterBloc>().add(CounterResetEvent()),
                ),
                const SizedBox(width: 20),
                _buildActionButton(
                  context,
                  icon: FontAwesomeIcons.plus,
                  color: Colors.greenAccent,
                  // Dispatching Increment Event
                  onPressed: () => context.read<CounterBloc>().add(CounterIncrementEvent()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create consistent interactive buttons
  Widget _buildActionButton(
    BuildContext context, {
    required dynamic icon,
    required Color color,
    required VoidCallback onPressed,
    bool isLarge = true,
  }) {
    double size = isLarge ? 70 : 55;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color.withAlpha(38),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: FaIcon(icon, color: color, size: isLarge ? 24 : 18),
        onPressed: onPressed,
      ),
    );
  }
}
