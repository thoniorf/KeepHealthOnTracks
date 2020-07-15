import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:keep_health_on_track/model/Measurement.dart';

class MeasurementsMap extends ChangeNotifier {
  final Map<int, List<Measurement>> _measurementsMap = Map();

  UnmodifiableMapView<int, List<Measurement>> get measurementsMap =>
      UnmodifiableMapView(_measurementsMap);

  void addMeasurement(Measurement measurement) {
    List<Measurement> measurements;
    if (this._measurementsMap.containsKey(measurement.hashCode)) {
      measurements = this._measurementsMap[measurement.hashCode];
    } else {
      measurements = List();
      this._measurementsMap[measurement.hashCode] = measurements;
    }

    measurements.add(measurement);

    notifyListeners();
  }
}
