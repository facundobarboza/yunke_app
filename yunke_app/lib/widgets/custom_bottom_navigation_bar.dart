import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // showSelectedLabels: false,
      // showUnselectedLabels: false,
      selectedItemColor: Colors.red,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black87,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Calendario"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil"
          )
      ]
    );
  }
}
