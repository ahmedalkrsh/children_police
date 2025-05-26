// CallScreen مبسط
import 'package:children_police/core/constants/colors.dart';
import 'package:children_police/core/constants/sizes.dart';
import 'package:children_police/core/widgets/gradient_background.dart';
import 'package:children_police/features/calling/presentation/logic/call_controller.dart';
import 'package:children_police/features/calling/presentation/widgets/call_header.dart';
import 'package:children_police/features/calling/presentation/widgets/end_call_button.dart';
import 'package:children_police/features/calling/presentation/widgets/logp_pulse.dart';
import 'package:children_police/features/calling/presentation/widgets/sound_wave_indicator.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  final String dialect;
  final Color color;

  const CallScreen({required this.dialect, required this.color, super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> with TickerProviderStateMixin {
  late CallController _callController;

  @override
  void initState() {
    super.initState();
    _callController = CallController(vsync: this);
    _callController.setupAnimations();
    _callController.startCall(widget.dialect);
  }

  @override
  void dispose() {
    _callController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        colors: [
          AppColors.blueDark900,
          AppColors.blueDark700,
          AppColors.blueDark600,
        ],
        child: SafeArea(
          child: Column(
            children: [
              const CallHeader(),
              
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogoPulse(animation: _callController.pulseAnimation),
                    
                    const SizedBox(height: AppSizes.paddingExtraLarge),
                    
                    SoundWaveIndicator(controller: _callController.waveController),
                  ],
                ),
              ),
              
              EndCallButton(
                onTap: () {
                  _callController.endCall(() {
                    if (mounted) {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    }
                  });
                },
              ),
              
              const SizedBox(height: AppSizes.paddingMedium),
            ],
          ),
        ),
      ),
    );
  }
}