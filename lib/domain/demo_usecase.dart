import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_architectire/data/demo_model.dart';
import 'package:provider_architectire/data/demo_repository_impl.dart';
import 'package:provider_architectire/domain/demo_entity.dart';
import 'package:provider_architectire/domain/demo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'demo_usecase.g.dart';

@Riverpod(keepAlive: true)
DemoUsecase demoUsecase(Ref ref) {
  final DemoRepository demoRepository = ref.watch(demoRepositoryImplProvider);
  return DemoUsecase(demoRepository: demoRepository);
}

class DemoUsecase {
  final DemoRepository demoRepository;
  DemoUsecase({required this.demoRepository});

  Future<List<DemoEntity>> getDemoList() async {
    final List<DemoModel> demoList = await demoRepository.getDemoList();
    return demoList.map((e) => DemoEntity.fromModel(e)).toList();
  }
}
