import 'package:children_police/features/calling/presentation/views/call_screen_view.dart';
import 'package:flutter/material.dart';

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

