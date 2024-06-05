import 'package:appschedule/api_localhost/ApiSchedule.dart';
import 'package:http/http.dart' as http;


import 'package:http/http.dart' as http;

class NoteService {
  Future<List<ApiSchedule>?> getNotesList() async{
    Uri uri = Uri.parse('http://localhost:3000/Schedule');
    var client = http.Client();
    var responce = await client.get(uri);
    if(responce.statusCode ==200){
      var json = responce.body;
      return apiScheduleFromJson(json);
    }else{
      throw Exception("Failed");
    }
  }
  // Future<List<ApiStudent>?> addNotes(String nameS, String classS) async{
  //   final body ={
  //   "nodeName": nameS,
  //   "nodeClass": classS
  //   };
  //   Uri uri = Uri.parse('http://localhost:3000/Students');
  //   var deletenote = await http.put(uri);
  //   if(deletenote.statusCode ==200){
  //     return true;
  //   }else{
  //     throw Exception("Failed to delete ");
  //   }
  // }

  Future<bool> deleteNotes(String id) async{
    Uri uri = Uri.parse('http://localhost:3000/Students/$id');
    var deletenote = await http.delete(uri);
    if(deletenote.statusCode ==200){
      return true;
    }else{
      throw Exception("Failed to delete ");
    }
  }
}