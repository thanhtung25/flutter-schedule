// ignore: unused_import
import 'dart:async';

import 'package:appschedule/fire_base/fie_base_auth.dart';

class AuthBloc{
  final _firAuth = FireAuth();
  final StreamController _nameControler =  StreamController();
  final StreamController _emailControler =  StreamController();
  final StreamController _passControler =  StreamController();
  final StreamController _phoneControler =  StreamController();
  Stream get nameStream => _nameControler.stream;
  Stream get emailStream => _emailControler.stream;
  Stream get passStream => _passControler.stream;
  Stream get phoneStream => _phoneControler.stream;
  bool isValid(String name, String email, String pass, String phone){
    if(name == null || name.length == 0){
      _nameControler.sink.addError('Введите имя');
      return false;
    }
    _nameControler.sink.add("");

    if(phone == null || phone.length == 0){
      _phoneControler.sink.addError('Nhập số điện thoại');
      return false;
    }
    _phoneControler.sink.add("");

    if(email == null || email.length == 0){
      _emailControler.sink.addError('Nhập email');
      return false;
    }
    _emailControler.sink.add("");

    if(pass == null || pass.length == 0){
      _passControler.sink.addError('Mật khẩu phải trên 5 kí tự');
      return false;
    }
    _passControler.sink.add("");
    return true;
  }
  void signUp(String email, String pass, String phone, String name,Function onSuccess,Function(String) onSignUpError){
    _firAuth.signUp(email, pass, name, phone,onSuccess, onSignUpError);
  }
  void signIn(String email, String pass,Function onSuccess, Function(String) onSignInError){
    _firAuth.signIn(email, pass, onSuccess, onSignInError);
  }
  void dispose(){
    _nameControler.close();
    _emailControler.close();
    _passControler.close();
    _phoneControler.close();
  }
}