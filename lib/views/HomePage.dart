
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restapi/services/remote_services.dart';
import '../models/post.dart';
import '../models/userModel.dart';
import '../services/remote_services_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>posts =[];
  UserModel user = UserModel();
  var isLoaded = false;
  @override
  void initState(){
    getDataAuth();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Center(
          child: Visibility(
            visible: isLoaded,
            child: ListView.builder(
                itemCount: 1,
                itemBuilder:(context,index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child:Text('Id:'+user.data!.first.id.toString()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child:Text('Name:'+user.data!.first.name.toString()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child:Text('Code:'+user.data!.first.code.toString()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child:Text('Email'+user.data!.first.domain.toString()),
                        ),
                      ),
                    ],
                  );
                },
            ),
            replacement: CircularProgressIndicator(),
          ),
        ),

    );
  }

  getData()async{
    posts = (await RemoteService().getPosts())!;
    if(posts!=null){
      setState(() {
        isLoaded = true;
      });

    }
  }
  getDataAuth()async{
    user = (await RemoteServiceAuth().getUsers());
    if(user!=null){
      setState(() {
        isLoaded = true;
      });

    }
  }
}
