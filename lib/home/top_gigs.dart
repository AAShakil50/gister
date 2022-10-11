import 'package:flutter/material.dart';
import 'package:gister/components/sized_texts.dart';
import 'package:gister/details/details_page.dart';
import 'package:gister/models/company_info.dart';

class TopGigs extends StatelessWidget {
  TopGigs({super.key});

  final PageController viewController = PageController(viewportFraction: 0.75);
  final List<_GigInfo> _images = [
    _GigInfo(
      CompanyInfo("Starbucks", "starbucks"),
      "Photographer",
      100,
      const AssetImage("assets/images/wide_photographer.jpg"),
    ),
    _GigInfo(
      CompanyInfo("McDonalds", "mcdonalds"),
      "Data Analyst",
      220,
      const AssetImage("assets/images/wide_analyst.jpg"),
    ),
    _GigInfo(
      CompanyInfo("Casio", "casio"),
      "Programmer",
      310,
      const AssetImage("assets/images/wide_coder.jpg"),
    ),
    _GigInfo(
      CompanyInfo("Burger King", "burger_king"),
      "Deliverman",
      310,
      const AssetImage("assets/images/wide_deliverman.jpg"),
    ),
    _GigInfo(
      CompanyInfo("McDonalds", "mcdonalds"),
      "Salesman",
      310,
      const AssetImage("assets/images/wide_salesman.jpg"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              MidiumBoldText("Top Gigs"),
              SmallText("View All"),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 270,
          child: PageView.builder(
            itemCount: _images.length,
            scrollDirection: Axis.horizontal,
            controller: viewController,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(
                left: (index == 0) ? 0 : 10,
                right: (index == _images.length - 1) ? 0 : 10,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withAlpha(20)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 200,
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: _images[index].banner,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    _images[index].info.iconPath,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_images[index].position),
                                  SmallText(_images[index].info.name),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: GestureDetector(
                                onTap: (() => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) => DetailsPage()),
                                      ),
                                    )),
                                child: const Text(
                                  "View",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 10),
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black38,
                      ),
                      child: Text(
                        "\$${_images[index].perHour}/hr",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, top: 10),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black38,
                      ),
                      child: const Icon(
                        Icons.bookmark_add_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GigInfo {
  final CompanyInfo info;
  final String position;
  final int perHour;
  final AssetImage banner;

  _GigInfo(this.info, this.position, this.perHour, this.banner);
}
