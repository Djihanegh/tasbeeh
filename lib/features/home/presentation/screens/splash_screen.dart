import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tasbeeh/core/navigation/route.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/videos/TASBIH.mp4");

    _controller.initialize().then((value) => {
          Timer(const Duration(milliseconds: 20), () {
            setState(() {
              _controller.play();
            });
          }),
          _controller.addListener(() {
            setState(() {
              if (!_controller.value.isPlaying &&
                  _controller.value.isInitialized &&
                  (_controller.value.duration == _controller.value.position)) {
                navigateToHome();
              }
            });
          })
        });

    super.initState();
  }

  void navigateToHome() {
    if (mounted) {
      AppRoute.home.go(context);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                color: Colors.white,
                height: 400,
                width: 400,
                child: VideoPlayer(
                    _controller)) //  SvgPicture.asset(Assets.iconsLogo),
            ));
  }
}
