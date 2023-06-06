import 'package:flutter/material.dart';

import 'Book.dart';

class Desceription extends StatefulWidget {
  Book _book;
  Desceription(this._book);

  @override
  _DesceriptionState createState() => _DesceriptionState();
}

class _DesceriptionState extends State<Desceription> {
  String _userOpinion = '';
  int _userRating = 0;
  final _opinionTextFieldFocusNode = FocusNode();

  @override
  void dispose() {
    _opinionTextFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _opinionTextFieldFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "جزئیات",
            style: TextStyle(
              color: Colors.black87,
              fontFamily: "B-NAZANIN",
              fontSize: 22,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.black87,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  alignment: Alignment.topCenter,
                  height: 26,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 84, 92, 209),
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                  ),
                  child: Center(
                    child: Text(
                      "موجود یا ناموجود",
                      style: TextStyle(
                        fontFamily: "B-NAZANIN",
                        color: Color.fromARGB(221, 0, 0, 0),
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Einstein_1921_by_F_Schmutzer_-_restoration.jpg/330px-Einstein_1921_by_F_Schmutzer_-_restoration.jpg",
                  height: 300,
                  width: 300,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "سال انتشار",
                    style: TextStyle(
                      fontFamily: "B-NAZANIN",
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 14),
                  Text(
                    "عنوان",
                    style: TextStyle(
                      fontFamily: "B-NAZANIN",
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 14),
                  Icon(Icons.star),
                  Text(
                    "امتیاز",
                    style: TextStyle(
                      fontFamily: "B-NAZANIN",
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Align(
                child: Text(
                  "نویسنده",
                  style: TextStyle(
                    fontFamily: "B-NAZANIN",
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
                alignment: Alignment.center,
              ),
              InkWell(
                onTap: () {
                  // Handle the buy button tap event
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                    ),
                    child: Center(
                      child: Text(
                        "خرید : قیمت 0000",
                        style: TextStyle(
                          fontFamily: "B-NAZANIN",
                          color: Colors.black,
                          fontSize: 33,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                child: Text(
                  ":ژانر",
                  style: TextStyle(
                    fontFamily: "B-NAZANIN",
                    fontSize: 25,
                  ),
                ),
                alignment: Alignment.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 80,
                  color: Colors.black38,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          // Handle the click event for the first icon
                        },
                        child: Icon(Icons.chrome_reader_mode, size: 40),
                      ),
                      InkWell(
                        onTap: () {
                          // Handle the click event for the second icon
                        },
                        child: Icon(Icons.download, size: 40),
                      ),
                      InkWell(
                        onTap: () {
                          // Handle the click event for the third icon
                        },
                        child: Icon(Icons.hearing, size: 40),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "نظرات کاربران",
                  style: TextStyle(
                    fontFamily: "B-NAZANIN",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text("نظر"),
                  );
                },
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  focusNode: _opinionTextFieldFocusNode,
                  onChanged: (value) {
                    // setState(() {
                    //   _userOpinion = value;
                    // });
                  },
                  decoration: InputDecoration(
                    labelText: "نظر شما",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "امتیاز دهید: ",
                    style: TextStyle(
                      fontFamily: "B-NAZANIN",
                      fontSize: 18,
                    ),
                  ),
                  DropdownButton<int>(
                    value: 4,
                    onChanged: (value) {
                      setState(() {
                        _userRating = value!;
                      });
                    },
                    items:
                        [1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // if (_userOpinion.isNotEmpty && _userRating > 0) {
                  //   setState(() {
                  //     widget._book.userOpinions.add("امتیاز: $_userRating, نظر: $_userOpinion");
                  //     _userOpinion = '';
                  //     _userRating = 0;
                  //   });
                  // }
                },
                child: Text("ثبت نظر"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
