import 'package:flutter/material.dart';
import 'package:gister/components/sized_texts.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  final List<Category> cats = [
    Category("Musician", Icons.music_note_outlined),
    Category("Photographer", Icons.camera_alt_outlined),
    Category("Programmer", Icons.code_off_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MidiumBoldText("Categories"),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: cats.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black38, width: 0.2),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(cats[index].iconData, size: 18),
                  label: Text(cats[index].name),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Category {
  final String name;
  final IconData iconData;

  Category(this.name, this.iconData);
}
