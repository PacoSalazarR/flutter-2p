import 'package:examen_2p/widgets/button_widget.dart';
import 'package:examen_2p/widgets/textfield_widget.dart';
import 'package:examen_2p/pages/MainPage.dart';
import 'package:examen_2p/utilerias/global.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:animate_do/animate_do.dart';

class LoginPage extends StatelessWidget{
  
  LoginPage({Key? key}): super(key: key);

  final TextEditingController _controllerTxtUser = TextEditingController();
  final TextEditingController _controllerTxtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
         decoration: BoxDecoration(
          image: DecorationImage(
          image: NetworkImage("https://www.notebookcheck.org/fileadmin/Notebooks/News/_nc3/maxresdefault47.jpg"),
          fit: BoxFit.cover,
         ),
       ),
    ),
  backgroundColor: Colors.transparent,
        title: const Text('Hyrule Compendium App'),
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: FadeInUp(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to the Hyrule Compendium app!",
                      style: TextStyle(height: 1, fontSize: 20, color: Global.basicFont)),
                    customTextField('User', 'n/a', _controllerTxtUser, Icons.supervised_user_circle, false),
                    customTextField('Password', 'n/a', _controllerTxtPassword, Icons.lock, true),
                    FadeInUp(
                      child: ButtonWidget(
                        title: 'Log In',
                        width: 200,
                        height: 40.0,
                        otherColor: true,
                        colorButton: Global.accentColor,
                        hasColor: false,
                        onPressed: (){
                          if(_controllerTxtUser.text.isNotEmpty && _controllerTxtPassword.text.isNotEmpty){
                            if (_controllerTxtUser.text == "paco" && _controllerTxtPassword.text == "12345") {
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => const MainPage()));
                            }else{
                              showSimpleNotification(
                              Text("Credentials don't match!"),
                              background: Global.alertColor,
                              );
                            }
                          }else{
                            showSimpleNotification(
                            Text("You must fill al the fields!"),
                             background: Global.alertColor,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  Widget customTextField(
      String hint, String ontap, TextEditingController _controller, IconData icon, bool isObscureText) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFieldWidget(
        isPrefixIcon: true,
        prefixIconData: icon,
        isSuffixIcon: false,
        color: Global.basicFont,
        suffixIconData: Icons.lock,
        isMyControllerActivated: true,
        obscureText: isObscureText,
        controller: _controller,
        onSuffixIconTap: () {
          print(ontap);
        },
        hintText: hint,
        onChanged: (String value) {
          print(value);
        },
      ),
    );
  }
}