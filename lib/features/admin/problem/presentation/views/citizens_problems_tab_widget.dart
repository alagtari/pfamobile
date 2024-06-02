import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/admin/problem/presentation/bloc/bloc.dart';
import 'package:mobile/features/admin/problem/presentation/widgets/citizen_report_card_widget.dart';
import 'package:mobile/theme/spacers.dart';

class CitizensProblemsTabWidget extends StatelessWidget {
  const CitizensProblemsTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mediumVerticalSpacer,
        BlocBuilder<ProblemBloc, ProblemState>(
          builder: (context, state) {
            if (state is GetProblemsSuccess) {
              return Expanded(
                child: ListView.builder(
                  primary: false,
                  itemCount: (state.problems.length / 2).round(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          CitizenReportCardWidget(
                            problem: state.problems[index * 2],
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          (index * 2 + 1 == state.problems.length
                              ? const SizedBox()
                              : CitizenReportCardWidget(
                                  problem: state.problems[index * 2 + 1],
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
