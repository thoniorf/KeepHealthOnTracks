import 'package:keep_health_on_track/model/BloodPressure.dart';

class Measurement {
  DateTime _dateTime;
  BloodPressure _bloodPressure;

  Measurement(this._bloodPressure, [this._dateTime]){
    this._dateTime ??= DateTime.now();
  }

  BloodPressure get bloodPressure => _bloodPressure;

  DateTime get dateTime => _dateTime;

  // Equality operator based on datetime field.
  @override
  bool operator ==(other) {
    bool isEqual = false;
    if(other is Measurement) {
      isEqual = other._dateTime.isAtSameMomentAs(this._dateTime);
    }
    return isEqual;
  }

  // return timestamp of datetime as hashcode
  @override
  int get hashCode => _dateTime.millisecondsSinceEpoch;
}