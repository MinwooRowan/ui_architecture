import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [HomeLayout] 레이아웃. 패딩, 마진 등 설정.
/// Row, Column, ListView 등의 레이아웃을 감싸 사용.

class HomeLayout extends HookConsumerWidget {
  final Widget? header;
  final Widget body;
  final Widget? footer;
  final bool topSafeArea;
  final bool bottomSafeArea;
  final Color? backgroundColor;
  const HomeLayout({
    super.key,
    this.header,
    required this.body,
    this.footer,
    this.topSafeArea = true,
    this.bottomSafeArea = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        if (backgroundColor != null)
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: backgroundColor,
          ),
        SafeArea(
          top: topSafeArea,
          bottom: bottomSafeArea,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (header != null) header!,
              body,
              if (footer != null) footer!,
            ],
          ),
        ),
      ],
    );
  }
}
