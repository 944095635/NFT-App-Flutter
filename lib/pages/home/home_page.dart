import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_styled/radius_extension.dart';
import 'package:flutter_styled/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            context.theme.appBarTheme.systemOverlayStyle!.copyWith(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemStatusBarContrastEnforced: false,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        //physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: _buildHeaderBig(),
          ),
          SliverToBoxAdapter(
            child: _buildList(),
          ),
        ],
      ),
    );
  }

  /// 顶部大图区域
  Widget _buildHeaderBig() {
    return SizedBox(
      height: 300,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/home_bg.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 80,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Hypebeast",
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "By Matt Sypien",
                      textHeightBehavior: TextHeightBehavior(
                        applyHeightToLastDescent: false,
                      ),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    10.horizontalSpace,
                    Image.asset(
                      "assets/images/auth.png",
                      width: 22,
                      height: 22,
                    ),
                  ],
                ),
                20.verticalSpace,
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white30,
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: const SizedBox(
                    height: 80,
                    width: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "56K",
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Owners",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 滚动区域
  Widget _buildList() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
        bottom: 20,
      ),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1.2,
            child: _buildItem(
                "assets/images/b1.png", "Hypebeast\r\n#2100", "Price 0.6 ETH"),
          ),
          FilledButton(
            onPressed: () {},
            child: const Text(
              "Filter",
              textHeightBehavior: TextHeightBehavior(
                applyHeightToLastDescent: false,
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1.2,
            child: _buildItem(
                "assets/images/b2.png", "Hypebeast\r\n#2101", "Price 0.4 ETH"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1.2,
            child: _buildItem(
                "assets/images/b3.png", "Hypebeast\r\n#2102", "Price 0.34 ETH"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1.2,
            child: _buildItem(
                "assets/images/b4.png", "Hypebeast\r\n#2103", "Price 0.33 ETH"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1.2,
            child: _buildItem(
                "assets/images/b5.png", "Hypebeast\r\n#2104", "Price 1.2 ETH"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1.2,
            child: _buildItem(
                "assets/images/b2.png", "Hypebeast\r\n#2101", "Price 0.4 ETH"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1.2,
            child: _buildItem(
                "assets/images/b3.png", "Hypebeast\r\n#2102", "Price 0.34 ETH"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1.2,
            child: _buildItem(
                "assets/images/b4.png", "Hypebeast\r\n#2103", "Price 0.33 ETH"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1.2,
            child: _buildItem(
                "assets/images/b5.png", "Hypebeast\r\n#2104", "Price 1.2 ETH"),
          ),
        ],
      ),
    );
  }

  /// 子项
  Widget _buildItem(
    String image,
    String id,
    String price,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: 20.borderRadius,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            id,
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToLastDescent: false,
            ),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          10.verticalSpace,
          SizedBox(
            height: 42,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.white30,
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            price,
                            textHeightBehavior: const TextHeightBehavior(
                              applyHeightToLastDescent: false,
                            ),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                5.horizontalSpace,
                FilledButton(
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: WidgetStatePropertyAll(Size(40, 40)),
                    overlayColor: WidgetStatePropertyAll(Colors.black12),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.white,
                    ),
                    shape: WidgetStatePropertyAll(
                      CircleBorder(),
                    ),
                  ),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    "assets/images/get.svg",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
