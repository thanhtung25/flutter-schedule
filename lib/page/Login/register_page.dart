import 'package:appschedule/blocs/auth_bloc.dart';
import 'package:appschedule/page/Home/home_page.dart';
import 'package:appschedule/page/Login/dialog/loading_dialog.dart';
import 'package:appschedule/page/Login/dialog/msg_dialog.dart';
import 'package:appschedule/page/Login/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  AuthBloc authBloc = AuthBloc();
  final TextEditingController _nameControler =  TextEditingController();
  final TextEditingController _emailControler =  TextEditingController();
  final TextEditingController _passControler =  TextEditingController();
  final TextEditingController _phoneControler =  TextEditingController();
  @override
  void dispose(){
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
        appBar: AppBar(
          backgroundColor: const Color(0xffFBEEE4),
          iconTheme: const IconThemeData(color: Color(0xffFF715D)),
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: const BoxConstraints.expand(),
          color: const Color(0xffFBEEE4),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20,),
                const Image(
                  width: 200,
                  image: AssetImage('assets/images/schedule/lich2.png'),
                ),
                const Text(
                  'Welcome Schedule!',
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFF715D),
                  ),
                ),
                const Text(
                  'Signup with Schedule in simple steps',
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Color(0xffFF715D),
                  ),
                ),

                 Padding(
                  padding:const EdgeInsets.fromLTRB(10,30,10,20),
                  child: StreamBuilder(
                    stream: authBloc.nameStream,
                    builder: (context, snapshot) {
                      return  TextField(
                        controller: _nameControler,
                        style:const TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffFF9E74), 
                        ),
                        decoration: InputDecoration(
                          errorText: snapshot.hasError ? '${snapshot.error}' : null,
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:const EdgeInsets.all(10),
                          labelText: "Name",
                          prefixIcon:const SizedBox(
                            width: 50,child: Icon(Icons.person),
                          ),
                          border:const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.white,width: 1)
                          )
                        ),
                      );
                    }
                  ),
                ),

                 Padding(
                  padding:const EdgeInsets.fromLTRB(10,0,10,20),
                  child: StreamBuilder(
                    stream: authBloc.phoneStream,
                    builder: (context, snapshot) {
                      return  TextField(
                        controller: _phoneControler,
                        style:const TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffFF9E74), 
                        ),
                        decoration: InputDecoration(
                          errorText: snapshot.hasError ? '${snapshot.error}' : null,
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:const EdgeInsets.all(10),
                          labelText: "Phone Number",
                          prefixIcon:const SizedBox(
                            width: 50,child: Icon(Icons.phone),
                          ),
                          border:const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.white,width: 1)
                          )
                        ),
                      );
                    }
                  ),
                ),

                 Padding(
                  padding:const EdgeInsets.fromLTRB(10,0,10,20),
                  child: StreamBuilder(
                    stream: authBloc.emailStream,
                    builder: (context, snapshot) {
                      return  TextField(
                        controller: _emailControler,
                        style:const TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffFF9E74), 
                        ),
                        decoration: InputDecoration(
                          errorText: snapshot.hasError ? '${snapshot.error}' : null,
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          labelText: "Email",
                          prefixIcon:const SizedBox(
                            width: 50,child: Icon(Icons.mail),
                          ),
                          border:const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.white,width: 1)
                          )
                        ),
                      );
                    }
                  ),
                ),
                 Padding(
                  padding:const EdgeInsets.fromLTRB(10,0,10,20),
                  child: StreamBuilder(
                    stream: authBloc.passStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _passControler,
                        obscureText: true,
                        style:const TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffFF9E74), 
                        ),
                        decoration: InputDecoration(
                          errorText: snapshot.hasError ? '${snapshot.error}' : null,
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:const EdgeInsets.all(10),
                          labelText: "Password",
                          prefixIcon:const SizedBox(
                            width: 50,child: Icon(Icons.vpn_key),
                          ),
                          border:const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.white,width: 1)
                          )
                        ),
                      );
                    }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,20,20,60),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: FloatingActionButton(
                      backgroundColor: const Color(0xffFF715D),
                      onPressed: _onSignUpClicked,
                      child:const Text(
                        'Signup',
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ),
                ),

                RichText(
                  text:  TextSpan(
                    text: 'Already a user? ',
                    style: const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 16,
                      color: Color(0xff606470)
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap =() => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=> const LoginPage())
                            ),
                        text: ' Login now',
                        style:const TextStyle(
                          color: Color(0xff3277D8),
                          fontFamily: 'Times New Roman',
                          fontSize: 16,
                        )
                      ) 
                    ]
                  ),
                )
              ],
            ),
          ),
        ),

    );
  }
  _onSignUpClicked(){
    var isValid = authBloc.isValid(_nameControler.text, _emailControler.text, _passControler.text, _phoneControler.text);
    if (isValid){
      LoadingDialog.showLoadingDiglog(context, "Loading...");
      authBloc.signUp(_emailControler.text, _passControler.text, _phoneControler.text, _nameControler.text,(){
        LoadingDialog.hideLoadingDialog(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
      },(msg){
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog.showMsgDialog(context, 'Sign-In', msg);
      });
    }
  }
}