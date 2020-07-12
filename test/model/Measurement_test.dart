import 'package:keep_health_on_track/model/BloodPressure.dart';
import 'package:keep_health_on_track/model/Measurement.dart';
import 'package:test/test.dart';

void main() {
  test("Test Measurement creation", () {
    BloodPressure bloodPressure = new BloodPressure(1,2,3);

    Measurement measurement = new Measurement(bloodPressure);

    expect(measurement.dateTime, isNotNull);

    DateTime dateTime = DateTime.now();
    measurement = new Measurement(bloodPressure, dateTime);

    expect(measurement.dateTime, dateTime);

    expect(measurement.bloodPressure, bloodPressure);

  });
}
