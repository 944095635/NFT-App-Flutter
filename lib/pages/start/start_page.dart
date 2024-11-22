import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/size_extension.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:marqueer/marqueer.dart';
import 'package:nft/pages/start/start_logic.dart';

class StartPage extends GetView<StartLogic> {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StartLogic());
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: -10,
            right: -10,
            top: 0,
            bottom: 0,
            child: _buildBackgroundList(),
          ),

          // 顶部白色蒙版
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 80,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.theme.scaffoldBackgroundColor,
                    const Color(0x00FFFFFF),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 1],
                ),
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.theme.scaffoldBackgroundColor.withOpacity(0),
                    context.theme.scaffoldBackgroundColor.withOpacity(.8),
                    context.theme.scaffoldBackgroundColor.withOpacity(.95),
                    context.theme.scaffoldBackgroundColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, .1, .2, .5],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  80.verticalSpace,
                  Text(
                    "Discover NFT\r\nCollections",
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.bodyLarge,
                  ),
                  26.verticalSpace,
                  const Text(
                    "Explore the top collection of NFTs and\r\n buy and sell your NFTs as well.",
                    textAlign: TextAlign.center,
                  ),
                  38.verticalSpace,
                  _buildOpenButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 背景 图片列表
  Widget _buildBackgroundList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildMarqueer(
          [
            _buildImage("assets/images/i1.png"),
            _buildImage("assets/images/i2.png"),
            _buildImage("assets/images/i3.png"),
            _buildImage("assets/images/i4.png"),
          ],
        ),
        _buildMarqueer(
          [
            _buildImage("assets/images/y1.png"),
            _buildImage("assets/images/y2.png"),
            _buildImage("assets/images/y3.png"),
            _buildImage("assets/images/y4.png"),
          ],
          direction: MarqueerDirection.ltr,
        ),
        _buildMarqueer(
          [
            _buildImage("assets/images/x1.png"),
            _buildImage("assets/images/x2.png"),
            _buildImage("assets/images/x3.png"),
            _buildImage("assets/images/x4.png"),
            _buildImage("assets/images/x5.png"),
          ],
        ),
        SizedBox(
          height: 165,
          child: Transform.rotate(
            angle: math.pi + math.pi * (350 / 360),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildImage("assets/images/z1.png"),
                _buildImage("assets/images/z2.png"),
                _buildImage("assets/images/z3.png"),
                _buildImage("assets/images/z4.png"),
                _buildImage("assets/images/z5.png"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 滑动开关
  Widget _buildOpenButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Obx(
        () => AnimatedToggleSwitch<bool>.dual(
          current: controller.open.value,
          onChanged: (e) async {
            if (!controller.open.value) {
              controller.open.value = e;
              Future.delayed(const Duration(seconds: 2))
                  .then((e) => controller.toHome());
            }
          },
          //active: !controller.open.value,
          indicatorSize: const Size(80, 75),
          height: 85,
          indicatorTransition: const ForegroundIndicatorTransition.fading(),
          iconBuilder: (value) {
            if (value) {
              return const CircularProgressIndicator();
            }
            return Image.asset(
              "assets/images/arrow.png",
              width: 28,
              height: 15,
            );
          },
          textBuilder: (value) {
            return const Text(
              "Start experience",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
          borderWidth: 5,
          first: false,
          second: true,
          styleBuilder: (value) => ToggleStyle(
            indicatorColor: Colors.white,
            borderColor: !controller.open.value
                ? const Color(0xFF303841)
                : const Color(0xFFF4B7A8),
            backgroundColor: !controller.open.value
                ? const Color(0xFF303841)
                : const Color(0xFFF4B7A8),
          ),
        ),
      ),
    );
  }

  /// 跑马灯组件
  Widget _buildMarqueer(
    List<Widget> children, {
    MarqueerDirection direction = MarqueerDirection.rtl,
  }) {
    return SizedBox(
      height: 165,
      child: Transform.rotate(
        angle: math.pi + math.pi * (350 / 360),
        child: Marqueer(
          pps: 50,
          direction: direction,
          restartAfterInteractionDuration: Durations.extralong4,
          child: Row(
            children: children,
          ),
        ),
      ),
    );
  }

  /// 单个图片
  Widget _buildImage(String image) {
    return Image.asset(
      image,
      width: 135,
      height: 155,
      cacheWidth: 135 * 2,
      cacheHeight: 155 * 2,
      fit: BoxFit.fill,
    );
  }
}
