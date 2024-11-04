import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseScreen extends HookConsumerWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        onInit(ref, context);
        return () => onDispose(ref, context);
      },
      [],
    );

    return PopScope(
      canPop: false,
      child: SelectionArea(
        child: Scaffold(
          appBar: renderAppBar(context, ref),
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          bottomNavigationBar: renderBottomNavigationBar(context, ref),
          body: SafeArea(
            top: topSafeArea,
            bottom: bottomSafeArea,
            child: Stack(
              children: [
                if (backgroundGradient != null)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(gradient: backgroundGradient),
                  ),
                buildScreen(
                  context,
                  ref,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @protected
  Widget? renderDrawer(BuildContext context, WidgetRef ref) => null;

  @protected
  Widget buildScreen(BuildContext context, WidgetRef ref);

  @protected
  LinearGradient? get backgroundGradient => null;

  @protected
  bool get canPop => false;

  @protected
  bool get resizeToAvoidBottomInset => true;

  @protected
  PreferredSizeWidget? renderAppBar(BuildContext context, WidgetRef ref) =>
      null;

  @protected
  Widget? renderBottomNavigationBar(BuildContext context, WidgetRef ref) =>
      null;

  @protected
  bool get topSafeArea => true;

  @protected
  bool get bottomSafeArea => true;

  /// 앱이 활성화된 상태로 돌아올 때 호출
  @protected
  void onResumed(WidgetRef ref, BuildContext context) {}

  /// 앱이 일시 정지될 때 호출
  @protected
  void onPaused(WidgetRef ref, BuildContext context) {}

  /// 앱이 비활성 상태로 전환될 때 호출
  @protected
  void onInactive(WidgetRef ref, BuildContext context) {}

  /// 앱이 분리되었을 때 호출
  @protected
  void onDetached(WidgetRef ref, BuildContext context) {}

  /// 페이지 초기화 시 호출
  @protected
  void onInit(WidgetRef ref, BuildContext context) {}

  /// 페이지 해제 시 호출
  @protected
  void onDispose(WidgetRef ref, BuildContext context) {}

  /// will pop시
  @protected
  void onScreenPop(WidgetRef ref, BuildContext context) {}
}
