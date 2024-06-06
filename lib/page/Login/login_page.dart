import 'package:appschedule/blocs/auth_bloc.dart';
import 'package:appschedule/page/Home/home_page.dart';
import 'package:appschedule/page/Login/dialog/loading_dialog.dart';
import 'package:appschedule/page/Login/dialog/msg_dialog.dart';
import 'package:appschedule/page/Login/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthBloc authBloc = AuthBloc();
  final TextEditingController _emailControler =  TextEditingController();
  final TextEditingController _passControler =  TextEditingController();
  @override
  void dispose(){
    authBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    return  Scaffold( 
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: const BoxConstraints.expand(),
          color: const Color(0xffFBEEE4),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 140,),
                const Image(
                  width: 200,
                  image: AssetImage('assets/images/schedule/lich.png'),
                ),
                const Text(
                  'Welcome Schedule!',
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFF9E74),
                  ),
                ),
                const Text(
                  'Login to continue using Schedule!',
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Color(0xffFF9E74),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(10,145,10,20),
                  child: TextField(
                    controller: _emailControler,
                    style:const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Color(0xffFF9E74), 
                    ),
                    decoration:const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Email",
                      prefixIcon: SizedBox(
                        width: 50,child: Icon(Icons.mail),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.white,width: 1)
                      )
                    ),
                  ),
                ),
                 Padding(
                  padding:const EdgeInsets.only(left:10.0,right: 10),
                  child: TextField(
                    controller: _passControler,
                    obscureText: true,
                    style:const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Color(0xffFF9E74), 
                    ),
                    decoration:const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Password",
                      prefixIcon: SizedBox(
                        width: 50,child: Icon(Icons.vpn_key),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.white,width: 1)
                      )
                    ),
                  ),
                ),

                Container(
                  constraints: BoxConstraints.loose(const Size(double.infinity,40)),
                  alignment: AlignmentDirectional.centerEnd,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0,10,10,0),
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                 Padding(
                  padding:const EdgeInsets.fromLTRB(10,10,10,60),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: FloatingActionButton(
                      backgroundColor:const Color(0xffFF9E74),
                      onPressed: _onSignINClicked,
                      child:const Text(
                        'Login',
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
                    text: 'New user? ',
                    style: const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 16,
                      color: Color(0xff606470)
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap =() => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=> const RegisterPage())
                            ),
                        text: ' Sign up for a new account',
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
  void _onSignINClicked(){
  String email = _emailControler.text;
  String pass = _passControler.text;
  LoadingDialog.showLoadingDiglog(context, "Loading... ");
  authBloc.signIn(email, pass, (){
    LoadingDialog.hideLoadingDialog(context);
    //Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    context.go('/homepage');
  }, (msg) {
    LoadingDialog.hideLoadingDialog(context);
    MsgDialog.showMsgDialog(context, "Sign-In", msg);
  });
}


}

