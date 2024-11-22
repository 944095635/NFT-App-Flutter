import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/pages/start/start_page.dart';

/// 启动屏 - 显示logo 和 图片
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    toStartPage();
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/splash_bg.png",
            cacheWidth: 220,
            cacheHeight: 120,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: const SizedBox(),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 60,
            child: Text(
              "NFT\r\nMarketplace",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 跳转到开始页面
  void toStartPage() async {
    await Future.delayed(const Duration(seconds: 2));
    await Get.offAll(() => const StartPage(),
        transition: Transition.rightToLeft);
  }
}
