import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

Route<T> modalBottomSheetBuilder<T>(
  BuildContext context,
  Widget child,
  AutoRoutePage<T> page,
) {
  return ModalBottomSheetRoute(
    settings: page,
    builder: (_) => DefaultBottomSheet(child: child),
    capturedThemes: InheritedTheme.capture(
      from: context,
      to: Navigator.of(context, rootNavigator: true).context,
    ),
    isScrollControlled: true,
    useSafeArea: true,
  );
}

class DefaultBottomSheet extends StatelessWidget {
  const DefaultBottomSheet({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: Scaffold(
        body: Stack(
          children: [
            child,
            Positioned(
              top: 12,
              right: 12,
              child: IconButton.filled(
                onPressed: AutoRouter.of(context).popUntilRoot,
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
