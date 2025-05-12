import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/core/utils/app_router.dart';
import 'package:flutter_bloc_learn/core/utils/assets_images.dart';
import 'package:flutter_bloc_learn/features/splash/presentation/views/widget/sliding_text.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    initSlidingAnimation();

    navigateToHome();

    super.initState();
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.25,
            child: Image.asset(AssetsImages.logo),
          ),
          const SizedBox(height: 8.0),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
      }
    });
  }
}
