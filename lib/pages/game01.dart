import 'package:flutter/material.dart';
import 'package:gbk2utf8/gbk2utf8.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:my_game_tools/pages/wzrytyf_gg.dart';
import 'package:my_game_tools/utils/datas.dart';
import 'package:my_game_tools/weight/dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class wzrytyf extends StatefulWidget {
  @override
  _wzrytyfState createState() => _wzrytyfState();
}

class _wzrytyfState extends State<wzrytyf> {
  var open_time_str = "查询中...";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getNewsData();
    find_time();
  }

  Future find_time() async {
    //王者荣耀体验服页面
    var url = 'https://pvp.qq.com/cp/a20161116tyf/page01.htm';
    try {
      http.Response response = await http.get(url);
      String data = gbk.decode(response.bodyBytes);

      setState(() {
        open_time_str = data.substring(
            data.indexOf("本期资格申请开放时间") + 16, data.indexOf("本期资格申请开放时间") + 35);
      });
    } catch (e) {
      setState(() {
        open_time_str = "网络异常，请检查";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("王者荣耀体验服"),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Card(
                  child: Hero(
                tag: "bar",
                child: Image.asset("images/slogan.png"),
              )),
              InkWell(
                child: ListTile(
                  title: Text(
                    "官方链接",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  leading: Icon(Icons.link),
                ),
                onTap: () {
                  _launchURL();
                },
              ),
              new Divider(),
              InkWell(
                child: ListTile(
                  title: Text(
                    "申请条件",
                    //style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  leading: Icon(Icons.help_outline),
                ),
                onTap: () {
                  String _str = """
1. 角色等级>=20级

2. 角色在申请当日的前1周内，至少有4天登录过游戏

3. 角色在申请当日的前1个月内，至少有15天登录过游戏

4. 角色注册时间超过2个月

5. 现网无恶意行为
""";

                  dialog_tip(context, _str);
                },
              ),
              InkWell(
                child: ListTile(
                  title: Text(
                    "资格申请、抢号与资格获得说明",
                    //style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  leading: Icon(Icons.help_outline),
                ),
                onTap: () {
                  String _str = """
1. 《王者荣耀体验服》资格申请将定期开放，开放时间会提前在官网及论坛等公告玩家，未开放期间无法申请资格；

2. 请大家先在【申请资格】提交申请，申请成功后，系统会分配势力阵营；

3. 前往抢号池参与抢号，抢号实行先到先得的原则。抢号成功即代表您已经获得体验服的资格；

4. 体验服的资格并非实时开通，工作人员将在抢号活动结束后的15个工作日内，集中为大家集中开通资格；

5. 资格开通后，将通过官网/体验服论坛专区等公告说明，同时会通过【手机短信】通知获得体验服资格的召唤师，请大家保持关注；

6. 号码池一共包含：盛世大唐，稷下学院，纷争三国，金帐汗国，楚汉之地5个阵营，每个阵营所开放的抢号数量并不一致，期望大家在体验服能为您的阵营赢得一席之地。
""";

                  dialog_tip(context, _str);
                },
              ),
              InkWell(
                child: ListTile(
                  title: Text("体验服公告"),
                  leading: Icon(Icons.list),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (b) {
                    return wzrytyf_gg();
                  }));

                  // dialog_tip(context, "暂未开放!");
                },
              ),
              new Divider(),
              InkWell(
                child: ListTile(
                  title: Text("本期资格申请开放时间：\n$open_time_str"),
                  leading: Icon(Icons.timer),
                ),
                onTap: () {
                  RegExp exp = new RegExp(r"(\D+)");
                  var open_tmp = open_time_str.replaceAll(exp, "");
                  //print(open_tmp);

                  var date_tmp = new DateTime.now()
                      .toString()
                      .replaceAll(exp, "")
                      .substring(0, 12);
                  //print(date_tmp);

                  var content_str = "";
                  if (int.parse(date_tmp) > int.parse(open_tmp)) {
                    content_str = "已经过了申请时间，请下次再来吧...";
                  } else {
                    content_str = "内测账号申请即将开始！";
                  }

                  dialog_tip(context, content_str);
                },
              ),
            ],
          )),
    );
  }

  _launchURL() async {
    const url = 'http://pvp.qq.com/cp/a20161115tyf/page1.shtml';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  getNewsData() async {
    Map map = await get_wzrytyfgg_data();
    listview_data.clear();

    map.forEach((k, v) {
      setState(() {
        listview_data.add(

            Padding(padding: EdgeInsets.all(10),
              child: InkWell(
              child: Card(
                child: Padding(padding: EdgeInsets.all(10),
                child: Text(k,style: TextStyle(
                  fontSize: 18
                ),),),
              ),
              onTap: () async {
                String link = "http://pvp.qq.com$v";

                if (await canLaunch(link)) {
                  await launch(link);
                } else {
                  throw 'Could not launch $link';
                }
              },
            ),)


        );
      });
    });
  }
}

List<Widget> listview_data = new List();
