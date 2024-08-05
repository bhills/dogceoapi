import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String dog;
  const Details({Key? key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details'), backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center( child: Column(
        children: <Widget>[
           Text(dog,
            style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 40.0, fontFamily:'RaleWay', ),),
              ElevatedButton(onPressed: ()=>goBack(context), child: Text('Main Menu')),
            // child: Text(dog))
        ]
      ),//child:
     // ElevatedButton(onPressed: ()=>goBack(context),
     // child: Text(dog))
      ),


    );
  }

  goBack(context) {
    Navigator.pop(context);
  }
}