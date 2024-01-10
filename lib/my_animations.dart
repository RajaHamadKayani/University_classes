import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyAnimations extends StatefulWidget {
  const MyAnimations({super.key});

  @override
  State<MyAnimations> createState() => _MyAnimationsState();
}

class _MyAnimationsState extends State<MyAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              "assets/json/login_form.json",
              height: 200,
              width: 300,
              fit: BoxFit.cover,
              controller: animationController,
              repeat: true,
              reverse: false,
              onLoaded: (composite) {
                animationController.duration = composite.duration;
                animationController.repeat();
              },
            )
          ],
        ),
      ),
    );
  }
}
