import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_architectire/domain/demo_entity.dart';
import 'package:provider_architectire/presentation/screen/home/provider/demo_list_provider.dart';

mixin class HomeState {
  AsyncValue<List<DemoEntity>> getDemoList(WidgetRef ref) {
    return ref.watch(demoListProvider);
  }
}
