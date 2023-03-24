import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/googleSignInprovider.dart';
import '../../../../../provider/loginAndSignProvider.dart';
import '../../../../../utils/images.dart';
import '../../../../bottomNavigationBarScreen.dart';
import '../../../../utils/helper_functions.dart';
import '../animations/change_screen_animation.dart';
import 'bottom_text.dart';
import 'top_text.dart';

enum Screens {
  createAccount,
  welcomeBack,
}

class LoginContent extends StatefulWidget {
  const LoginContent({Key key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent>
    with TickerProviderStateMixin {
    List<Widget> createAccountContent;
    List<Widget> loginContent;

    TextEditingController name=TextEditingController();
    TextEditingController email=TextEditingController();
    TextEditingController pasword=TextEditingController();
    TextEditingController confrimPassword=TextEditingController();
    TextEditingController mobile=TextEditingController();
    bool hidepassword=true;
    bool hideconfrimpassword=true;


  Widget inputField(String hint, IconData iconData,TextEditingController _controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextField(
            keyboardType: hint=="Mobile Number"?TextInputType.number:TextInputType.text,
            obscureText: hint=="Password" || hint=="Confirm Password"?(
            hint=="Password"?hidepassword:hideconfrimpassword
            ):false,
            controller: _controller,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(iconData),
              suffixIcon: hint=="Password" || hint=="Confirm Password"?InkWell(
                onTap: ()
                  {
                    setState(() {
                      print('akjsndkjsa');
                      print('${hidepassword}');
                      hint=="Password"?hidepassword= !hidepassword:hideconfrimpassword=!hideconfrimpassword;
                    });
                  },
                  child: hint=="Password"?( hidepassword? Icon(Icons.visibility_off):Icon(Icons.visibility)):
                  ( hideconfrimpassword? Icon(Icons.visibility_off):Icon(Icons.visibility))
              ):null
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(String title) {
    return Consumer<LoginAndSignInProvider>(
      builder: (context,loginData,Widget child) {
        return loginData.loader?Center(child: CircularProgressIndicator(
          color:Colors.redAccent ,
        )):Padding(
          padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
          child:
          ElevatedButton(
            onPressed: ()  {
              if(title.toString()=="Log In"){
                // Get.to(() => BottomNavigationBarScreen(), routeName: 'home');
                if(email.text.isNotEmpty && pasword.text.isNotEmpty)
                  {
                    final bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email.text);
                    if(emailValid && pasword.text.length>=8)
                      {
                        loginData.loginMethod(email.text,pasword.text);
                      }
                    else
                      {
                        if(emailValid)
                          {
                            Fluttertoast.showToast(msg: "The password must be at least 8 characters.");

                          }
                        else{
                          Fluttertoast.showToast(msg: "The email must be a valid email address");
                        }

                      }
                  }
              }
              else
                {
                  print('akjsndkj');
                  print('${name.text.isNotEmpty && email.text.isNotEmpty && pasword.text.isNotEmpty && confrimPassword.text.isNotEmpty}');
                if(name.text.isNotEmpty && email.text.isNotEmpty && pasword.text.isNotEmpty && confrimPassword.text.isNotEmpty)
                    {
                      final bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email.text);
                      if(emailValid)
                        {

                          _loginprovider.register(name.text, mobile.text, pasword.text, email.text);
                        }
                      else
                        {
                          Fluttertoast.showToast(msg: "The email must be a valid email address");
                        }
                    }
                  else
                    {
                      Fluttertoast.showToast(
                          msg: "All Credentials Required",
                       );
                    }
                }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: const StadiumBorder(),
              primary: Colors.redAccent,
              elevation: 8,
              shadowColor: Colors.black87,
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
    );
  }

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: Colors.redAccent,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'or',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget logos() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Images.facebook,),
          const SizedBox(width: 24),
          InkWell(
            onTap: ()
            {
              final provide=Provider.of<GoogleSignInProvider>(context,listen: false);
              provide.googleLogin();

            },
            child: Image.asset(
              Images.google
            ),
          ),
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

    LoginAndSignInProvider _loginprovider ;
  @override
  void initState() {
    createAccountContent = [
      inputField('Name', Ionicons.person_outline,name),
      inputField('Email', Ionicons.mail_outline,email),
      inputField('Mobile Number', Icons.phone,mobile),
      inputField('Password', Ionicons.lock_closed_outline,pasword),
      inputField('Confirm Password', Ionicons.lock_closed_outline,confrimPassword),
      loginButton('Sign Up'),
      orDivider(),
      logos(),
    ];

    loginContent = [
      inputField('Email', Ionicons.mail_outline,email),
      inputField('Password', Ionicons.lock_closed_outline,pasword),
      loginButton('Log In'),
      forgotPassword(),
    ];

  //  _loginprovider=Provider.of<LoginAndSignInProvider>(context,listen: false);
    ChangeScreenAnimation.initialize(
      vsync: this,
      createAccountItems: createAccountContent.length,
      loginItems: loginContent.length,
    );

    for (var i = 0; i < createAccountContent.length; i++) {
      createAccountContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.createAccountAnimations[i],
        child: createAccountContent[i],
      );
    }

    for (var i = 0; i < loginContent.length; i++) {
      loginContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.loginAnimations[i],
        child: loginContent[i],
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    ChangeScreenAnimation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _loginprovider=Provider.of<LoginAndSignInProvider>(context,listen: false);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopText(),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: createAccountContent,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: loginContent,
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: BottomText(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
