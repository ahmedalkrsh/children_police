import 'package:flutter/material.dart';
import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/sizes.dart';
import 'package:children_police/core/widgets/styled_text.dart';
import 'package:children_police/features/calling/presentation/logic/call_controller.dart';
import 'dart:math' as math;
import 'dart:async';

class EnhancedCallScreen extends StatefulWidget {
  final String dialect;
  final Color color;
  final String officerName;
  final VoidCallback onEndCall;

  const EnhancedCallScreen({
    Key? key,
    required this.dialect,
    required this.color,
    required this.officerName,
    required this.onEndCall,
  }) : super(key: key);

  @override
  State<EnhancedCallScreen> createState() => _EnhancedCallScreenState();
}

class _EnhancedCallScreenState extends State<EnhancedCallScreen>
    with TickerProviderStateMixin {
  late CallController _callController;
  late AnimationController _backgroundAnimController;
  late Animation<double> _backgroundAnimation;
  
  final List<CircleWave> _waves = [];
  int _elapsedSeconds = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _callController = CallController(vsync: this);
    _callController.setupAnimations();
    _callController.startCall(widget.dialect);

    _backgroundAnimController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _backgroundAnimation = Tween<double>(begin: 0, end: 2 * math.pi).animate(
      _backgroundAnimController,
    );

    // Create initial waves
    for (int i = 0; i < 5; i++) {
      _addWave();
    }

    // Start timer for call duration
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  void _addWave() {
    final random = math.Random();
    _waves.add(
      CircleWave(
        position: Offset(
          random.nextDouble() * MediaQuery.of(context).size.width,
          random.nextDouble() * MediaQuery.of(context).size.height,
        ),
        color: widget.color.withOpacity(0.2 + random.nextDouble() * 0.2),
        speed: 0.5 + random.nextDouble() * 1.5,
        size: 50 + random.nextDouble() * 150,
      ),
    );
  }

  String _formatDuration() {
    final minutes = _elapsedSeconds ~/ 60;
    final seconds = _elapsedSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _callController.dispose();
    _backgroundAnimController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _backgroundAnimation,
        builder: (context, child) {
          // Update wave positions
          for (var wave in _waves) {
            wave.update();
            if (wave.size > 300) {
              wave.reset(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height,
              );
            }
          }

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  widget.color.withOpacity(0.8),
                  AppColors.blueDark900,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                // Animated background waves
                ...List.generate(_waves.length, (index) {
                  final wave = _waves[index];
                  return Positioned(
                    left: wave.position.dx - wave.size / 2,
                    top: wave.position.dy - wave.size / 2,
                    child: Container(
                      width: wave.size,
                      height: wave.size,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: wave.color,
                      ),
                    ),
                  );
                }),
                
                // Main content
                SafeArea(
                  child: Column(
                    children: [
                      // Call header
                      Container(
                        padding: EdgeInsets.all(AppSizes.paddingLarge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.paddingMedium,
                                vertical: AppSizes.paddingSmall,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    _formatDuration(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.paddingMedium,
                                vertical: AppSizes.paddingSmall,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone_in_talk,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'مكالمة جارية',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Officer avatar
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedBuilder(
                              animation: _callController.pulseAnimation,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _callController.pulseAnimation.value,
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [
                                          widget.color.withOpacity(0.7),
                                          widget.color,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: widget.color.withOpacity(0.5),
                                          blurRadius: 20,
                                          spreadRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.local_police,
                                        size: 80,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: AppSizes.paddingLarge),
                            StyledText(
                              text: widget.officerName,
                              fontSize: AppSizes.fontExtraLarge,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            SizedBox(height: AppSizes.paddingSmall),
                            StyledText(
                              text: 'شرطة الأطفال',
                              fontSize: AppSizes.fontMedium,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            
                            // Sound wave visualization
                            SizedBox(height: AppSizes.paddingLarge),
                            SizedBox(
                              height: 60,
                              child: AnimatedBuilder(
                                animation: _callController.waveController,
                                builder: (context, child) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      15,
                                      (index) {
                                        final double height = 10 + 
                                            30 * math.sin(
                                              (index / 14) * math.pi * 2 + 
                                              _callController.waveAnimation.value * 10
                                            ).abs();
                                        
                                        return Container(
                                          margin: EdgeInsets.symmetric(horizontal: 2),
                                          width: 4,
                                          height: height,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(2),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // End call button
                      Padding(
                        padding: EdgeInsets.all(AppSizes.paddingLarge),
                        child: GestureDetector(
                          onTap: () {
                            _callController.endCall(widget.onEndCall);
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.call_end,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CircleWave {
  Offset position;
  Color color;
  double speed;
  double size;

  CircleWave({
    required this.position,
    required this.color,
    required this.speed,
    required this.size,
  });

  void update() {
    size += speed;
    color = color.withOpacity((color.opacity) * 0.99);
  }

  void reset(double maxWidth, double maxHeight) {
    final random = math.Random();
    position = Offset(
      random.nextDouble() * maxWidth,
      random.nextDouble() * maxHeight,
    );
    color = color.withOpacity(0.2 + random.nextDouble() * 0.2);
    speed = 0.5 + random.nextDouble() * 1.5;
    size = 50 + random.nextDouble() * 100;
  }
}
