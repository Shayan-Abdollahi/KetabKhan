import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  TextEditingController _cardPassController = TextEditingController();
  FocusNode _cardPassFocusNode = FocusNode();

  @override
  void dispose() {
    _cardPassController.dispose();
    _cardPassFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Unfocus (unselect) the card number field when clicking outside of it
        _cardPassFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, 
           leading: IconButton(
            icon : Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.black87 ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('صفحه پرداخت',style: TextStyle(
            color: Colors.black87,
            fontFamily: "B-NAZANIN",
            fontSize: 22,
          ),),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                SizedBox(height: 16.0),
                CardNumberTextField(
                  controller: _cardPassController,
                  focusNode: _cardPassFocusNode,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String cardPass = _cardPassController.text;
                    // Perform the purchase logic here

                    // Show different toast notifications based on conditions
                    if (cardPass=="1") {
                      Fluttertoast.showToast(
                        msg: 'پرداخت موفقیت آمیز',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );
                    } else if (cardPass=="2"){
                      Fluttertoast.showToast(
                        msg: 'رمز نادرست',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );
                    }else if (cardPass =="3"){
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

class CardNumberTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  CardNumberTextField({
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: ' رمز کارت',
        border: OutlineInputBorder(),
      ),
    );
  }
}
