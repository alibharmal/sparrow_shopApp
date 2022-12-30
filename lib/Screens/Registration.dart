
import 'package:flutter/material.dart';
import 'package:sparrow_shop/Models/User.dart';
import 'package:sparrow_shop/Respository/Firebase_AuthRepository.dart';

class Registration extends StatefulWidget{
  const Registration({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegistrationState();

}
class _RegistrationState extends State<Registration>{
  bool _isHidden = true;
  AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        leading: IconButton(icon:  Icon(Icons.arrow_back_ios_new,color: Theme.of(context).primaryColor,),iconSize: 22, onPressed: () {
          Navigator.pop(context);
        },),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child:  Text(
                "Create Account",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      style:  Theme.of(context).textTheme.bodyText2
                          ?.copyWith(color: Theme.of(context).primaryColor),
                      controller: _emailController,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        labelText: "Email",
                        isDense: true,
                        filled: true,
                        fillColor:Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 14),
                        labelStyle: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(color: Theme.of(context).primaryColor),
                        floatingLabelStyle: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(
                            color: Theme.of(context).primaryColor,
                            letterSpacing: 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide:  BorderSide(
                              color: Theme.of(context).primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:  BorderSide(
                              color: Theme.of(context).primaryColor, width: 1.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      style:  Theme.of(context).textTheme.bodyText2?.copyWith(color: Theme.of(context).primaryColor),
                      controller: _passwordController,
                      obscureText: !_isHidden,
                      obscuringCharacter: "*",
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(icon:_isHidden? Icon(Icons.visibility_off,color:Theme.of(context).primaryColor,): Icon(Icons.visibility,color:Theme.of(context).primaryColor,), onPressed: () {
                          setState(() {
                            _isHidden = !_isHidden;
                          });
                        },),
                        isDense: true,
                        filled: true,
                       fillColor:Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 14),

                        labelStyle: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(color: Theme.of(context).primaryColor),
                        floatingLabelStyle: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(
                            color: Theme.of(context).primaryColor,
                            letterSpacing: 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide:  BorderSide(
                              color: Theme.of(context).primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:  BorderSide(
                              color: Theme.of(context).primaryColor, width: 1.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 60),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: () async {
                  AppUser _user = AppUser();
                  _user.email =_emailController.text.trim();
                  _user.password =_passwordController.text.trim();
                  (await authService.register(_user,context))? Navigator.pop(context):null;
                },
                child: Text(
                  "Sign up",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Theme.of(context).primaryColor),
                )),
          ],
        ),
      ),
    );
  }


}