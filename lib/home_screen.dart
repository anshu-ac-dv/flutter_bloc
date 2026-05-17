import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Counter/counter_screen.dart';
import 'ImagePicker/image_picker.dart';
import 'Switch/switch_screen.dart';
import 'Todo/todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Learning Roadmap',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProgressHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPhaseSection(
                    phase: 'Phase 3: BLoC Fundamentals',
                    level: 'Intermediate',
                    isCompleted: true,
                    children: [
                      _FeatureCard(
                        title: 'Counter App',
                        description: 'State, Events & Equatable',
                        icon: FontAwesomeIcons.calculator,
                        color: Colors.blue,
                        level: 'Lvl 1',
                        onTap: () =>
                            _navigateTo(context, const CounterScreen()),
                      ),
                      const SizedBox(height: 12),
                      _FeatureCard(
                        title: 'Switch & Slider',
                        description: 'Multi-property state management',
                        icon: FontAwesomeIcons.sliders,
                        color: Colors.orange,
                        level: 'Lvl 2',
                        onTap: () => _navigateTo(context, const SwitchScreen()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildPhaseSection(
                    phase: 'Phase 4: Advanced Integration',
                    level: 'Advanced',
                    isCompleted: false,
                    children: [
                      _FeatureCard(
                        title: 'Native Image Picker',
                        description: 'Platform APIs & Utils abstraction',
                        icon: FontAwesomeIcons.camera,
                        color: Colors.green,
                        level: 'Lvl 3',
                        isNew: true,
                        onTap: () =>
                            _navigateTo(context, const ImagePickerScreen()),
                      ),
                      const SizedBox(height: 12),
                      _FeatureCard(
                        title: 'Quest List (Todo)',
                        description: 'List manipulation & BLoC state',
                        icon: FontAwesomeIcons.clipboardList,
                        color: Colors.purple,
                        level: 'Lvl 3+',
                        onTap: () => _navigateTo(context, const TodoScreen()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildPhaseSection(
                    phase: 'Phase 5: Production Ready',
                    level: 'Expert',
                    isCompleted: false,
                    isLocked: true,
                    children: [
                      _FeatureCard(
                        title: 'API & Repositories',
                        description: 'Clean Architecture with Cubit',
                        icon: FontAwesomeIcons.database,
                        color: Colors.grey,
                        level: 'Lvl 4',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 30),
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Overall Progress',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Text(
                '75%',
                style: TextStyle(
                  color: Colors.white.withAlpha(230),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.75,
              backgroundColor: Colors.white.withAlpha(50),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Keep going, Anshu!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'You are mastering Advanced Integration.',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseSection({
    required String phase,
    required String level,
    required bool isCompleted,
    bool isLocked = false,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            FaIcon(
              isLocked
                  ? FontAwesomeIcons.lock
                  : (isCompleted
                        ? FontAwesomeIcons.circleCheck
                        : FontAwesomeIcons.circleDot),
              size: 16,
              color: isLocked
                  ? Colors.grey
                  : (isCompleted ? Colors.green : Colors.blueAccent),
            ),
            const SizedBox(width: 8),
            Text(
              phase.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: isLocked ? Colors.grey : Colors.blueGrey[800],
                letterSpacing: 1.1,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: (isLocked ? Colors.grey : Colors.blueAccent).withAlpha(
                  25,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                level,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: isLocked ? Colors.grey : Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final dynamic icon;
  final Color color;
  final String level;
  final bool isNew;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.level,
    this.isNew = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isLocked = color == Colors.grey;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLocked ? null : onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: color.withAlpha(25),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: FaIcon(icon, color: color, size: 20),
                    ),
                    if (isNew)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isLocked ? Colors.grey : Colors.black87,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            level,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        description,
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),
                FaIcon(
                  isLocked
                      ? FontAwesomeIcons.lock
                      : FontAwesomeIcons.chevronRight,
                  color: Colors.grey[300],
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
