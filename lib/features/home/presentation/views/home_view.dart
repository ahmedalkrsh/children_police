import 'package:children_police/features/start_calling/presentation/views/start_calling_view.dart';
import 'package:flutter/material.dart';

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