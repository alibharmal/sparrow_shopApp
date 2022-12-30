
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sparrow_shop/Respository/Firebase_AuthRepository.dart';
import 'package:sparrow_shop/Screens/Registration.dart';

class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LoginState();

}
class _LoginState extends State<Login>{
    bool _isLoading = false;
    bool _isHidden = true;
    AuthService authService = AuthService();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("images/sparrowLogo.png"),
                        Text("Sparrow Shop",style: GoogleFonts.getFont("Italianno",fontSize: 32,color: Colors.black,fontWeight: FontWeight.w600,letterSpacing: 2),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            cursorColor: Theme.of(context).primaryColor,
                            controller:  _emailController,
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
                                  ?.copyWith(color: Colors.black),
                              floatingLabelStyle: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                  color: Colors.black,
                                  letterSpacing: 1),

                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          TextFormField(
                            cursorColor: Theme.of(context).primaryColor,
                            controller: _passwordController,
                            obscureText: !_isHidden,
                            obscuringCharacter: "*",
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: IconButton(icon:_isHidden?const Icon(Icons.visibility_off,color:Colors.black,):const Icon(Icons.visibility,color:Colors.black,), onPressed: () {
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
                                  ?.copyWith(color: Colors.black),
                              floatingLabelStyle: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                  color: Colors.black,
                                  letterSpacing: 1),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value){
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 60),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: () async {
                          if(!_isLoading){
                            _isLoading = true;
                         await authService.login(_emailController.text.trim(), _passwordController.text.trim(),context);
                        _isLoading = false;
                          }},
                        child:_isLoading?CircularProgressIndicator(color: Theme.of(context).primaryColor,strokeWidth: 3,): Text(
                          "Sign in",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(color: Colors.black),
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black)),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Registration()));
                    },
                    child: Text("Register", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black,fontWeight: FontWeight.w600),),)
                ],)
            ],
          ),
        ),
      );
  }


}