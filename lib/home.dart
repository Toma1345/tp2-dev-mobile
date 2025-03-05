import 'package:flutter/material.dart';
import 'package:tp2/card1.dart';
import 'package:tp2/card2.dart';
import 'package:tp2/card3.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    Ecran1(),
    Ecran2(),
    Ecran3()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application TD2", style: Theme.of(context).textTheme.headlineLarge)
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(Icons.card_membership),
              label: 'Card 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_membership),
              label: 'Card 2 - API',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_membership),
              label: 'Card 3 - Api REST',
            )
          ]
      ),
    );
  }
}
