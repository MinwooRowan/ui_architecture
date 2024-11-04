import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_architectire/presentation/widget/base/base_screen.dart';

class SplashScreen extends BaseScreen {
  static const String route = 'splash';
  const SplashScreen({super.key});
  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
