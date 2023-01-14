import 'package:flutter/material.dart';
import 'package:ui_design_class/login_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> data =['Monday','Tuesday','Wednesday','Thursday','Friday'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Text('Welcome ${widget.username}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
          ),
            Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 3,
                              blurRadius: 3
                          )
                        ]
                      ),
                      child:  ListTile(
                        leading: Icon(Icons.calendar_today,color: Colors.orange,),
                        title: Text(data[index], style: TextStyle(color: Colors.black,),),
                        subtitle:Text(data[index], style: TextStyle(color: Colors.blue,),),
                        trailing: IconButton(icon: Icon(Icons.delete),color: Colors.red, onPressed: () {  },),
                      ),
                    );

                  },
                ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                },
                child: const Text('Log out'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
