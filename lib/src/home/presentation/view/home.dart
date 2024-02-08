import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_window/src/core/common/constants/color.dart';
import 'package:flutter_window/src/home/presentation/riverpod/home_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ref.watch(fakeStoreProvider).when(
            data: (data) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.DARKBLUE_1,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              width: 100,
                              height: 100,
                              child: Image.network(data[index].image ?? "")),
                          Center(
                            child: Text(
                              data[index].title ?? "",
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorConstant.WHITE,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                itemCount: data.length),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
    );
  }
}
