import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:patterns_mobx/stores/update_store.dart';

class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  String title, body;
  UpdatePage({this.title, this.body, Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateStore store = UpdateStore();

  @override
  void initState() {
    super.initState();

    store.titleTextEditingController.text = widget.title;
    store.bodyTextEditingController.text = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new post'),
      ),
      body: Observer(
        builder: (_) => Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          style: TextStyle(fontSize: 20),
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
                      onPressed: (){ store.apiPostUpdate(context);},
                      color: Colors.blue,
                      height: 45,
                      minWidth: double.infinity,
                      child: Text("Update"),
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
