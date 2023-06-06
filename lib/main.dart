import 'package:flutter/material.dart';

/*
Propagation Tool: Create a tool that provides real-time propagation forecasts and conditions for various frequency bands. Users can input their location and desired band, and the app can display current propagation conditions, solar activity, and other relevant data to optimize their radio communications.
*/

void main() => runApp(const MovieApp());

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainController(),
    );
  }
}

class MainController extends StatefulWidget {
  const MainController({super.key});

  @override
  State<MainController> createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Business',
      style: optionStyle,
    ),
    Text(
      'School',
      style: optionStyle,
    ),
    Text(
      'Settings',
      style: optionStyle,
    ),
    Text(
      'Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060606), //<-- SEE HERE
      appBar: AppBar(
        title: const Text('Movie App'),
      ),
      body: Column(
        children: <Widget>[
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hey, Bob',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 70,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'What are we watching today?',
              style: TextStyle(
                color: Color(0xFF656565),
                fontWeight: FontWeight.normal,
                fontSize: 35,
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Image.network('https://picsum.photos/200/200')),
          Wrap(
            spacing: 100,
            children: const <Widget>[
              // ============ start of rajesh ============
              //
              //const Directionality(
              //     textDirection: TextDirection.ltr,
              //     child: Row(
              //       children: [Chip(label: Text('asdad'))],
              //     ))
              //
              // ============ end of rajesh ============
              Chip(
                label: Text('Trending'),
                labelStyle: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 20,
                ),
                backgroundColor: Color(0xFFddbb40),
              ),

              Text('Movies',
                style: TextStyle(
                  color: Color(0xFF959595),
                  fontSize: 20,
                )
              ),

              Text('Series',
                style: TextStyle(
                  color: Color(0xFF959595),
                  fontSize: 20,
                )
              ),

              Text('TV Series',
                style: TextStyle(
                  color: Color(0xFF959595),
                  fontSize: 20,
                )
              ),

              Text('TV Shows',
                style: TextStyle(
                  color: Color(0xFF959595),
                  fontSize: 20,
                )
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black87,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.black87,
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.black87,
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.black87,
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.black87,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow[700],
        onTap: _onItemTapped,
      ),
    );
  }
}
