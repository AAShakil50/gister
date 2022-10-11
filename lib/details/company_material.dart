import 'package:flutter/material.dart';
import 'package:gister/components/sized_texts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CompanyMaterial extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData(2010, 251),
    ChartData(2011, 299),
    ChartData(2012, 324),
    ChartData(2013, 672),
    ChartData(2014, 229),
    ChartData(2015, 234),
    ChartData(2016, 303),
    ChartData(2017, 300),
    ChartData(2018, 127),
    ChartData(2019, 680),
    ChartData(2020, 667),
    ChartData(2021, 524),
    ChartData(2022, 776),
  ];

  CompanyMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MidiumBoldText("Starbucks"),
          const SizedBox(height: 5),
          const TextIcon(
            _ValueIcon(Icons.place_outlined),
            Text(
              "Seattle, Washington, United States",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 5),
          const TextIcon(
            _ValueIcon(Icons.monetization_on_outlined),
            Text("Revenue: \$29.09B", style: TextStyle(color: Colors.black54)),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TextIcon(
                _ValueIcon(Icons.work_outline),
                Text(
                  "132 Job Posts",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              TextIcon(
                Icon(Icons.how_to_reg_outlined,
                    size: 16, color: Colors.black54),
                Text(
                  "5086 Accepted",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SfCartesianChart(
            series: <ChartSeries>[
              LineSeries<ChartData, int>(
                  dataSource: chartData,
                  xValueMapper: (data, _) => data.x,
                  yValueMapper: (data, _) => data.y)
            ],
            title: ChartTitle(text: "Hires Per Year"),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final int x;
  final double y;

  ChartData(this.x, this.y);
}

class _ValueIcon extends Icon {
  final IconData iconData;

  const _ValueIcon(
    this.iconData, {
    Key? key,
    double size = 16,
    Color color = Colors.black54,
  }) : super(key: key, iconData, size: size, color: color);
}

class TextIcon extends StatelessWidget {
  final Icon icon;
  final Widget text;
  final double gap;

  const TextIcon(
    this.icon,
    this.text, {
    Key? key,
    this.gap = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [icon, SizedBox(width: gap), text],
    );
  }
}
