import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwdController = TextEditingController();

  ValueNotifier<bool> _passwdShower = ValueNotifier<bool>(false);

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwdFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwdController.dispose();
    _emailFocusNode.dispose();
    _passwdFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final authProvider = Provider.of<AuthViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backwardsCompatibility: false,
          title: Text("Login Now !"),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: _emailFocusNode,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined)),
                onFieldSubmitted: (value) {
                  Utils.onFormFieldChange(
                      context, _emailFocusNode, _passwdFocusNode);
                },
              ),
              ValueListenableBuilder(
                valueListenable: _passwdShower,
                builder: (context, value, child) {
                  return TextFormField(
                    focusNode: _passwdFocusNode,
                    controller: _passwdController,
                    obscureText: _passwdShower.value,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock_open_outlined),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _passwdShower.value = !_passwdShower.value;
                            },
                            icon: _passwdShower.value
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off))),
                  );
                },
              ),
              SizedBox(
                height: height * .1,
              ),
              RoundButton(
                  title: 'Login',
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.showFlushbarErrorMsg(
                          'Please provide your email first...', context);
                    } else if (_passwdController.text.isEmpty) {
                      Utils.showFlushbarErrorMsg(
                          'Please enter your password first...', context);
                    } else if (_passwdController.text.length <= 5) {
                      Utils.showFlushbarErrorMsg(
                          'Password should contain atleast 6 characters...',
                          context);
                    } else {
                      Map data = {
                        "email": _emailController.text,
                        "password": _passwdController.text
                      };
                      authProvider.loginApi(context, data);
                    }
                  })
            ],
          ),
        ));
  }
}
