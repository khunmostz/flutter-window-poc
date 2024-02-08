import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_window/src/core/common/constants/color.dart';
import 'package:flutter_window/src/home/presentation/view/home.dart';
import 'package:flutter_window/src/layout/data/models/screen_artifacts.dart';
import 'package:flutter_window/src/layout/presentation/riverpod/layout_state.dart';
import 'package:flutter_window/src/pdf_view/presentation/view/pdf_view.dart';
import 'package:flutter_window/src/printer/view/myprinter.dart';
import 'package:flutter_window/src/webview/presentation/view/webview.dart';
import 'package:line_icons/line_icon.dart';

class LayoutProvider implements LayoutState {
  static StateProvider<int> screenIndex = StateProvider<int>((ref) => 0);
  static StateProvider<int> screenActive = StateProvider<int>((ref) => 0);

  static StateProvider<List<ScreenArtifacts>> screen =
      StateProvider<List<ScreenArtifacts>>(
    (ref) => [
      ScreenArtifacts(
        label: 'Home',
        icon: LineIcon.home(
          color: ColorConstant.WHITE,
        ),
        screen: const HomePage(),
      ),
      ScreenArtifacts(
        label: 'PDF',
        icon: LineIcon.pdfFile(
          color: ColorConstant.WHITE,
        ),
        screen: const PdfView(),
      ),
      ScreenArtifacts(
        label: 'Printer',
        icon: LineIcon.print(
          color: ColorConstant.WHITE,
        ),
        screen: const MyPrinter(),
      ),
      ScreenArtifacts(
        label: 'Webview',
        icon: LineIcon.book(
          color: ColorConstant.WHITE,
        ),
        screen: const MyWebView(),
      ),
    ],
  );
}
