import 'package:flutter/material.dart';

class NetworkImageFallback extends StatelessWidget {
  final String? imageUrl;
  final BoxFit fit;
  final Alignment alignment;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Widget? fallback;

  const NetworkImageFallback({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.width,
    this.height,
    this.borderRadius,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    final placeholder =
        fallback ??
        Container(
          color: const Color(0xFFF3F4F6),
          alignment: Alignment.center,
          child: const Icon(
            Icons.image_not_supported_outlined,
            color: Color(0xFF9CA3AF),
          ),
        );

    Widget image = Image.network(
      imageUrl ?? '',
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      errorBuilder: (context, error, stackTrace) => placeholder,
    );

    if (borderRadius != null) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }

    return image;
  }
}
