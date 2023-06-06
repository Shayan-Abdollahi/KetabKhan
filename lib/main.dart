import 'dart:convert';
import 'package:flutter_application/Books.dart';
import 'package:flutter_application/Shop.dart';
import 'package:flutter_application/VoiceBooks.dart';

import 'Desceription.dart';
import 'LibraryPage.dart';
import 'package:flutter/material.dart';

import 'Book.dart';
import 'Profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('ورود',
            style: TextStyle(
                color: Colors.black87, fontFamily: "B-NAZANIN", fontSize: 22)),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'ایمیل',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'رمز',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text('ورود'),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('ثبت نام'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.black87),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('ثبت نام',
            style: TextStyle(
                color: Colors.black87, fontFamily: "B-NAZANIN", fontSize: 22)),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'ایمیل',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'رمز',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text('ثبت نام'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LibraryPage()),
      );
    }
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Shop()),
      );
    }
  }

  Book test1 = Book("ali", false, "3", true, "sds", "ali", 1397);
  List<Book> _items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "کتابخوان",
          style: TextStyle(
            color: Colors.black87,
            fontFamily: "B-NAZANIN",
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            child: Card(
              elevation: 4,
              child: Center(
                child: Text(
                  'کتاب',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            color: Color.fromARGB(255, 145, 228, 236),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Books()),
                    );
                  },
                  child: Text(
                    'کتاب‌ها',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                        fontFamily: "B-NAZANIN"),
                  ),
                ),
                SizedBox(width: 40),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VoiceBooks()),
                    );
                  },
                  child: Text(
                    'فایل‌های صوتی',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                        fontFamily: "B-NAZANIN"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black87,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black87,
            ),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books,
              color: Colors.black87,
            ),
            label: 'کتابخانه',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              color: Colors.black87,
            ),
            label: 'پروفایل',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_shopping_cart_rounded,
              color: Colors.black87,
            ),
            label: 'فروشگاه',
          ),
        ],
      ),
    );
  }
}
