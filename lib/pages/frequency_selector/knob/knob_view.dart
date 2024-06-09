import 'package:flutter/material.dart';
import 'package:radio_app/pages/frequency_selector/knob/knob_custom_painter.dart';

class KnobView extends StatefulWidget {
  const KnobView({super.key});

  @override
  State<KnobView> createState() => _KnobViewState();
}

class _KnobViewState extends State<KnobView> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromWidth(MediaQuery.sizeOf(context).width),
      painter: KnobPainter(),
    );
  }
}
