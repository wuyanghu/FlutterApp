import 'package:flutter/material.dart';

class SymmetricSliderDemo extends StatefulWidget {
  static String route = 'SymmetricSliderDemo';

  @override
  _SymmetricSliderDemoState createState() => _SymmetricSliderDemoState();
}

class _SymmetricSliderDemoState extends State<SymmetricSliderDemo> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("slider demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '当前值：${_value.toStringAsFixed(0)}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 6,
                activeTrackColor: Colors.blue,
                inactiveTrackColor: Colors.grey.shade300,
                thumbColor: Colors.blue,
                overlayColor: Colors.blue.withAlpha(32),
                valueIndicatorTextStyle: TextStyle(color: Colors.white),
              ),
              child: Slider(
                value: _value,
                min: -100,
                max: 100,
                divisions: 4,
                label: _value.toStringAsFixed(0),
                onChanged: (val) {
                  setState(() {
                    _value = val;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('-100'),
                Text('-50'),
                Text('0'),
                Text('50'),
                Text('100'),
              ],
            ),
          ),
          CustomZeroCenterSlider(),
        ],
      ),
    );
  }
}

class CustomZeroCenterSlider extends StatefulWidget {
  @override
  _CustomZeroCenterSliderState createState() => _CustomZeroCenterSliderState();
}

class _CustomZeroCenterSliderState extends State<CustomZeroCenterSlider> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackShape: ZeroCenterTrackShape(),
          trackHeight: 6,
          activeTrackColor: Colors.blue,
          inactiveTrackColor: Colors.grey.shade300,
          thumbColor: Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('当前值：${_value.toStringAsFixed(0)}'),
            Slider(
              value: _value,
              min: -100,
              max: 100,
              divisions: 10,
              onChanged: (val) {
                setState(() {
                  _value = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ZeroCenterTrackShape extends SliderTrackShape {
  const ZeroCenterTrackShape();

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 4.0;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    final double trackRight = trackLeft + trackWidth;

    final double centerX = trackLeft + trackWidth / 2;

    final Paint activePaint = Paint()..color = sliderTheme.activeTrackColor!;
    final Paint inactivePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor!;

    // 全灰背景轨道
    context.canvas.drawRect(
      Rect.fromLTRB(trackLeft, trackTop, trackRight, trackTop + trackHeight),
      inactivePaint,
    );

    // 画从 0 开始向 thumbCenter 填充的 active 区域
    if (thumbCenter.dx >= centerX) {
      // 向右
      context.canvas.drawRect(
        Rect.fromLTRB(
            centerX, trackTop, thumbCenter.dx, trackTop + trackHeight),
        activePaint,
      );
    } else {
      // 向左
      context.canvas.drawRect(
        Rect.fromLTRB(
            thumbCenter.dx, trackTop, centerX, trackTop + trackHeight),
        activePaint,
      );
    }
  }

  @override
  Rect getPreferredRect(
      {required RenderBox parentBox,
      Offset offset = Offset.zero,
      required SliderThemeData sliderTheme,
      bool isEnabled = false,
      bool isDiscrete = false}) {
    final double trackHeight = sliderTheme.trackHeight ?? 4.0;
    final double trackLeft = offset.dx +
        sliderTheme.overlayShape!
                .getPreferredSize(isEnabled, isDiscrete)
                .width /
            2;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width -
        sliderTheme.overlayShape!.getPreferredSize(isEnabled, isDiscrete).width;

    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
