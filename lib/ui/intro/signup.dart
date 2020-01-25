import 'package:flutter/material.dart';
import 'package:food_app/localization.dart';
import 'package:food_app/services/auth.dart';
import 'package:food_app/widgets/progress_bar.dart';

class SignUpScreen extends StatefulWidget {
  static final String id = 'signup_page';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Services
  bool isLoading = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Form
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _username = '';

  // Submit lofin form
  _submit() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      _formKey.currentState.save();
      await AuthService.signUpUser(
          context, _email, _username, _password, _scaffoldKey);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: isLoading ? ProgressBar() : null,
        key: _scaffoldKey,
        body: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).translate('signup_title'),
                  style: TextStyle(
                    color: Color(0xFF282828),
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0x11000000),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 28),
                  child: TextFormField(
                    validator: (value) => value == ''
                        ? AppLocalizations.of(context)
                            .translate('signup_email_error')
                        : null,
                    onSaved: (value) => setState(() => _email = value),
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context).translate('email'),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0x11000000),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 28),
                  child: TextFormField(
                    validator: (value) => value == ''
                        ? AppLocalizations.of(context)
                            .translate('login_username_error')
                        : null,
                    onSaved: (value) => setState(() => _username = value),
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context).translate('username'),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0x11000000),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 28),
                  child: TextFormField(
                    validator: (value) => value.length < 6
                        ? AppLocalizations.of(context)
                            .translate('signup_password_error')
                        : null,
                    onSaved: (value) => setState(() => _password = value),
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context).translate('password'),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  height: 55,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Material(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        splashColor: Colors.white10,
                        onTap: _submit,
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('signup_title'),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  height: 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => print('go to forgot password page'),
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('forgot_password'),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacementNamed(
                          context,
                          'login_page',
                        ),
                        child: Text(
                          AppLocalizations.of(context).translate('signup_link'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
