import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class Dialects {
  static final Map<String, Map<String, dynamic>> dialects = {
    // اللهجات الأصلية
    'girls': {
      'name': 'البنات',
      'icon': Icons.favorite,
      'color': Colors.purple,
      'gradient': [AppColors.burble, AppColors.burbleDark],
    },
    
    // لهجات الطفل الهادي
    'calmEgypt': {
      'name': 'مصري هادي',
      'icon': Icons.location_city,
      'color': Colors.green.shade500, // تم التعديل
      'gradient': [AppColors.greenLight400, AppColors.greenDark600],
    },
    'calmSyrian': {
      'name': 'سوري هادي',
      'icon': Icons.mosque,
      'color': Colors.blue.shade500, // تم التعديل
      'gradient': [Colors.blue.shade400, AppColors.blueDark600], // تم التعديل
    },
    'calmGolf': {
      'name': 'خليجي هادي',
      'icon': Icons.oil_barrel,
      'color': Colors.purple.shade500, // تم التعديل
      'gradient': [AppColors.burble, AppColors.burbleDark],
    },
    
    // لهجات الطفل الشقي
    'naughtyEgypt': { // تم تصحيح الإملاء من naghtyEgypt
      'name': 'مصري شقي',
      'icon': Icons.location_city,
      'color': Colors.orange.shade500, // تم التعديل
      'gradient': [AppColors.orangeLight400, AppColors.orangeDark600],
    },
    'naughtySyrian': {
      'name': 'سوري شقي',
      'icon': Icons.mosque,
      'color': Colors.red.shade500, // تم التعديل
      'gradient': [AppColors.redLight400, AppColors.redDark600],
    },
    'naughtyGolf': {
      'name': 'خليجي شقي',
      'icon': Icons.oil_barrel,
      'color': Colors.pink.shade500, // تم التعديل
      'gradient': [Colors.pink.shade400, Colors.pink.shade600], // تم التعديل
    },
  };
}