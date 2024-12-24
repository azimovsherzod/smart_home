import 'package:flutter/material.dart';
import 'package:flutter_application/pages/room_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget buildCustomContainer(String title, BuildContext context) {
    bool isPool = title == "Basseyn";
    bool isHomeEnergy = title == "Uy energiyasi";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoomPage(
              title: title,
              isHomeEnergy: isHomeEnergy,
              isPool: isPool,
            ),
          ),
        );
      },
      child: Container(
        width: 400,
        height: 50,
        margin: EdgeInsets.fromLTRB(40, 20, 40, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          color: Colors.lightBlue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.navigate_next_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "Mehmonxona",
      "Oshxona",
      "Garaj",
      "Yotoqxona",
      "Bolalar xonasi",
      "Vanna",
      "Mehmonlar yotoqxona",
      "Omborxona",
      "Basseyn",
      "Uy energiyasi",
      "Konditsioner",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Smart\n     Home',
            style: TextStyle(
                fontSize: 30, fontFamily: 'Montserrat', color: Colors.white),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60),
          ),
        ),
        flexibleSpace: Padding(
          padding: const EdgeInsets.fromLTRB(200, 50, 10, 10),
          child: Image.asset(
              'assets/images/[removal.ai]_22a8fd7c-91ce-4bb2-b346-0a13aed1765e-png-transparent-computer-icons-house-home-house-elevation-property-canl 1.png'),
        ),
        toolbarHeight: 200,
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        children: List.generate(
          titles.length,
          (index) => buildCustomContainer(titles[index], context),
        ),
      ),
    );
  }
}
