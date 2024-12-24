import 'package:flutter/material.dart';

class HomeEnergy extends StatefulWidget {
  const HomeEnergy({super.key});

  @override
  _HomeEnergyState createState() => _HomeEnergyState();
}

class _HomeEnergyState extends State<HomeEnergy> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _isPressed
                ? "Tokni yoqish uchun tugmani bosing"
                : "Tokni uzish uchun tugmani bosing",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _isPressed = !_isPressed;
                  });
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(400, 400),
                  padding: EdgeInsets.zero,
                  backgroundColor:
                      _isPressed ? Colors.transparent : Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        color: _isPressed ? Colors.green : Colors.red,
                      ),
                    ),
                    Text(
                      _isPressed ? "Tokni yoqish" : "Tokni uzish",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
