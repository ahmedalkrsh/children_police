import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CallController {
  final TickerProvider vsync;
  final AudioPlayer player = AudioPlayer();

  late AnimationController pulseController;
  late AnimationController waveController;
  late Animation<double> pulseAnimation;
  late Animation<double> waveAnimation;

  bool isPlaying = false;

  CallController({required this.vsync});

  void setupAnimations() {
    pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    )..repeat();

    waveController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: vsync,
    )..repeat();

    pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: pulseController, curve: Curves.easeInOut),
    );

    waveAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: waveController, curve: Curves.easeOut),
    );
  }

  Future<void> startCall(String dialect) async {
    if (!isPlaying) {
      await player.play(AssetSource('audio/$dialect.m4a'));
      isPlaying = true;
    }
  }

  Future<void> endCall(VoidCallback onEnd) async {
    if (isPlaying) {
      await player.stop();
      isPlaying = false;
    }
    pulseController.stop();
    waveController.stop();
    onEnd();
  }

  void dispose() {
    player.dispose();
    pulseController.dispose();
    waveController.dispose();
  }
}
