import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/admin/problem/presentation/bloc/bloc.dart';
import 'package:mobile/features/admin/problem/presentation/widgets/driver_report_card_widget.dart';
import 'package:mobile/theme/spacers.dart';

class DriversProblemsTabWidget extends StatelessWidget {
  const DriversProblemsTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mediumVerticalSpacer,
        BlocBuilder<ProblemBloc, ProblemState>(
          builder: (context, state) {
            if (state is GetIncidentsSuccess) {
              return Expanded(
                child: ListView.builder(
                  primary: false,
                  itemCount: (state.incidents.length / 2).round(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          DriverReportCardWidget(
                            incident: state.incidents[index * 2],
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          (index * 2 + 1 == state.incidents.length
                              ? const SizedBox()
                              : DriverReportCardWidget(
                                  incident: state.incidents[index * 2 + 1],
                                ))
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
