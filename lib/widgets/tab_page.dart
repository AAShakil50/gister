import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  final List<TabMaterial> tabMaterials;
  const TabPage(this.tabMaterials, {super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final kDarkColor = const Color.fromARGB(255, 245, 245, 245);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabMaterials.length,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: kDarkColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBar(
                isScrollable: true,
                labelColor: Colors.black,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                tabs: [
                  ...widget.tabMaterials
                      .map((e) => Tab(child: Text(e.buttonValue)))
                      .toList(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              width: double.maxFinite,
              height: 320,
              child: TabBarView(
                children: [
                  ...widget.tabMaterials.map((e) => e.pageContent).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabMaterial {
  final String buttonValue;
  final Widget pageContent;

  TabMaterial(this.buttonValue, this.pageContent);
}
