import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dart_ping_ios/dart_ping_ios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_window/src/layout/presentation/views/layout.dart';

void main() {
  appWindow.size = const Size(800, 600);
  if (Platform.isIOS) {
    DartPingIOS.register();
  }
  runApp(const ProviderScope(child: MyApp()));
  appWindow.show();
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(800, 600);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Flutter Desktop Application";
    win.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainLayout(),
    );
  }
}
