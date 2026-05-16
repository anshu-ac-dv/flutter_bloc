import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/Switch/switch_bloc.dart';

/// [SwitchScreen] demonstrates multi-property state management.
/// One Bloc handles both the boolean (Switch) and double (Slider) values.
class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Property Controller', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- SECTION 1: Notifications (Boolean State) ---
                const Text(
                  "SETTINGS",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2),
                ),
                const SizedBox(height: 16),
                _buildControlCard(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            state.isEnable ? Icons.notifications_active : Icons.notifications_off,
                            color: state.isEnable ? Colors.orange : Colors.grey,
                          ),
                          const SizedBox(width: 15),
                          const Text("Push Notifications", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Switch.adaptive(
                        value: state.isEnable,
                        activeColor: Colors.orange,
                        onChanged: (newValue) {
                          // Dispatch Event: Toggle Notification
                          context.read<SwitchBloc>().add(const EnableOrDisableNotification());
                        },
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // --- SECTION 2: Dynamic Opacity (Double State) ---
                const Text(
                  "VISUALS",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2),
                ),
                const SizedBox(height: 16),
                _buildControlCard(
                  child: Column(
                    children: [
                      // This box reacts to the slider state in real-time
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(state.slider),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.orange.withOpacity(0.3)),
                        ),
                        child: Center(
                          child: Text(
                            "${(state.slider * 100).toInt()}%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: state.slider > 0.4 ? Colors.white : Colors.orange,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Slider(
                        value: state.slider,
                        activeColor: Colors.orange,
                        inactiveColor: Colors.orange.withOpacity(0.1),
                        onChanged: (value) {
                          // Dispatch Event: Update Slider value
                          context.read<SwitchBloc>().add(SliderEvent(slider: value));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Wrapper to give controls a clean, elevated look
  Widget _buildControlCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 5))
        ],
      ),
      child: child,
    );
  }
}
