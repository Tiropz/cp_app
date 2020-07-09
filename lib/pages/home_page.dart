import 'package:cp_app/components/bottom_navy_bar.dart';
import 'package:cp_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:cp_app/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cp_app/models/todo.dart';
import 'dart:async';
import 'package:cp_app/pages/calendar_page.dart';
import 'package:cp_app/pages/param_page.dart.';
import 'package:cp_app/pages/contact_page.dart.';
import 'package:cp_app/pages/news_page.dart.';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //bool _isEmailVerified = false;
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[800],
      body: SizedBox.expand(
        child: PageView(

          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            News(),
            Calendar(),
            Contact(),
            Param(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: BottomNavyBar(

          backgroundColor: Color.fromRGBO(58, 66, 86, 1),
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                textAlign: TextAlign.center,
                activeColor: Colors.teal,
                title: Text('News'),
                icon: Icon(Icons.library_books)
            ),
            BottomNavyBarItem(
                textAlign: TextAlign.center,
                activeColor: Colors.teal,
                title: Text('Calendrier'),
                icon: Icon(Icons.calendar_today)
            ),
            BottomNavyBarItem(
                textAlign: TextAlign.center,
                activeColor: Colors.teal,
                title: Text('Contact'),
                icon: Icon(Icons.info)
            ),
            BottomNavyBarItem(
                textAlign: TextAlign.center,
                activeColor: Colors.teal,
                title: Text('Paramètres'),
                icon: Icon(Icons.settings)
            ),
          ],
        ),
      ),
    );
  }
}



