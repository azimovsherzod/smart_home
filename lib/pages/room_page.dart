import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RoomPage extends StatefulWidget {
  final String title;
  final bool isHomeEnergy;
  final bool isPool;

  const RoomPage({
    required this.title,
    this.isHomeEnergy = false,
    this.isPool = false,
    super.key,
  });

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  bool _isACSwitchOn = false;
  bool _isPoolSwitchOn = false;
  bool _isDoorSwitchOn = false;
  bool _isLightSwitchOn = false;
  bool _isEnergyOn = false;

  // Dio clientini yarating
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(30),
            left: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.lightBlue,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      body: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    if (widget.title == "Konditsioner") {
      return buildSwitchContainer(
        "Konditsionerni yoqish",
        Icons.ac_unit,
        _isACSwitchOn,
        (value) {
          setState(() {
            _isACSwitchOn = value;
          });
        },
      );
    } else if (widget.title == "Basseyn") {
      return buildSwitchContainer(
        "Suvni yoqish/ochirish",
        Icons.pool,
        _isPoolSwitchOn,
        (value) {
          setState(() {
            _isPoolSwitchOn = value;
          });
        },
      );
    } else if (widget.isHomeEnergy) {
      return _buildEnergyButton();
    } else {
      return Column(
        children: [
          buildSwitchContainer(
            "Eshikni ochish/yopish",
            Icons.door_front_door,
            _isDoorSwitchOn,
            (value) {
              setState(() {
                _isDoorSwitchOn = value;
              });
            },
          ),
          buildSwitchContainer(
            "Chiroqni yoqish/ochirish",
            Icons.lightbulb,
            _isLightSwitchOn,
            (value) {
              setState(() {
                _isLightSwitchOn = value;
                (value); // Chiroq holatini o'zgartirganda sorov yuborish
              });
            },
          ),
        ],
      );
    }
  }

  Widget _buildEnergyButton() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _isEnergyOn
                ? "Uy energiyasini o'chirish uchun tugmani bosing"
                : "Uy energiyasini yoqish uchun tugmani bosing",
            style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(200),
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isEnergyOn = !_isEnergyOn;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.green;
                    }
                    return _isEnergyOn ? Colors.red : Colors.green;
                  },
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
              ),
              child: Text(
                _isEnergyOn ? "Tokni o'chirish" : "Tokni yoqish",
                style: TextStyle(
                    fontSize: 23,
                    fontFamily: 'Montserrat',
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchContainer(
      String title, IconData icon, bool switchValue, Function(bool) onChanged) {
    return Container(
      width: 370,
      height: 50,
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.lightBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(icon, color: Colors.yellow),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
            ),
          ),
          Transform.scale(
            scale: 0.9,
            child: Switch(
              activeTrackColor: Colors.white,
              activeColor: Colors.lightBlue,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.white,
              value: switchValue,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
