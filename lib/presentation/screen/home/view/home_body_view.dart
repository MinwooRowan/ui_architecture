import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_architectire/domain/demo_entity.dart';
import 'package:provider_architectire/presentation/screen/home/state/home_event.dart';
import 'package:provider_architectire/presentation/screen/home/widget/demo_item_widget.dart';

class HomeBodyView extends HookConsumerWidget with HomeEvent {
  final AsyncValue<List<DemoEntity>> demoList;

  const HomeBodyView({
    super.key,
    required this.demoList,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return demoList.when(
      data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final DemoEntity demo = data[index];
            return DemoItemWidget(
              onTap: () {
                updateDemoItemTappedState(
                  ref: ref,
                  id: demo.id,
                );
              },
              name: demo.name,
              description: demo.description,
              tapped: demo.tapped,
            );
          },
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
}
