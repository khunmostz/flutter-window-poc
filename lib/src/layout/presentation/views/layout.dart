import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_window/src/layout/presentation/widgets/leftside.dart';
import 'package:flutter_window/src/layout/presentation/widgets/rightside.dart';

class MainLayout extends ConsumerStatefulWidget {
  const MainLayout({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [LeftSide(), RightSide()],
      ),
    );
  }
}
