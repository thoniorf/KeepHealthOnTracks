/*
 This class hold blood pressure values such as minimum and maximum, and pulsation as well.
 */
class BloodPressure {
  int _min;
  int _max;
  int _pul;

  BloodPressure(this._min, this._max, this._pul);

  int get min => _min;

  int get max => _max;

  int get pul => _pul;
}