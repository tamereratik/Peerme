import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final Users user;

  HomePage({Key key, @required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  TabItemTop _currentTab = TabItemTop.Anasayfa;

  Map<TabItemTop, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItemTop.Anasayfa: GlobalKey<NavigatorState>(),
    TabItemTop.Etkinlikler: GlobalKey<NavigatorState>(),
    TabItemTop.Esya: GlobalKey<NavigatorState>(),
    TabItemTop.Kulupler: GlobalKey<NavigatorState>(),
    TabItemTop.Profil: GlobalKey<NavigatorState>(),
  };

  Map<TabItemTop, Widget> tumSayfalar() {

    return {
      TabItemTop.Anasayfa: NewHomePage(),
      TabItemTop.Etkinlikler: NewEtkinlikler(),
      TabItemTop.Esya:  ChangeNotifierProvider(
           create: (_) => AllUserViewModel(userid: widget.user.userID),
          child: NewEsyaAnasayfa(),
         ),
      TabItemTop.Kulupler: Kulupler(),
      TabItemTop.Profil: NewProfil1(),
    };
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Platform.isAndroid ? NotificationHandler().initializeFCMNotification(context) : null;

    PushNotificationsManager().init2();

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
      !await navigatorKeys[_currentTab].currentState.maybePop(),
      child: MyCustomBottomNavigation(
        sayfaOlusturucu: tumSayfalar(),
        navigatorKeys: navigatorKeys,
        currentTab: _currentTab,
        onSelectedTab: (secilenTab) {


    if (secilenTab == _currentTab) {
    navigatorKeys[secilenTab]
        .currentState
        .popUntil((route) => route.isFirst);
    } else {
    setState(() {
    _currentTab = secilenTab;
    });}

        },
      ),
    );
  }
}
