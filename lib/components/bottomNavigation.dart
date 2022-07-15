import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Harjoitukset',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Suunnitelma',
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        //onTap: _onItemTapped,
      );
    /*return BottomAppBar( //bottom navigation bar on scaffold
    color:Colors.tealAccent,
    shape: CircularNotchedRectangle(), //shape of notch
    notchMargin: 5, //notche margin between floating button and bottom appbar
    child: Row( //children inside bottom appbar
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () {},),
        IconButton(icon: Icon(Icons.print, color: Colors.white,), onPressed: () {},),
      ],
    ), 
   );*/
  }
}
