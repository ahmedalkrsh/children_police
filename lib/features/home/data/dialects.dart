import 'package:children_police/core/constants/colors.dart';
import 'package:flutter/material.dart';

class Dialects {
   static final Map<String, Map<String, dynamic>> dialects = {
    'egept': {
      'name': 'مصري',
      'icon': Icons.location_city,
      'color': Colors.red,
      'gradient': [AppColors.redLight400, AppColors.redDark600],
    },
    'syrian': {
      'name': 'سوري',
      'icon': Icons.mosque,
      'color': Colors.green,
      'gradient': [AppColors.greenLight400, AppColors.greenDark600],
    },
    'golf': {
      'name': 'خليجي',
      'icon': Icons.oil_barrel,
      'color': Colors.orange,
      'gradient': [AppColors.orangeLight400, AppColors.orangeDark600],
    },
      'girls': {
      'name': 'البنات',
      'icon': Icons.favorite, // Changed to a more appropriate icon
      'color': Colors.purple,
      'gradient': [AppColors.burble, AppColors.burbleDark], // Assuming you have purple colors
    },
  };


}