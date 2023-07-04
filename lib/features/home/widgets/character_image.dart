import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CharacterImage extends StatelessWidget {
  final String src;
  final String id;

  const CharacterImage({
    required this.src,
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CachedNetworkImage(
        imageUrl: src,
        height: 35.h,
        width: 55.w,
        fit: BoxFit.cover,
        key: ValueKey(id),
      ),
    );
  }
}
