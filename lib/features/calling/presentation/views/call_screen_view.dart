import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  final String dialect;
  final Color color;

  const CallScreen({required this.dialect, required this.color});

  @override
  State<CallScreen> createState() => _CallScreenState();
}
class _CallScreenState extends State<CallScreen> with TickerProviderStateMixin {
  final AudioPlayer _player = AudioPlayer();
  late AnimationController _pulseController;
  late AnimationController _waveController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _waveAnimation;
  bool _isDisposed = false; // Flag to track disposal

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startCall();
  }

  void _setupAnimations() {
    _pulseController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();
    
    _waveController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    
    _waveAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _waveController, curve: Curves.easeOut),
    );
  }

  Future<void> _startCall() async {
    try {
      await _player.play(AssetSource('audio/${widget.dialect}.m4a'));
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  Future<void> _endCall() async {
    if (!_isDisposed) {
      await _player.stop();
      _pulseController.stop();
      _waveController.stop();
      if (mounted) {
        Navigator.popUntil(context, (route) => route.isFirst);
      }
    }
  }

  @override
  void dispose() {
    if (!_isDisposed) {
      _isDisposed = true;
      _player.dispose();
      _pulseController.dispose();
      _waveController.dispose();
    }
    super.dispose();
  }

  @override
 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade900,
            Colors.blue.shade700,
            Colors.blue.shade500,
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView( // Add SingleChildScrollView here
          child: Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      'مكالمة جارية',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'شرطة الأطفال',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Main content
              Container(
                height: MediaQuery.of(context).size.height * 0.6, // Limit height
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Wave Animation
                      AnimatedBuilder(
                        animation: _waveAnimation,
                        builder: (context, child) {
                          return Stack(
                            alignment: Alignment.center,
                            children: List.generate(3, (index) {
                              return Container(
                                width: 100 + (index * 40) * _waveAnimation.value,
                                height: 100 + (index * 40) * _waveAnimation.value,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white.withOpacity(
                                      (1 - _waveAnimation.value) * 0.5,
                                    ),
                                    width: 2,
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                      
                      // Police Icon with Pulse
                      AnimatedBuilder(
                        animation: _pulseAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _pulseAnimation.value,
                            child: Container(
                              width: 75,
                              height: 75,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.local_police,
                                size: 50,
                                color: Colors.blue.shade600,
                              ),
                            ),
                          );
                        },
                      ),
                      
                      SizedBox(height: 60),
                      
                      // Sound Waves Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return AnimatedBuilder(
                            animation: _waveController,
                            builder: (context, child) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 2),
                                width: 4,
                                height: 20 + (index * 5) * 
                                  (0.5 + 0.5 * (1 + _waveController.value).abs()),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              
              // End Call Button
              Container(
                padding: EdgeInsets.all(16), // Reduced padding
                child: Container(
                  width: 80,
                  height: 80,
                  child: Material(
                    elevation: 10,
                    shape: CircleBorder(),
                    child: InkWell(
                      customBorder: CircleBorder(),
                      onTap: _endCall,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.red.shade400, Colors.red.shade600],
                          ),
                        ),
                        child: Icon(
                          Icons.call_end,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}}