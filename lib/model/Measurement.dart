import 'package:keep_health_on_track/model/BloodPressure.dart';

class Measurement {
  DateTime _dateTime;
  BloodPressure _bloodPressure;

  Measurement(this._bloodPressure, [this._dateTime]){
    this._dateTime ??= DateTime.now();
  }

  BloodPressure get bloodPressure => _bloodPressure;

  DateTime get dateTime => _dateTime;
}