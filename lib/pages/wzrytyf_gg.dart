import 'package:flutter/material.dart';
import 'package:my_game_tools/utils/datas.dart';
import 'package:my_game_tools/weight/dialog.dart';


class wzrytyf_gg extends StatefulWidget {
  @override
  _wzrytyf_ggState createState() => _wzrytyf_ggState();
}

class _wzrytyf_ggState extends State<wzrytyf_gg> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //初始化一下datas 的网页数据
    get_wzrytyfgg_data();


    //然后做解析，把 三项 功能的列表 批量获取设置到view

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("公告新闻"),
      ),
      body: ListView(
        children: <Widget>[

        ],
      )
      ,
    );
  }
}
