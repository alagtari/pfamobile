import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common_widgets/app_botton.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/city/presentation/bloc/bloc.dart';
import 'package:mobile/features/city/presentation/widgets/city_card_widget.dart';
import 'package:mobile/common_widgets/screen_title.dart';
import 'package:mobile/theme/colors.dart';
import 'package:mobile/theme/spacers.dart';
import 'package:visibility_detector/visibility_detector.dart';

@RoutePage()
class CitiesScreen extends StatefulWidget implements AutoRouteWrapper {
  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => CityBloc()..add(GetCitiesEvent()),
        child: this,
      );
}

class _CitiesScreenState extends State<CitiesScreen> {
  final List<String> items = List.generate(20, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: VisibilityDetector(
        key: const Key("drivers"),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction == 1.0) {
            context.read<CityBloc>().add(GetCitiesEvent());
          }
        },
        child: BlocListener<CityBloc, CityState>(
          listener: (context, state) {
            if (state is DeleteCitySuccess) {
              context.read<CityBloc>().add(GetCitiesEvent());
            }
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.whiteDarkColor,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .075),
            child: Column(
              children: [
                const ScreenTitle(
                  title: "Cities",
                ),
                largeVerticalSpacer,
                Expanded(
                  child: BlocBuilder<CityBloc, CityState>(
                    builder: (context, state) {
                      if (state is GetCitiesSuccess) {
                        final cities = state.cities;
                        return GridView.builder(
                          primary: false,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .8,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemCount: cities.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CityCardWidget(
                              city: cities[index],
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: AppBotton(
                    bottonText: 'Add City',
                    onClick: () {
                      context.router.push(const AddCityRoute());
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
