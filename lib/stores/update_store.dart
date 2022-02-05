import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:patterns_mobx/model/post_model.dart';
import 'package:patterns_mobx/pages/home_page.dart';
import 'package:patterns_mobx/services/http_service.dart';

part 'update_store.g.dart';

class UpdateStore = _UpdateStore with _$UpdateStore;

abstract class _UpdateStore with Store {
  @observable bool isLoading = false;
  @observable TextEditingController titleTextEditingController = TextEditingController();
  @observable TextEditingController bodyTextEditingController = TextEditingController();

  Future apiPostUpdate(BuildContext context) async {
    isLoading = true;

    Post post = Post(id: Random().nextInt(pow(2, 30) - 1),title: titleTextEditingController.text, body: bodyTextEditingController.text, userId: Random().nextInt(pow(2, 30) - 1));

    var response = await Network.PUT(Network.API_UPDATE + '1', Network.paramsUpdate(post));

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    }

    isLoading = false;
    print(response);
  }
}