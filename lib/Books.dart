import 'package:flutter/material.dart';
import 'Book.dart';
import 'Desceription.dart';

class Books extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Book test1 = Book("ali", false, "3", true, "sds", "ali", 1397);
    List<Book> _items = [];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.black87),
        title: Text(
          'کتاب‌ها',
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
              if (value == 0) {
              } else if (value == 1) {
              } else if (value == 2) {}
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Text(
                  'تازه‌ها',
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
                child: Text('پرفروشترینها',
                    style: TextStyle(
                        color: Colors.white70,
                        fontFamily: "B-NAZANIN",
                        fontSize: 14)),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('علاقه‌مندی‌ها',
                    style: TextStyle(
                        color: Colors.white70,
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
