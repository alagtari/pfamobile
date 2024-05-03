import 'package:flutter/material.dart';
import 'package:mobile/files/citizen_report_card_widget.dart';
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
        Expanded(
          child: GridView.builder(
            primary: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .88,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.all(1.0),
                child: CitizenReportCardWidget(),
              );
            },
          ),
        ),
      ],
    );
  }
}
