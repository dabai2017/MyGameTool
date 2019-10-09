import 'package:flutter/material.dart';
import 'package:my_game_tools/pages/game01.dart';
import 'package:my_game_tools/utils/datas.dart';
import 'package:my_game_tools/weight/dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class wzrytyf_gg extends StatefulWidget {
  @override
  _wzrytyf_ggState createState() => _wzrytyf_ggState();
}

class _wzrytyf_ggState extends State<wzrytyf_gg> {

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("体验服公告"),
      ),
      body: ListView(
        children: listview_data,
      ),
    );
  }
}
