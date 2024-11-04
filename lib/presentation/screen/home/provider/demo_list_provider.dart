import 'package:provider_architectire/domain/demo_entity.dart';
import 'package:provider_architectire/domain/demo_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'demo_list_provider.g.dart';

@riverpod
class DemoList extends _$DemoList {
  @override
  AsyncValue<List<DemoEntity>> build() {
    return AsyncLoading();
  }

  Future<void> fetchDemoList({DemoUsecase? demoUsecase}) async {
    final DemoUsecase usecase = demoUsecase ?? ref.read(demoUsecaseProvider);

    try {
      final List<DemoEntity> demoList = await usecase.getDemoList();
      state = AsyncData(demoList);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  void updateDemoItemTappedState({required int id}) {
    if (state is! AsyncData<List<DemoEntity>> ||
        state.value == null ||
        state.value!.isEmpty) return;

    final List<DemoEntity> demoList = state.value!;
    final List<DemoEntity> updatedDemoList = demoList.map((demo) {
      if (demo.id == id) {
        return demo.copyWith(tapped: !demo.tapped);
      }
      return demo;
    }).toList();
    state = AsyncData(updatedDemoList);
  }
}
