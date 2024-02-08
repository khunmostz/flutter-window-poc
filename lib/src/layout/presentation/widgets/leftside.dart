import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_window/src/core/common/constants/color.dart';
import 'package:flutter_window/src/layout/presentation/riverpod/layout_provider.dart';
import 'package:line_icons/line_icon.dart';

class LeftSide extends ConsumerStatefulWidget {
  const LeftSide({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LeftSideState();
}

class _LeftSideState extends ConsumerState<LeftSide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: ColorConstant.WHITE,
      child: Container(
        margin: const EdgeInsets.only(top: 33, left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          color: ColorConstant.DARKBLUE_1,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  children: [
                    LineIcon.linux(
                      color: ColorConstant.WHITE,
                      size: 100,
                    ),
                    Text(
                      "Flutter Window",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: ColorConstant.WHITE, fontSize: 20),
                    ),
                  ],
                ),
              ),
              ...List.generate(
                ref.watch(LayoutProvider.screen).length,
                (index) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onHover: (event) {
                    ref.read(LayoutProvider.screenIndex.notifier).state = index;
                  },
                  child: GestureDetector(
                    onTap: () {
                      ref.read(LayoutProvider.screenActive.notifier).state =
                          index;
                    },
                    child: naviationPaneIcon(
                        color: index == ref.watch(LayoutProvider.screenIndex)
                            ? ColorConstant.DARKBLUE_2
                            : ColorConstant.DARKBLUE_1,
                        icon: ref.watch(LayoutProvider.screen)[index].icon,
                        label: ref.watch(LayoutProvider.screen)[index].label),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget naviationPaneIcon({Widget? icon, String? label, Color? color}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 24),
    child: Container(
      margin: const EdgeInsets.only(left: 12, right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color ?? ColorConstant.DARKBLUE_1,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(right: 8), child: icon)),
          Expanded(
            child: Text(
              label ?? "Label",
              style: TextStyle(color: ColorConstant.WHITE),
            ),
          )
        ],
      ),
    ),
  );
}
