import 'package:flutter/material.dart';
import 'package:radio_app/pages/frequency_selector/knob/knob_view.dart';
import 'package:radio_app/theme/app_theme.dart';

class FrequencySelector extends StatefulWidget {
  const FrequencySelector({super.key});

  @override
  State<FrequencySelector> createState() => _FrequencySelectorState();
}

class _FrequencySelectorState extends State<FrequencySelector> {
  double fmFrequency = 088.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Radio',
          style: TextStyle(
              color: AppTheme.darkTheme.secondaryHeaderColor,
              fontWeight: FontWeight.w800,
              fontSize: 28),
        ),
        backgroundColor: AppTheme.darkTheme.scaffoldBackgroundColor,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                fmFrequency.toString(),
                style: TextStyle(
                    color: AppTheme.darkTheme.secondaryHeaderColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 65),
              ),
            ),
            const Expanded(
              child: KnobView(),
            )
          ],
        ),
      ),
    );
  }
}
