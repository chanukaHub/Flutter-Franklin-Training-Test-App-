import 'package:flutter/material.dart';
import 'package:ui_design_class/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        leading: const Icon(
          Icons.account_balance,
          color: Colors.orange,
        ),
      ),
      body: Container(
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Center(
                    child: Text('Login' , style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  )
              ),
              Container(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                width: 300,
                height: 200,
                child: Image.asset('assets/trash_truck.png'),
              ),
              Container(
                padding:  const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      padding:  const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        // onChanged: (value){
                        //   print(value);
                        // },
                        controller: _usernameController,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter your Username',
                            hintText:'Username'
                        ),
                      ),
                    ),
                    Container(
                      padding:  const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter your Password',
                            hintText:'Password'
                        ),
                      ),
                    ),
                    Container(
                      padding:  const EdgeInsets.symmetric(vertical: 30),
                      width: 200,
                      child: ElevatedButton(
                        onPressed:loginButtonClick,
                        child: const Text('Login',style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )

          ),
    );
  }

  void loginButtonClick(){
    if(_usernameController.text == 'user123' && _passwordController.text == '12345'){
      print('Login success');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
    }else{
      print('Login Fail');
      showAlertDialog(context);
    }
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('OK'));
    AlertDialog alertDialog = AlertDialog(
      title: Text('Error'),
      content: Text('Wrong username and password'),
      actions: [okButton],
    );

    showDialog(context: context, builder: (BuildContext context) {
      return alertDialog;
    });
  }
}
