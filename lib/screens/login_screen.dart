import 'package:bored/model/app_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final String? username;

  const LoginScreen({Key? key, required this.username}) : super(key: key);
  final Color color = const Color.fromRGBO(64, 143, 77, 1);
  final TextStyle focusText = const TextStyle(color: Colors.green);
  final TextStyle unFocus = const TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(top: 44.0),
            children: [
              const SizedBox(
                height: 200,
                child: Image(
                  image: AssetImage("assets/food/rw_logo.png"),
                ),
              ),
              const SizedBox(height: 16),
              buildTextfield(username ?? '🍔 username'),
              const SizedBox(height: 16),
              buildTextfield('🎹 password'),
              const SizedBox(height: 16),
              buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextfield(String s) {
    return TextField(
      cursorColor: color,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 1.0),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.green,
          )),
          hintText: s,
          hintStyle: const TextStyle(height: 0.5)),
    );
  }

Widget  buildButton(BuildContext context) {
    return SizedBox(
      height: 55.0,
      child: MaterialButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: ()async{
          Provider.of<AppStateManager>(context,listen: false).login("mockUsername","mockUsername");
        },
      ),
    );
}
}
