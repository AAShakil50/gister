import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:gister/components/sized_texts.dart';
import 'package:gister/configs/colors.dart';
import 'package:gister/models/gig_details.dart';

class DescriptionMaterial extends StatelessWidget {
  final GigDetails gigDetails;

  const DescriptionMaterial(this.gigDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpandableText(
            gigDetails.details,
            collapseOnTextTap: true,
            expandOnTextTap: true,
            expandText: "More",
          ),
          const SizedBox(height: 20),
          const MidiumBoldText("Requirements"),
          const SizedBox(height: 10),
          ...gigDetails.requirements
              .map((e) => Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: kLightWhite,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(e, style: const TextStyle(height: 1.5)),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
