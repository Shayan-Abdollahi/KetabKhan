class Book{
   String _name;
   bool _available;
   String _price;
   bool _vip;
   String _image_url;
   String _author;
   int _publishYear;
   Book(this._name,this._vip,this._price,this._available,this._image_url,this._author,this._publishYear);
    bool get vip=> _vip;
    bool get available=>_available;
    String get name=> _name;
    String get price=> _price;
    String get image_url=> _image_url;
    String get author=> _author;
    int get publishYear=>_publishYear;
}