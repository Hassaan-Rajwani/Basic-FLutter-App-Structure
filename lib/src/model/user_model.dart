import 'package:flutter/material.dart';

class UserDetailModal extends ChangeNotifier {
  String _userName = '';
  String _email = '';
  String _address = '';
  String _zipCode = '';

  get userName => _userName;
  get email => _email;
  get address => _address;
  get zipCode => _zipCode;

  setDetail(body) {
    _userName = body['username'];
    _email = body['email'];
    _address = body['address']['street'];
    _zipCode = body['address']['zipcode'];
    notifyListeners();
  }
}
