
import '../models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService{
  Future<List<Post>?>getPosts()async{
  var client = http.Client();
  //var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  var uri = Uri.parse('https://gateway.cronlink.ca/api/v1/authentication/companies-listing');
  var response = await client.get(uri);
  if(response.statusCode==200){
    var json =response.body;
    return postFromJson(json);
  }
  }
}