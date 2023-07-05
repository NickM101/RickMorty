import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:glass/glass.dart';

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
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(name),
          Text(species),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('Current Status:'),
              Text(status),
            ],
          )
        ],
      ),
    ).asGlass();
  }
}
