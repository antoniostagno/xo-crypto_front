import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xo_crypto/models/enum_screens.dart';
import 'package:xo_crypto/screens/coin_grid.dart';
import 'package:xo_crypto/screens/coin_list.dart';


BottomNavigationBar buildBottomNav(BuildContext context, Screens screen) {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.lightbulb),
        label: 'Analysis',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ],
    currentIndex: screenValue(screen),
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.grey,
    onTap: (index){
      if(index!=screenValue(screen)) {
        if (index == 0) {
          Navigator.pushNamed(context, CoinList.id);
        }
        else if (index == 1) {
          Navigator.pushNamed(context, CoinGrid.id);
        }
        else if (index == 2) {
          Navigator.pushNamed(context, CoinList.id);
        }
      }
    },
  );
}