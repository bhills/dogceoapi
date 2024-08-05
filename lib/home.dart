import 'package:dogceoapi/DogService.dart';
import 'package:dogceoapi/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'details.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}
  class _HomePageState extends State<HomePage>{
    late Future<List<String>> dogBreeds;

    @override
      void initState() {
      super.initState();
      dogBreeds =  GetDogService().getDog();
    }

    @override
    Widget build(BuildContext context) {

      return Scaffold(
          appBar: AppBar(title: const Text('Dog Breed'), backgroundColor: Colors.blue,),
          body: Center(
            child: FutureBuilder<List<String>> (future: dogBreeds,
              builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                if(snapshot.hasData){
                  return ListView.separated(
                      itemBuilder: (context, index){
                        String? dog = snapshot.data?[index];
                        return ListTile(
                          title: Text(dog!),
                          subtitle: Text('Dog Breed'),
                          trailing: const Icon(Icons.chevron_right_outlined),
                        onTap: (()=>{openPage(context,dog.toString())}),);
                      },
                      separatorBuilder: (context, index){
                        return const Divider(color: Colors.black26);
                      },
                      itemCount: snapshot.data!.length);
                }
                else if (snapshot.hasError){
                  return Text('Error${snapshot.error}');

                }
                return const CircularProgressIndicator();
              },)
          ));}
    openPage(context, String dog){
      Navigator.push(context,MaterialPageRoute(builder: (context) => Details( dog: dog  )));
    }

  }


