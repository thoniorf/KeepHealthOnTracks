import 'package:keep_health_on_track/model/BloodPressure.dart';
import 'package:test/test.dart';

void main() {
  test("Test blood pressure creation", () {
    const int m = 10;
    const int M = 10;
    const int pul = 70;
    BloodPressure bloodPressure = BloodPressure(m, M, pul);

    expect(bloodPressure.min, m);
    expect(bloodPressure.max, M);
    expect(bloodPressure.pul, pul);
  });
}