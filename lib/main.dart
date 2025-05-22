import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(ChildPoliceApp());
}

class ChildPoliceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شرطة الأطفال',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 8,
            shadowColor: Colors.black26,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: DialectSelectionScreen(),
    );
  }
}

// شاشة اختيار اللهجة
class DialectSelectionScreen extends StatelessWidget {
  final Map<String, Map<String, dynamic>> dialects = {
    'egept': {
      'name': 'مصري',
      'icon': Icons.location_city,
      'color': Colors.red,
      'gradient': [Colors.red.shade400, Colors.red.shade600],
    },
    'syrian': {
      'name': 'سوري',
      'icon': Icons.mosque,
      'color': Colors.green,
      'gradient': [Colors.green.shade400, Colors.green.shade600],
    },
    'golf': {
      'name': 'خليجي',
      'icon': Icons.oil_barrel,
      'color': Colors.orange,
      'gradient': [Colors.orange.shade400, Colors.orange.shade600],
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade100,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header Section
              Container(
                padding: EdgeInsets.all(32),
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.shield,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      'شرطة الأطفال',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'اختر اللهجة المناسبة',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Dialects List
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: ListView.builder(
                    itemCount: dialects.length,
                    itemBuilder: (context, index) {
                      final entry = dialects.entries.elementAt(index);
                      final dialectData = entry.value;
                      
                      return Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) =>
                                      StartCallScreen(
                                    dialect: entry.key,
                                    label: dialectData['name'],
                                    color: dialectData['color'],
                                  ),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    return SlideTransition(
                                      position: animation.drive(
                                        Tween(begin: Offset(1.0, 0.0), end: Offset.zero),
                                      ),
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: dialectData['gradient'],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Icon(
                                      dialectData['icon'],
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      dialectData['name'],
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// شاشة زر بدء المكالمة
class StartCallScreen extends StatelessWidget {
  final String dialect;
  final String label;
  final Color color;

  const StartCallScreen({
    required this.dialect,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              color.withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios, color: color),
                    ),
                    Expanded(
                      child: Text(
                        'اللهجة: $label',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 40), // Balance the back button
                  ],
                ),
              ),
              
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Police Badge Animation
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            color.withOpacity(0.2),
                            color.withOpacity(0.1),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: color.withOpacity(0.4),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.local_police,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 40),
                    
                    Text(
                      'جاهز للاتصال',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    
                    SizedBox(height: 16),
                    
                    Text(
                      'اضغط الزر لبدء مكالمة شرطة الأطفال',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    SizedBox(height: 60),
                    
                    // Call Button
                    Container(
                      width: 200,
                      height: 200,
                      child: Material(
                        elevation: 15,
                        shape: CircleBorder(),
                        child: InkWell(
                          customBorder: CircleBorder(),
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                    CallScreen(dialect: dialect, color: color),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return FadeTransition(opacity: animation, child: child);
                                },
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Colors.green.shade400, Colors.green.shade600],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.call,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'ابدأ المكالمة',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// شاشة الاتصال
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