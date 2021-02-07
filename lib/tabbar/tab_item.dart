 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabItem { Anasayfa, Egitim,Ihtiyaclar,Performans ,Profil }

class TabItemData {
  final String title;
  final IconData icon;
  final Color renk;

  TabItemData(this.title, this.icon,this.renk);

  static Map<TabItem, TabItemData> tumTablar = {
    TabItem.Anasayfa: TabItemData("Anasayfa", Icons.home, Colors.black),
    TabItem.Egitim: TabItemData("Eğitim", Icons.event,Colors.black),
    TabItem.Ihtiyaclar: TabItemData("İhtiyaç", Icons.business_center,Colors.black),
    TabItem.Performans: TabItemData("Performans", Icons.supervised_user_circle,Colors.black),
    TabItem.Profil: TabItemData("Profil", Icons.person,Colors.black),
  };
}
