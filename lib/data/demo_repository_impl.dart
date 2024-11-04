import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_architectire/data/demo_model.dart';
import 'package:provider_architectire/domain/demo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'demo_repository_impl.g.dart';

@Riverpod(keepAlive: true)
DemoRepositoryImpl demoRepositoryImpl(Ref ref) {
  return DemoRepositoryImpl();
}

class DemoRepositoryImpl extends DemoRepository {
  @override
  Future<List<DemoModel>> getDemoList() async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(
        10,
        (index) => DemoModel(
              name: index.toString(),
              description: 'Description $index',
              id: index,
            ));
  }
}
