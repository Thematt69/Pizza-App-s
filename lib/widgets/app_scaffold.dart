import 'package:flutter/material.dart';
import 'package:pizza_app_s/consts.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required this.body,
    this.onBack,
    this.onForward,
  }) : super(key: key);

  final Widget body;
  final void Function()? onBack;
  final void Function()? onForward;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            body,
            if (onBack != null)
              Positioned(
                left: Consts.px16,
                bottom: Consts.px16,
                child: FloatingActionButton(
                  heroTag: 'back',
                  onPressed: onBack,
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            if (onForward != null)
              Positioned(
                right: Consts.px16,
                bottom: Consts.px16,
                child: FloatingActionButton(
                  heroTag: 'forward',
                  onPressed: onForward,
                  child: const Icon(Icons.arrow_forward),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
