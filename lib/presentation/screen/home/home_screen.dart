import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_architectire/domain/demo_entity.dart';
import 'package:provider_architectire/presentation/screen/home/home_layout.dart';
import 'package:provider_architectire/presentation/screen/home/view/home_body_view.dart';
import 'package:provider_architectire/presentation/screen/home/state/home_event.dart';
import 'package:provider_architectire/presentation/screen/home/state/home_state.dart';
import 'package:provider_architectire/presentation/screen/home/view/home_footer_view.dart';
import 'package:provider_architectire/presentation/screen/home/view/home_header_view.dart';
import 'package:provider_architectire/presentation/widget/base/base_screen.dart';

class HomeScreen extends BaseScreen with HomeEvent, HomeState {
  static const String route = 'home';

  const HomeScreen({super.key});

  @override
  void onInit(WidgetRef ref, BuildContext context) {
    super.onInit(ref, context);
    fetchDemoList(ref);
  }

  @override
  bool get bottomSafeArea => false;

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<DemoEntity>> demoList = getDemoList(ref);
    return HomeLayout(
      header: HomeHeaderView(),
      body: Expanded(child: HomeBodyView(demoList: demoList)),
      footer: HomeFooterView(demoList: demoList),
    );
  }
}
