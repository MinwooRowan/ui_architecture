import 'package:flutter/material.dart';

class DemoItemWidget extends StatelessWidget {
  final String name;
  final String description;
  final bool tapped;
  final VoidCallback onTap;
  const DemoItemWidget({
    super.key,
    required this.onTap,
    required this.name,
    required this.tapped,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(name),
      subtitle: Row(
        children: [
          Text(description),
          SizedBox(width: 12),
          AnimatedSwitcher(
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            duration: const Duration(milliseconds: 300),
            child: tapped
                ? const Icon(
                    key: Key('Check'),
                    Icons.check,
                    color: Colors.amber,
                  )
                : const Icon(
                    key: Key('Close'),
                    Icons.check,
                    color: Colors.grey,
                  ),
          ),
        ],
      ),
    );
  }
}
