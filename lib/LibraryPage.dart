import 'package:flutter/material.dart';
import 'Book.dart';
import 'package:flutter_application/Profile.dart';
import 'package:flutter_application/Shop.dart';
import 'main.dart';
import 'Desceription.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;

    void _onTabTapped(int index) {
      _currentIndex = index;
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
      } else if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Shop()),
        );
      }
    }

    Book test1 = Book("ali", false, "3", true, "sds", "ali",1397);
    List<Book> _items = [];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'کتابخانه',
          style: TextStyle(
            color: Colors.black87,
            fontFamily: "B-NAZANIN",
            fontSize: 22,
          ),
        ),
        actions: [
          PopupMenuButton<int>(
            color: Colors.black87,
            onSelected: (value) {
              // Handle menu item selection
              if (value == 0) {
                // Option 1 selected
                // Perform desired action
              } else if (value == 1) {
                // Option 2 selected
                // Perform desired action
              } else if (value == 2) {
                // Option 3 selected
                // Perform desired action
              } else if (value == 4) {
                // Option 4 selected
                // Perform desired action
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Text(
                  'آخرین مطالعه',
                  style: TextStyle(
                      color: Colors.white70,
                      fontFamily: "B-NAZANIN",
                      fontSize: 14),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.start,
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Text('فایل های صوتی',
                    style: TextStyle(
                        color: Colors.white70,
                        fontFamily: "B-NAZANIN",
                        fontSize: 14)),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('کتاب',
                    style: TextStyle(
                        color: Colors.white70,
                        fontFamily: "B-NAZANIN",
                        fontSize: 14)),
              ),
              PopupMenuItem(
                value: 3,
                child: Text('محبوب ترین',
                    style: TextStyle(
                        color: Colors.white60,
                        fontFamily: "B-NAZANIN",
                        fontSize: 14)),
              ),
            ],
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          6,
          (int position) {
            _items.add(test1);
            return generateItem(_items[0], context);
          },
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
    );
  }
}

Card generateItem(Book book, context) {
  return Card(
    elevation: 5,
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Desceription(book),
        ));
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 450,
              height: 140,
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Einstein_1921_by_F_Schmutzer_-_restoration.jpg/330px-Einstein_1921_by_F_Schmutzer_-_restoration.jpg",
              ),
            ),
            Text(
              "عنوان",
              style: TextStyle(
                fontFamily: "B-NAZANIN",
                color: Colors.black87,
                fontSize: 13,
              ),
            ),
            Text(
              "قیمت",
              style: TextStyle(
                fontFamily: "B-NAZANIN",
                color: Colors.black87,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
