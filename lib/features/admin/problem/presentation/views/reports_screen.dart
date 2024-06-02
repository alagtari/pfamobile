import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/admin/problem/presentation/bloc/bloc.dart';
import 'package:mobile/features/admin/problem/presentation/views/citizens_problems_tab_widget.dart';
import 'package:mobile/features/admin/problem/presentation/views/drivers_problems_tab_widget.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/text_styles.dart';

@RoutePage()
class ReportsScreen extends StatefulWidget implements AutoRouteWrapper {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => ProblemBloc()..add(GetProblemsEvent()),
        child: this,
      );
}

class _ReportsScreenState extends State<ReportsScreen>
    with TickerProviderStateMixin {
  final List<String> items = List.generate(20, (index) => "Item $index");
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    log(_tabController.index.toString());
    if (_tabController.index == 0) {
      context.read<ProblemBloc>().add(GetProblemsEvent());
    } else if (_tabController.index == 1) {
      context.read<ProblemBloc>().add(GetIncidentsEvent());
    }
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
