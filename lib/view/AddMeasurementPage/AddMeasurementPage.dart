import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keep_health_on_track/model/BloodPressure.dart';
import 'package:keep_health_on_track/model/Measurement.dart';
import 'package:keep_health_on_track/model/MeasurementsMap.dart';
import 'package:keep_health_on_track/view/AddMeasurementPage/FixedIntListWheel.dart';
import 'package:keep_health_on_track/view/utils/Parameters.dart';
import 'package:provider/provider.dart';

class AddMeasurementPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddMeasurementPageState();
}

class AddMeasurementPageState extends State<AddMeasurementPage> {
  DateTime _selectedDate;
  TimeOfDay _selectedTime;

  List<FixedExtentScrollController> _fixedScrollControllers;

  AddMeasurementPageState()
      : _selectedDate = DateTime.now(),
        _selectedTime = TimeOfDay.now();

  @override
  void initState() {
    this._fixedScrollControllers = [
      FixedExtentScrollController(initialItem: 23),
      FixedExtentScrollController(initialItem: 23),
      FixedExtentScrollController(initialItem: 30)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(Parameters.ADD_NEW_MEASURMENT.toUpperCase()),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: saveMeasurement),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 24.0),
        padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            color: Color(0xFFF9EDE9),
            shape: BoxShape.rectangle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text("Data e ora"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text(
                      DateFormat("d MMMM y", "it_IT").format(_selectedDate)),
                  onPressed: setDate,
                ),
                FlatButton(
                    onPressed: setTime,
                    child: Text(_selectedTime.format(context))),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 2.0, bottom: 18.0),
              child: Text("Pressione"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FixedIntListWheel(this._fixedScrollControllers[0], 46, 50,
                    Parameters.BLOOD_PRESSURE_MIN, 100.0, 200.0),
                FixedIntListWheel(this._fixedScrollControllers[1], 46, 100,
                    Parameters.BLOOD_PRESSURE_MAX, 100.0, 200.0),
                FixedIntListWheel(this._fixedScrollControllers[2], 61, 60,
                    Parameters.BLOOD_PRESSURE_PUL, 100.0, 200.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void saveMeasurement() {
    int min = 50 + this._fixedScrollControllers[0].selectedItem;
    int max = 100 + this._fixedScrollControllers[1].selectedItem;
    int pul = 60 + this._fixedScrollControllers[2].selectedItem;

    DateTime dateTime = DateTime(_selectedDate.year, _selectedDate.month,
        _selectedDate.day, _selectedTime.hour, _selectedTime.minute);

    Measurement measurement =
        Measurement(BloodPressure(min, max, pul), dateTime);

    Provider.of<MeasurementsMap>(context, listen: false)
        .addMeasurement(measurement);
  }

  void setDate() async {
    _selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().add(Duration(days: -365)),
        lastDate: DateTime.now().add(Duration(days: 365)));
    _selectedDate ??= DateTime.now();
    setState(() {});
  }

  void setTime() async {
    _selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    _selectedTime ??= TimeOfDay.now();
    setState(() {});
  }
}
