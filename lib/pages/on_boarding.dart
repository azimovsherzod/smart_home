import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/pages/login_page.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0A15),
      body: Center(
        // Изменено для центрации без больших отступов
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 130),
              width: 350, // Увеличьте размер контейнера
              height: 350,
              child: Image.asset(
                "assets/images/home_img 1.png",
                fit: BoxFit.contain, // Или попробуйте BoxFit.fill
              ),
            ),
            const Text(
              "Smart home",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              "Aqlli uy – hammasi bir tugmada!",
              style: TextStyle(fontSize: 20, color: Colors.grey[400]),
            ),
            const SizedBox(height: 40),
            Container(
              width: 250,
              height: 45,
              margin: EdgeInsets.only(top: 100),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Get ready",
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
