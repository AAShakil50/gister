import 'package:flutter/material.dart';
import 'package:gister/components/sized_texts.dart';
import 'package:gister/configs/colors.dart';
import 'package:gister/details/company_material.dart';
import 'package:gister/details/description_material.dart';
import 'package:gister/models/company_info.dart';
import 'package:gister/models/gig_details.dart';
import 'package:gister/widgets/tab_page.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});

  var gigInfo = GigDetails(
    CompanyInfo("StarBucks", "starbucks"),
    "Photographer",
    "Istanbul, Turkey",
    GigType.partTime,
    10000,
    "We need a part-time photographer to collaborate with us on creating our"
        " new products journal. Previous experience in this field is a big advantage."
        " We do not seek any certificate or degree. The only thing that we require is"
        " expertise in photography. Send us your best and latest photographs.",
    [
      "2-4 years experience as a digital photographer.",
      "Same experience as working knowledge of different operating systems,"
          " Adobe products and Capture One.",
      "At least one year's experience of paid photography for any company or freelance",
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _fabApply(),
        backgroundColor: kLightWhite,
        body: CustomScrollView(
          physics: const PageScrollPhysics(),
          slivers: [
            _topBar(context),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(25),
                    child: TabPage([
                      TabMaterial("Description", DescriptionMaterial(gigInfo)),
                      TabMaterial("Company", CompanyMaterial()),
                      TabMaterial("Reviews", const Text("Something")),
                      TabMaterial("Related", const Text("Something")),
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverAppBar _topBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kLightWhite,
      elevation: 0,
      title: const Text(
        "Gig Details",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
        ),
      ),
      actions: const [
        Icon(
          Icons.bookmark_add_outlined,
          color: Colors.black,
        ),
        SizedBox(width: 10)
      ],
      expandedHeight: 350,
      flexibleSpace: _briefInfo(),
    );
  }

  SingleChildScrollView _briefInfo() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 55),
          Image(
            image: AssetImage(gigInfo.company.iconPath),
            width: 80,
            height: 80,
          ),
          const SizedBox(height: 20),
          MidiumBoldText(gigInfo.status),
          const SizedBox(height: 5),
          SmallText(gigInfo.company.name),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 10),
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _pairInfo("Location", gigInfo.location),
                _pairInfo(
                  "Gig type",
                  gigInfo.gigType == GigType.partTime
                      ? "Part Time"
                      : "Full Time",
                ),
                _pairInfo("Salary", "\$${gigInfo.salary}"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _fabApply() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.fromLTRB(25, 15, 15, 15),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "Apply",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 10),
          Icon(Icons.arrow_right_alt_outlined, color: Colors.white),
        ],
      ),
    );
  }

  Column _pairInfo(String up, String down) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallBoldText(up),
        const SizedBox(height: 10),
        SmallText(down),
      ],
    );
  }
}
