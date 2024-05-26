import 'package:flutter/material.dart';

List<ListTile> accountSettingMenus = [
  const ListTile(
    leading: Text(
      "Personal",
      style: TextStyle(fontSize: 18),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      size: 18,
    ),
  ),
  const ListTile(
    leading: Text(
      "Notifications",
      style: TextStyle(fontSize: 18),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      size: 18,
    ),
  ),
  const ListTile(
    leading: Text(
      "Time Spent",
      style: TextStyle(fontSize: 18),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      size: 18,
    ),
  ),
];

List<ListTile> helpAndSupport = [
  const ListTile(
    leading: Text(
      "Privacy Policy",
      style: TextStyle(fontSize: 18),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      size: 18,
    ),
  ),
  const ListTile(
    leading: Text(
      "Terms & Conditions",
      style: TextStyle(fontSize: 18),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      size: 18,
    ),
  ),
  const ListTile(
    leading: Text(
      "FAQ & Help",
      style: TextStyle(fontSize: 18),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      size: 18,
    ),
  ),
];

List<ListTile> editInformation = [
  const ListTile(
    leading: Icon(
      Icons.person,
      size: 18,
    ),
    title: Text(
      "Xavier Karki",
      style: TextStyle(fontSize: 22),
    ),
    trailing: Icon(Icons.edit_outlined),
  ),
  const ListTile(
    leading: Icon(
      Icons.email_outlined,
      size: 18,
    ),
    title: Text(
      "xavier.karki@ratnapark.edu.np",
      style: TextStyle(fontSize: 22),
    ),
    trailing: Icon(Icons.edit_outlined),
  )
];
