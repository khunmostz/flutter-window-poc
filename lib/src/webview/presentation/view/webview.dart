import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_universal/webview_universal.dart';

class MyWebView extends ConsumerStatefulWidget {
  const MyWebView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyWebViewState();
}

class _MyWebViewState extends ConsumerState<MyWebView> {
  WebViewController webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
    task();
  }

  Future<void> task() async {
    await webViewController.init(
        setState: setState,
        context: context,
        uri: Uri.parse("https://flutter.dev"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        controller: webViewController,
      ),
    );
  }
}
