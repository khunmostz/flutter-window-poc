import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_window/src/core/common/constants/color.dart';
import 'package:flutter_window/src/layout/presentation/riverpod/layout_provider.dart';
import 'package:flutter_window/src/layout/presentation/widgets/window_button.dart';

class RightSide extends ConsumerStatefulWidget {
  const RightSide({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RightSideState();
}

class _RightSideState extends ConsumerState<RightSide> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstant.WHITE,
        ),
        child: LayoutBuilder(builder: (context, constrants) {
          return Column(
            children: [
              WindowTitleBarBox(
                child: Row(
                  children: [
                    Expanded(child: MoveWindow()),
                    const WindowButtons(),
                  ],
                ),
              ),
              SizedBox(
                  width: constrants.maxWidth,
                  height: constrants.maxHeight -
                      32, // 40 is the height of the title bar
                  child: ref.watch(LayoutProvider.screen).isNotEmpty
                      ? ref
                              .watch(LayoutProvider.screen)[
                                  ref.watch(LayoutProvider.screenActive)]
                              .screen ??
                          Container()
                      : Container()),
            ],
          );
        }),
      ),
    );
  }
}
