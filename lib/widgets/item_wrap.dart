import 'package:flutter/material.dart';
import 'package:pizza_app_s/colors.dart';
import 'package:pizza_app_s/consts.dart';

class ItemWrap extends StatelessWidget {
  const ItemWrap({
    Key? key,
    required this.imageUrl,
    required this.labeel,
    required this.size,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  final String imageUrl;
  final String labeel;
  final double size;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(Consts.px16),
          ),
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(Consts.px16),
                ),
                child: Image.asset(
                  imageUrl,
                  height: size,
                  width: size,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
              const SizedBox(height: Consts.px8),
              Text(labeel),
              const SizedBox(height: Consts.px8),
            ],
          ),
        ),
        Positioned(
          left: Consts.px4,
          top: Consts.px4,
          child: IgnorePointer(
            child: SizedBox(
              width: Consts.px32,
              height: Consts.px32,
              child: Checkbox(
                fillColor: MaterialStateColor.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.selected)) {
                      return CustomColors.green;
                    }
                    return Theme.of(context).disabledColor;
                  },
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: selected,
                shape: const CircleBorder(),
                onChanged: null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
