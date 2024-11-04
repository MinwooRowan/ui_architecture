import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_architectire/domain/demo_entity.dart';
import 'package:provider_architectire/presentation/screen/home/state/home_state.dart';

class HomeFooterView extends ConsumerWidget with HomeState {
  // final AsyncValue<List<DemoEntity>> demoList;
  const HomeFooterView({
    super.key,
    // required this.demoList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final AsyncValue<List<DemoEntity>> demoList = getDemoList(ref);
          return demoList.when(
            data: (data) {
              return Text(
                'Total: ${data.length}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
            loading: () => SizedBox.shrink(),
            error: (error, stackTrace) => Center(
              child: Text('Error: $error'),
            ),
          );
        },
      ),
    );
  }
}
