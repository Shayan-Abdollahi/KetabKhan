import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BuyVip extends StatefulWidget {
  @override
  _BuyVipState createState() => _BuyVipState();
}

class _BuyVipState extends State<BuyVip> {
  TextEditingController _cardPassController = TextEditingController();
  FocusNode _cardPassFocusNode = FocusNode();
  String _selectedOption = 'Option 1';
  String _selectedOptionText = '';

  @override
  void dispose() {
    _cardPassController.dispose();
    _cardPassFocusNode.dispose();
    super.dispose();
  }

  void updateSelectedOptionText() {
 if (_selectedOption == 'Option 1') {
      _selectedOptionText = '100000 تومان';
    
    } else if (_selectedOption == 'Option 2') {
      _selectedOptionText = '200000 تومان';
     
    } else if (_selectedOption == 'Option 3') {
      _selectedOptionText = '300000 تومان';
     
    } else {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _cardPassFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.black87,
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'صفحه پرداخت',
            style: TextStyle(
              color: Colors.black87,
              fontFamily: "B-NAZANIN",
              fontSize: 22,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: _selectedOption,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedOption = newValue!;
                      updateSelectedOptionText();
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'Option 1',
                      child: Text('یک ماه'),
                    ),
                    DropdownMenuItem(
                      value: 'Option 2',
                      child: Text('دو ماه'),
                    ),
                    DropdownMenuItem(
                      value: 'Option 3',
                      child: Text('سه ماه'),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  _selectedOptionText,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _cardPassController,
                  focusNode: _cardPassFocusNode,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'رمز کارت',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String cardPass = _cardPassController.text;
                    if (cardPass == "1") {
                      Fluttertoast.showToast(
                        msg: 'پرداخت موفقیت آمیز',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );
                    } else if (cardPass == "2") {
                      Fluttertoast.showToast(
                        msg: 'رمز نادرست',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );
                    } else if (cardPass == "3") {
                      Fluttertoast.showToast(
                        msg: 'موجودی ناکافی',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );
                    }
                  },
                  child: Text('پرداخت'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
