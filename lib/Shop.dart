import 'package:flutter/material.dart';
import 'package:flutter_application/LibraryPage.dart';
import 'Book.dart';
import 'package:flutter_application/Profile.dart';
import 'main.dart';
import 'Desceription.dart';
import 'main.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int _currentIndex = 3;
  TextEditingController _searchController = TextEditingController();
  List<Book> _items = [];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
      } else if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LibraryPage()),
        );
      } else if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  Book test1 = Book("ali", false, "3", true, "sds", "ali", 1397);
  // @override
  // void initState(){
  //   super.initState;
  //   fetchItems();
  // }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: TextField(
              controller: _searchController,
              onChanged: (value) {
                print(value);
              },
              decoration: InputDecoration(
                fillColor: Colors.black87,
                hintText: 'جستجو',
                hintStyle: TextStyle(color: Colors.black87),
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.black87),
            ),
            actions: [
              PopupMenuButton<int>(
                color: Colors.black87,
                onSelected: (value) {
                  if (value == 0) {
                  } else if (value == 1) {
                  } else if (value == 2) {}
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Text(
                      'بیشترین پسند',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: "B-NAZANIN",
                        fontSize: 14,
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      'گرانترین',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: "B-NAZANIN",
                        fontSize: 14,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text(
                      'ارزانترین',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: "B-NAZANIN",
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            3,
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
      ),
    );
  }
  // void fetchItems() async{

  //   var url=Uri.http("");
  //   var response = await get(url);

  //   print(utf8.decode(response.bodyBytes));

  //   setState(() {
  //     var data=json.decode(utf8.decode(response.bodyBytes));
  //     for(var i in data){
  //       var dataItem=Book(i['name'], i['vip'],i['price'], i['available'],i['image_url'],i['author']);
  //       _items.add(dataItem);
  //     }
  //   });
  // }
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
