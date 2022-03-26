import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/widgets/hotel_carousel.dart';

import '../widgets/destination_caroulse.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int _selected = 0;
    int _currentTab = 0;
    List<IconData> _icons = [
      FontAwesomeIcons.plane,
      FontAwesomeIcons.bed,
      FontAwesomeIcons.walking,
      FontAwesomeIcons.biking
    ];

    Widget _buildIcon(int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _selected = index;
          });
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: _selected == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            _icons[index],
            size: 25,
            color: _selected == index
                ? Theme.of(context).primaryColor
                : Color(0xFFB4C1C4),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 120),
              child: Text(
                "What would you like to find?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            DestinetionCarousel(),
            SizedBox(
              height: 20,
            ),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value){
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage("http://i.imgur.com/zL4Krbz.jpg"),
            ),
            label: "",
          )
        ],
      ),
    );
  }
}
