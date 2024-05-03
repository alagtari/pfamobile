import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mobile/files/active_category_widget.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/files/category_date_card_widget.dart';
import 'package:mobile/files/city_card_widget.dart';
import 'package:mobile/files/driver_card_widget.dart';
import 'package:mobile/files/not_active_category_widget.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class DriversScreen extends StatefulWidget {
  const DriversScreen({super.key});

  @override
  State<DriversScreen> createState() => _DriversScreenState();
}

class _DriversScreenState extends State<DriversScreen> {
  final List<String> items = List.generate(20, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.whiteDarkColor,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .075),
        child: Column(
          children: [
            const ScreenTitle(
              title: "Drivers",
            ),
            largeVerticalSpacer,
            Expanded(
              child: ListView.builder(
                
                itemBuilder: (BuildContext context, int index) {
                  return const DriverCardWidget();
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const AppBotton(bottonText: 'Add Driver'),
            )
          ],
        ),
      ),
    );
  }
}
