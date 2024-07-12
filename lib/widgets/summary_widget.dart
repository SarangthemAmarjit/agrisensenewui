import 'package:fitness_dashboard_ui/const/constant.dart';
import 'package:fitness_dashboard_ui/widgets/pie_chart_widget.dart';
import 'package:fitness_dashboard_ui/widgets/scheduled_widget.dart';
import 'package:fitness_dashboard_ui/widgets/summary_details.dart';
import 'package:fitness_dashboard_ui/widgets/widget/historywidget.dart';
import 'package:fitness_dashboard_ui/widgets/widget/pumpdashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: cardBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  PumpWidget(),
                  SizedBox(height: 16),
                  SummaryDetails(),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  HistoryWidget(index: 0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
