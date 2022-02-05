import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:patterns_mobx/pages/create_page.dart';
import 'package:patterns_mobx/stores/home_store.dart';
import 'package:patterns_mobx/views/item_of_post.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore store = HomeStore();

  @override
  void initState() {
    super.initState();
    store.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) => Stack(
          children: [
            ListView.builder(
              itemCount: store.items.length,
              padding: EdgeInsets.only(top: 5),
              itemBuilder: (ctx, index) {
                return itemOfPosts(store, context, store.items[index]);
              },
            ),

            store.isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, CreatePage.id);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}