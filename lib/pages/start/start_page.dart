import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: -10,
            right: -10,
            top: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Transform.rotate(
                  angle: math.pi + math.pi * (350 / 360),
                  child: SizedBox(
                    height: 165,
                    child: Marqueer(
                      pps: 50,
                      child: Row(
                        children: [
                          _buildImage("assets/images/i1.png"),
                          _buildImage("assets/images/i2.png"),
                          _buildImage("assets/images/i3.png"),
                          _buildImage("assets/images/i4.png"),
                        ],
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: math.pi + math.pi * (350 / 360),
                  child: SizedBox(
                    height: 165,
                    child: Marqueer(
                      pps: 50,
                      direction: MarqueerDirection.ltr,
                      child: Row(
                        children: [
                          _buildImage("assets/images/y1.png"),
                          _buildImage("assets/images/y2.png"),
                          _buildImage("assets/images/y3.png"),
                          _buildImage("assets/images/y4.png"),
                        ],
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: math.pi + math.pi * (350 / 360),
                  child: SizedBox(
                    height: 165,
                    child: Marqueer(
                      pps: 50,
                      child: Row(
                        children: [
                          _buildImage("assets/images/x1.png"),
                          _buildImage("assets/images/x2.png"),
                          _buildImage("assets/images/x3.png"),
                          _buildImage("assets/images/x4.png"),
                          _buildImage("assets/images/x5.png"),
                        ],
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: math.pi + math.pi * (350 / 360),
                  child: SizedBox(
                    height: 165,
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
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x00FFFFFF),
                    Color.fromARGB(230, 255, 255, 255),
                    Color.fromARGB(245, 255, 255, 255),
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, .1, .2, 1],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Discover NFT\r\nCollections",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Color(
                        0xFF262A2F,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  const Text(
                    "Explore the top collection of NFTs and\r\n buy and sell your NFTs as well.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(
                        0x58000000,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  _buildOpenButton(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 滑动开关
  Widget _buildOpenButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Obx(
        () => AnimatedToggleSwitch<bool>.dual(
          current: !controller.open.value,
          onChanged: (e) {
            controller.open.value = !e;
          },
          indicatorSize: const Size(80, 75),
          height: 85,
          indicatorTransition: const ForegroundIndicatorTransition.fading(),
          iconBuilder: (value) {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color(0x4B000000),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color(0x99000000),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ],
            );
          },
          textBuilder: (value) {
            return const Text(
              "Start experience",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            );
          },
          borderWidth: 5,
          first: true,
          second: false,
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

  Widget _buildImage(String image) {
    return Image.asset(
      image,
      width: 135,
      height: 155,
    );
  }
}
