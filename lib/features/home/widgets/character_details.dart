import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CharacterDetails extends StatelessWidget {
  final String name;
  final String species;
  final String status;

  const CharacterDetails({
    super.key,
    required this.name,
    required this.species,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 40.w,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Text(name),
          Text(species),
          Text(status),
        ],
      ),
    );
  }
}
