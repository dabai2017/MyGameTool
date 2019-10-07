import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_game_tools/pages/game01.dart';
import 'package:my_game_tools/pages/game02.dart';
import 'package:my_game_tools/utils/Adapt.dart';
import 'package:my_game_tools/weight/dialog.dart';
import 'package:package_info/package_info.dart';

var appName = "";
var packageName = "";
var version = "";
var buildNumber ="";

void main(){
  runApp(MyApp());

  PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    appName = packageInfo.appName;
     packageName = packageInfo.packageName;
     version = packageInfo.version;
     buildNumber = packageInfo.buildNumber;
  });

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //本地化
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale('zh', 'zh-CN'), // 中国
          // ... other locales the app supports
        ],
        title: '$appName',
        theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            //展开高度
            expandedHeight: 200.0,
            //是否随着滑动隐藏标题
            floating: false,
            //是否固定在顶部
            pinned: true,
            //可折叠的应用栏
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title:Text(
                  '$appName',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Hero(
                  tag: "bar",
                  child: Image.network(
                    'https://i.loli.net/2019/10/07/SdQqMPAZa36r8Ls.jpg',
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ];
      },
      body: Padding(
        child: Container(
          child: Card(
              child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Text("游戏列表"),
              ),
              InkWell(
                child: ListTile(
                  title: Text("王者荣耀体验服"),
                  leading: Icon(Icons.videogame_asset),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (b) {
                    return wzrytyf();
                  }));
                },
              ),
              InkWell(
                child: ListTile(
                  title: Text("王者荣耀"),
                  leading: Icon(Icons.videogame_asset),
                ),
                onTap: () {
                  /*
                        Navigator.of(context).push(
                          new MaterialPageRoute(builder: (b){
                            return wzry();
                          })
                        );
                        */

                  dialog_tip(context, "暂未开放!");
                },
              ),

              new Divider(),


              Padding(
                padding: EdgeInsets.all(20),
                child: Text("其他"),
              ),
              InkWell(
                child: ListTile(
                  title: Text("关于"),
                  leading: Icon(Icons.phone_android),
                ),
                onTap: () {



                  showAboutDialog(context: context,
                      applicationName: appName,
                      applicationVersion: "$version + $buildNumber",
                      children: <Widget>[
                        Text("$appName 是一款帮助自己更好的观察游戏动态和活动的工具"),
                      ]
                  );

                },
              ),

            ],
          )),
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
