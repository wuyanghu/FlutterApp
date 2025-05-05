import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double width;
  final double height;
  final Duration duration;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;

  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.width = 60.0,
    this.height = 30.0,
    this.duration = const Duration(milliseconds: 200),
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.thumbColor = Colors.white,
  }) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant CustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _currentValue = widget.value;
    }
  }

  void _toggleSwitch() {
    setState(() {
      _currentValue = !_currentValue;
    });
    widget.onChanged(_currentValue);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: AnimatedContainer(
        width: widget.width,
        height: widget.height,
        duration: widget.duration,
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.height / 2),
          color: _currentValue ? widget.activeColor : widget.inactiveColor,
        ),
        child: Align(
          alignment: _currentValue ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: widget.height - 8,
            height: widget.height - 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.thumbColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
