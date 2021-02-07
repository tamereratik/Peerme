import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexacore/tabbar/tab_item.dart';
import 'package:jumping_bottom_nav_bar/jumping_bottom_nav_bar.dart';



class MyCustomBottomNavigation extends StatefulWidget {
  const MyCustomBottomNavigation(
      {Key key,
        @required this.currentTab,
        @required this.onSelectedTab,
        @required this.sayfaOlusturucu,
        @required this.navigatorKeys})
      : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> sayfaOlusturucu;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  _MyCustomBottomNavigationState createState() => _MyCustomBottomNavigationState();
}

class _MyCustomBottomNavigationState extends State<MyCustomBottomNavigation> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return  JumpingTabBar(
        onChangeTab: onChangeTab,
        circleGradient: LinearGradient(
        colors: [
        Colors.purpleAccent,
        Colors.deepPurple,
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        ),
      items: [
        _navItemOlustur(TabItem.Anasayfa),
        _navItemOlustur(TabItem.Egitim),
        _navItemOlustur(TabItem.Ihtiyaclar),
        _navItemOlustur(TabItem.Yarisma),
        _navItemOlustur(TabItem.Profil),
      ],
        selectedIndex: (index) => widget.onSelectedTab(TabItem.values[index]),
    );

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.black,
        items: [
          _navItemOlustur(TabItem.Anasayfa),
          _navItemOlustur(TabItem.Egitim),
          _navItemOlustur(TabItem.Ihtiyaclar),
          _navItemOlustur(TabItem.Yarisma),
          _navItemOlustur(TabItem.Profil),
        ],
        onTap: (index) => widget.onSelectedTab(TabItem.values[index]),
      ),
      tabBuilder: (context, index) {
        final gosterilecekItem = TabItem.values[index];

        return CupertinoTabView(
            navigatorKey: widget.navigatorKeys[gosterilecekItem],
            builder: (context) {

              return widget.sayfaOlusturucu[gosterilecekItem];
            });
      },
    );
  }

  BottomNavigationBarItem _navItemOlustur(TabItem tabItem) {
    final olusturulacakTab = TabItemData.tumTablar[tabItem];

    return BottomNavigationBarItem(
      icon: Icon(olusturulacakTab.icon),
      title: Text(olusturulacakTab.title),
      backgroundColor: Colors.black,
    );
  }
}
