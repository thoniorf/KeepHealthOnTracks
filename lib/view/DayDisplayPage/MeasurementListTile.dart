import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keep_health_on_track/model/Measurement.dart';
import 'package:keep_health_on_track/view/utils/Parameters.dart';

class MeasurementListTile extends StatelessWidget {
  final Measurement _measurement;
  MeasurementListTile(this._measurement) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DateTimeMeasurementDisplay(_measurement.dateTime),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.none,
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 4.0, left: 24.0, right: 24.0),
                child: ThreeColumnListTileSeparator(),
              ),
            ),
          ),
          Expanded(flex: 2, child: MeasurementBoxDisplay(_measurement)),
        ],
      ),
    );
  }
}

class MeasurementBoxDisplay extends StatelessWidget {
  final Measurement _measurement;

  MeasurementBoxDisplay(this._measurement) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white70),
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SingleMeasureDisplay(
              Parameters.BLOOD_PRESSURE_MIN, _measurement.bloodPressure.min),
          SingleMeasureDisplay(
              Parameters.BLOOD_PRESSURE_MAX, _measurement.bloodPressure.max),
          SingleMeasureDisplay(
              Parameters.BLOOD_PRESSURE_PUL, _measurement.bloodPressure.pul)
        ],
      ),
    );
  }
}

class SingleMeasureDisplay extends StatelessWidget {
  final String _label;
  final int _value;

  SingleMeasureDisplay(this._label, this._value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          this._value.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(this._label)
      ],
    );
  }
}

class DateTimeMeasurementDisplay extends StatelessWidget {
  final String _formattedHours;

  DateTimeMeasurementDisplay(DateTime _dateTime)
      : _formattedHours = DateFormat.Hm().format(_dateTime),
        super();

  @override
  Widget build(BuildContext context) {
    return Text(
      this._formattedHours,
      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    );
  }
}

class ThreeColumnListTileSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12.0,
      height: 4.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
