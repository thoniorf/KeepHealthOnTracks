import 'package:flutter/widgets.dart';

class FixedIntListWheel extends StatelessWidget {
  final FixedExtentScrollController _controller;
  final int _childCount;
  final int _start;
  final String _label;
  final double _width;
  final double _height;

  FixedIntListWheel(this._controller, this._childCount, this._start,
      this._label, this._width, this._height)
      : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(),
              borderRadius: BorderRadius.circular(12.0)),
          constraints: BoxConstraints.loose(Size(this._width, this._height)),
          child: ListWheelScrollView.useDelegate(
            controller: this._controller,
            physics: FixedExtentScrollPhysics(),
            clipToSize: true,
            itemExtent: 20,
            diameterRatio: 1.5,
            magnification: 1.5,
            useMagnifier: true,
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: this._childCount,
              builder: (context, index) {
                return Text((index + this._start).toString());
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            this._label,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
