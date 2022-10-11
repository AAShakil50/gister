import 'package:flutter/material.dart';
import 'package:gister/components/sized_texts.dart';
import 'package:gister/models/company_info.dart';

class RecentlyViewed extends StatelessWidget {
  RecentlyViewed({super.key});

  final List<_PositionInfo> _positions = [
    _PositionInfo(
      CompanyInfo("McDonalds", "mcdonalds"),
      "Cashier",
      "McDonalds - Istanbul, Turkey",
    ),
    _PositionInfo(
      CompanyInfo("BurgerKing", "burger_king"),
      "Salesman",
      "BurgerKing - Haifa, Turkey",
    ),
    _PositionInfo(
      CompanyInfo("McDonalds", "mcdonalds"),
      "Deliverman",
      "McDonalds - New York, USA",
    ),
    _PositionInfo(
      CompanyInfo("Casio", "casio"),
      "Mathematician",
      "Casio - Newfoundland, Canada",
    ),
    _PositionInfo(
      CompanyInfo("McDonalds", "mcdonalds"),
      "Chef",
      "McDonalds - Newfoundland, Canada",
    ),
    _PositionInfo(
      CompanyInfo("BurgerKing", "burger_king"),
      "Electric Engineer",
      "BurgerKing - Regina, Canada",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: (_positions.length * 75) + 40 + 32,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                MidiumBoldText("Recently Viewed"),
                SmallText("View All"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ...List.generate(
            _positions.length,
            (index) => _ViewedLevel(index),
          )
        ],
      ),
    );
  }

  Container _ViewedLevel(int index) {
    return Container(
      height: 65,
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38, width: 0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 32,
            width: 32,
            child: Image.asset(_positions[index].info.iconPath),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_positions[index].position),
              SmallText(
                _positions[index].location,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _PositionInfo {
  CompanyInfo info;
  String position;
  String location;

  _PositionInfo(this.info, this.position, this.location);
}
