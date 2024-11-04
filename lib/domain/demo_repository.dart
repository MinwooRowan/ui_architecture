import 'package:provider_architectire/data/demo_model.dart';

abstract class DemoRepository {
  Future<List<DemoModel>> getDemoList();
}
