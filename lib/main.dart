import 'package:elevate_challenge/core/utils/singletone_locator.dart';
import 'package:elevate_challenge/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  registerSingletonsInstances();
  runApp(const ElevateChallengeApp());
}

class ElevateChallengeApp extends StatelessWidget {
  const ElevateChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
