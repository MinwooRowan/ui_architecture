import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [HomeLayout] 레이아웃. 패딩, 마진 등 설정.
/// Row, Column, ListView 등의 레이아웃을 감싸 사용.

class HomeLayout extends HookConsumerWidget {
  final Widget? header;
  final Widget body;
  final Widget? footer;
  const HomeLayout({
    super.key,
    this.header,
    required this.body,
    this.footer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (header != null) header!,
        body,
        if (footer != null) footer!,
      ],
    );
  }
}
