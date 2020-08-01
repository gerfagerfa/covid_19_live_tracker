import 'package:flutter/material.dart';

class NavigationItem {

  String title;

  NavigationItem(this.title);

}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem("Worldwide"),
    NavigationItem("Country"),
  ];
}