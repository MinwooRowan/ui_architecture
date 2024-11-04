import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_architectire/presentation/screen/home/provider/demo_list_provider.dart';

mixin class HomeEvent {
  Future<void> fetchDemoList(WidgetRef ref) async {
    ref.read(demoListProvider.notifier).fetchDemoList();
  }

  void updateDemoItemTappedState({
    required WidgetRef ref,
    required int id,
  }) {
    ref.read(demoListProvider.notifier).updateDemoItemTappedState(id: id);
  }
}
