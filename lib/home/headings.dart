import 'package:flutter/material.dart';
import 'package:gister/components/sized_texts.dart';

class HomeHeading extends StatelessWidget {
  const HomeHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190,
      decoration: BoxDecoration(color: Colors.blueGrey[50]),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  MidiumText("Good Morning"),
                  BigText("MahdiVerse"),
                ],
              ),
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/avatar_nicolas.jpg"),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.mic_outlined),
                hintText: "Search by title, payment ...",
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
