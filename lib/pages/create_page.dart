import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:patterns_mobx/stores/create_store.dart';

class CreatePage extends StatefulWidget {
  static final String id = 'create_page';

  const CreatePage({Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateStore store = CreateStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create post'),
      ),
      body: Observer(
        builder: (_) => Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Title
                    Container(
                      height: 70,
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: Center(
                        child: TextField(
                          controller: store.titleTextEditingController,
                          style: TextStyle(fontSize:20),
                          decoration: InputDecoration(
                            labelText: 'Title',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    // content
                    Container(
                      height: 300,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: TextField(
                        controller: store.bodyTextEditingController,
                        style: TextStyle(fontSize: 18),
                        maxLines: 80,
                        decoration: InputDecoration(
                          labelText: 'content',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    FlatButton(
                      onPressed: (){ store.apiPostCreate(context);},
                      height: 45,
                      minWidth: double.infinity,
                      color: Colors.blue,
                      child: Text("Create",style: TextStyle(color: Colors.white,fontSize: 20),),
                    ),
                  ],
                ),
              ),
            ),
            store.isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
