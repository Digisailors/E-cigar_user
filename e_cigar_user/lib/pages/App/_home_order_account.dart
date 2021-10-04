import 'package:e_cigar_user/Components/animated_bottom_bar.dart';
import 'package:e_cigar_user/Locale/locales.dart';
import 'package:e_cigar_user/pages/App/account_page.dart';
import 'package:e_cigar_user/pages/App/home_page.dart';
import 'package:e_cigar_user/pages/App/order_page.dart';
import 'package:flutter/material.dart';

class HomeOrderAccount extends StatefulWidget {
  final int index;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  HomeOrderAccount([this.index = 0]);
  @override
  State<HomeOrderAccount> createState() => _HomeOrderAccountState();
}

class _HomeOrderAccountState extends State<HomeOrderAccount> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  static String bottomIconHome = 'images/footermenu/ic_home.png';

  static String bottomIconOrder = 'images/footermenu/ic_orders.png';

  static String bottomIconAccount = 'images/footermenu/ic_profile.png';

  @override
Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;
    final List<BarItem> barItems = [
      BarItem(
        text: appLocalization.homeText,
        image: bottomIconHome,
      ),
      BarItem(
        text: "Orders",
        image: bottomIconOrder,
      ),
      BarItem(
        text: "Account",
        image: bottomIconAccount,
      ),
    ];
    const List<Widget> _children =[
      HomePage(),
      OrderPage(),
      AccountPage(),
    ];
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: AnimatedBottomBar(
          barItems: barItems,
          onBarTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}