import 'package:flutter/material.dart';
import 'package:flutter_application/BuyVip.dart';
import 'package:flutter_application/LibraryPage.dart';
import 'package:flutter_application/Shop.dart';
import 'package:flutter_application/main.dart';
import 'package:provider/provider.dart';
import 'PurchasePage.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = 'نام';
  int credit = 5;
  int _currentIndex = 2;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LibraryPage()),
        );
      }
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
      if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Shop()),
        );
      }
    });
  }

  void logout() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void increaseCredit() {
    showIncreaseCreditDialog(context);
  }

  void editProfile() {}

  void anotherButtonPressed() {
     Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BuyVip()),
      );
  }

  void showIncreaseCreditDialog(BuildContext context) {
    int inputCredit = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('افزایش اعتبار'),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              inputCredit = int.tryParse(value) ?? 0;
            },
            decoration: InputDecoration(
              labelText: 'مبلغ اعتبار',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('انصراف'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('افزایش'),
              onPressed: () {
                  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PurchasePage()),
      );
                // setState(() {
                //   credit += inputCredit;

                // });

                // Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'صفحه‌ی حساب کاربری',
          style: TextStyle(
            color: Colors.black87,
            fontFamily: "B-NAZANIN",
            fontSize: 22,
          ),
        ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-photo/abstract-luxury-gradient-blue-background-smooth-dark-blue-with-black-vignette-studio-banner_1258-52379.jpg?size=626&ext=jpg"),
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SizedBox(height: 16),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                title: Text(
                  'اعتبار = ${credit.toString()} تومان',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "B-NAZANIN",
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: increaseCredit,
                  child: Text(
                    'افزایش اعتبار',
                    style: TextStyle(
                      fontFamily: "B-NAZANIN",
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: anotherButtonPressed,
                  child: Text(
                    'خرید اشتراک ویژه',
                    style: TextStyle(
                      fontFamily: "B-NAZANIN",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: editProfile,
              child: Text(
                'ویرایش',
                style: TextStyle(
                  fontFamily: "B-NAZANIN",
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: logout,
              child: Text(
                'خروج',
                style: TextStyle(
                  fontFamily: "B-NAZANIN",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_application/main.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_application/BuyVip.dart';
// import 'package:flutter_application/LibraryPage.dart';
// import 'package:flutter_application/Shop.dart';
// import 'PurchasePage.dart';

// import 'ThemeProvider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ThemeProvider(),
//       builder: (context, _) {
//         final themeProvider = Provider.of<ThemeProvider>(context);

//         return MaterialApp(
//           title: 'My App',
//           theme: themeProvider.getThemeData(),
//           home: Profile(),
//         );
//       },
//     );
//   }
// }

// class Profile extends StatefulWidget {
//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   String name = 'نام';
//   int credit = 5;
//   int _currentIndex = 2;

//   void _onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//       if (index == 1) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => LibraryPage()),
//         );
//       }
//       if (index == 0) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//       }
//       if (index == 3) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Shop()),
//         );
//       }
//     });
//   }

//   void logout() {
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (context) => LoginPage()),
//     );
//   }

//   void increaseCredit() {
//     showIncreaseCreditDialog(context);
//   }

//   void editProfile() {}

//   void anotherButtonPressed() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => BuyVip()),
//     );
//   }

//   void showIncreaseCreditDialog(BuildContext context) {
//     int inputCredit = 0;

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('افزایش اعتبار'),
//           content: TextField(
//             keyboardType: TextInputType.number,
//             onChanged: (value) {
//               inputCredit = int.tryParse(value) ?? 0;
//             },
//             decoration: InputDecoration(
//               labelText: 'مبلغ اعتبار',
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('انصراف'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text('افزایش'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => PurchasePage()),
//                 );
//                 // setState(() {
//                 //   credit += inputCredit;
//                 // });

//                 // Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     bool isDarkModeEnabled = themeProvider.isDarkModeEnabled;

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: Text(
//           'صفحه‌ی حساب کاربری',
//           style: TextStyle(
//             color: Colors.black87,
//             fontFamily: "B-NAZANIN",
//             fontSize: 22,
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         fixedColor: Colors.black87,
//         currentIndex: _currentIndex,
//         onTap: _onTabTapped,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               color: Colors.black87,
//             ),
//             label: 'خانه',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.library_books,
//               color: Colors.black87,
//             ),
//             label: 'کتابخانه',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person_2_outlined,
//               color: Colors.black87,
//             ),
//             label: 'پروفایل',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.add_shopping_cart_rounded,
//               color: Colors.black87,
//             ),
//             label: 'فروشگاه',
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: NetworkImage(
//                   "https://img.freepik.com/free-photo/abstract-luxury-gradient-blue-background-smooth-dark-blue-with-black-vignette-studio-banner_1258-52379.jpg?size=626&ext=jpg"),
//             ),
//             SizedBox(height: 16),
//             Text(
//               name,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             SizedBox(height: 16),
//             Card(
//               margin: EdgeInsets.symmetric(horizontal: 16),
//               child: ListTile(
//                 title: Text(
//                   'اعتبار = ${credit.toString()} تومان',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: "B-NAZANIN",
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: increaseCredit,
//                   child: Text(
//                     'افزایش اعتبار',
//                     style: TextStyle(
//                       fontFamily: "B-NAZANIN",
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: anotherButtonPressed,
//                   child: Text(
//                     'خرید اشتراک ویژه',
//                     style: TextStyle(
//                       fontFamily: "B-NAZANIN",
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: editProfile,
//               child: Text(
//                 'ویرایش',
//                 style: TextStyle(
//                   fontFamily: "B-NAZANIN",
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: logout,
//               child: Text(
//                 'خروج',
//                 style: TextStyle(
//                   fontFamily: "B-NAZANIN",
//                 ),
//               ),
//             ),

//             // Add this widget
//             ListTile(
//               title: Text('Dark Mode'),
//               trailing: Switch(
//                 value: isDarkModeEnabled,
//                 onChanged: (value) {
//                   themeProvider.setDarkMode(value);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
