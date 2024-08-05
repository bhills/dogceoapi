import 'package:http/http.dart' as http;
import 'dart:convert';




class GetDogService{

  late  List<String> dogList =[];
  Future<List<String>> getDog() async{
    final response = await http.get(Uri.parse("https://dog.ceo/api/breeds/list/all"));
    if(response.statusCode== 200)
    {
      final data = jsonDecode(response.body);

      for( var i = 0; i < data.length; i++)
        {
           dogList.add(data.values.toString() );


        }


      List<String>newList = dogList[0].split(",");

      return newList;
    }else{
      throw Exception(('Http not found'));
    }



  }

}
