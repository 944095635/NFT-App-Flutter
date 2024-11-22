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
      body: const Center(
        child: Text("NFT"),
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
