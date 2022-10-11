import 'package:flutter/material.dart';
import 'package:gister/home/categories.dart';

import 'package:gister/home/headings.dart';
import 'package:gister/home/recently_viewed.dart';
import 'package:gister/home/top_gigs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HomeHeading(),
              TopGigs(),
              Categories(),
              RecentlyViewed(),
            ],
          ),
        ),
      ),
    );
  }
}
