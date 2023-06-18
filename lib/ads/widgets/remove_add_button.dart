import 'package:flutter/material.dart';

class RemoveAdButton extends StatelessWidget {
  const RemoveAdButton({
    required this.onTap,
    this.margin = const EdgeInsets.only(left: 16),
    this.alignment = Alignment.centerLeft,
    super.key,
  });

  final VoidCallback onTap;
  final EdgeInsets margin;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: margin,
        child: InkWell(
          borderRadius: BorderRadius.circular(60),
          onTap: onTap,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.red[400],
            ),
            child: const Icon(
              Icons.clear_rounded,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
