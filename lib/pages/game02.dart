import 'package:flutter/material.dart';
import 'package:my_game_tools/utils/datas.dart';

class wzry extends StatefulWidget {
  @override
  _wzryState createState() => _wzryState();
}

class _wzryState extends State<wzry> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("王者荣耀"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child: Card(
          child: Hero(tag: "bar", child: Image.network(
              "http://game.gtimg.cn/images/yxzj/cp/a20161115tyf/slogan.png"),
          )
        ),
      ),
    );
  }
}
