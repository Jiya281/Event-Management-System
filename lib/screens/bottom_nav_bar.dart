// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:event_city/screens/chat.dart';
import 'package:event_city/screens/events_page.dart';
import 'package:event_city/screens/profile.dart';
import 'package:event_city/screens/wishlist.dart';
// import 'package:event_city/screens/wishlist.dart';

import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int myCurrentIndex = 0;
  List pages = [
    EventListPage(),
    ChatPage(),
    WishlistPage(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[myCurrentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 12,
                  offset: const Offset(2, 5))
            ]),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.redAccent,
              unselectedItemColor: Colors.black,
              currentIndex: myCurrentIndex,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outlined), label: 'Wishlist'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), label: "Profile"),
              ],
            )),
      ),
    );
  }
}
