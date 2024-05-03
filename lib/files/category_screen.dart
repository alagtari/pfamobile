import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mobile/files/active_category_widget.dart';
import 'package:mobile/files/category_date_card_widget.dart';
import 'package:mobile/files/not_active_category_widget.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
              title: "Category",
            ),
            largeVerticalSpacer,
            SizedBox(
              width: double.infinity,
              height: 35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ActiveCategoryWidget(),
                  NotActiveCategoryWidget(),
                  NotActiveCategoryWidget(),
                  NotActiveCategoryWidget(),
                  NotActiveCategoryWidget(),
                  NotActiveCategoryWidget(),
                ],
              ),
            ),
            largeVerticalSpacer,
            Expanded(
              child: GridView.builder(
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.all(1.0),
                    child: CategoryDateCardWidget(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
