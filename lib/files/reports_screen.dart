import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mobile/files/active_category_widget.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/files/category_date_card_widget.dart';
import 'package:mobile/files/citizens_problems_tab_widget.dart';
import 'package:mobile/files/city_card_widget.dart';
import 'package:mobile/files/driver_card_widget.dart';
import 'package:mobile/files/drivers_problems_tab_widget.dart';
import 'package:mobile/files/not_active_category_widget.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen>
    with TickerProviderStateMixin {
  final List<String> items = List.generate(20, (index) => "Item $index");
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.whiteDarkColor,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .075,
              ),
              child: const ScreenTitle(
                title: "Problems",
                arrowBack: false,
              ),
            ),
            TabBar.secondary(
              indicatorColor: AppColors.greenDarkColor,
              labelStyle: TextStyles.mediumTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
              controller: _tabController,
              tabs: const <Widget>[
                Tab(text: 'Citizens'),
                Tab(text: 'Drivers'),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .075,
                ),
                child: TabBarView(
                  controller: _tabController,
                  children: const <Widget>[
                    CitizensProblemsTabWidget(),
                    DriversProblemsTabWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
