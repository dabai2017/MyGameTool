import 'package:gbk2utf8/gbk2utf8.dart';
import 'dart:convert' as convert;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;

//王者荣耀体验服 公告、新闻。。。
String wzrytyfgg_link = "http://pvp.qq.com/cp/a20161115tyf/news.shtml";
//积分体验榜单 网页
String wzrytyfjf = "http://pvp.qq.com/cp/a20161115tyf/page2.shtml";


//返回一个map组
Future get_wzrytyfgg_data() async {
  var response = await http.get(wzrytyfgg_link);

  Document doc = parse(response.body);
  List<Element> data_root = doc.body.getElementsByTagName("ul");

  Map wzrytyfgg_data = new Map();

    List<Element> list = data_root[2].children;
    for (int j = 0; j < list.length; j++) {

        String title = gbk.decode(
            list[j].getElementsByTagName("a")[0].attributes["title"].codeUnits);
        String url = list[j].getElementsByTagName("a")[0].attributes["href"];

        wzrytyfgg_data.addAll({title: url});
    }

  return wzrytyfgg_data;
}
