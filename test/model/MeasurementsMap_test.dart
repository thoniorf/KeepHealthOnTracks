import 'package:keep_health_on_track/model/BloodPressure.dart';
import 'package:keep_health_on_track/model/Measurement.dart';
import 'package:keep_health_on_track/model/MeasurementsMap.dart';
import 'package:test/test.dart';

void main() {
  test("Test MeasurementsMap addition", () {
    final MeasurementsMap _measurementsMap = MeasurementsMap();
    final Measurement measurement = Measurement(BloodPressure(1, 1, 1));

    _measurementsMap.addListener(() {
      expect(_measurementsMap.measurementsMap.containsKey(measurement.hashCode),
          true);
    });

    _measurementsMap.addMeasurement(measurement);
  });
}
