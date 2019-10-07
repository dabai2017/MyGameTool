import 'package:gbk2utf8/gbk2utf8.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


//王者荣耀体验服 公告、新闻。。。
String wzrytyfgg_link = "http://pvp.qq.com/cp/a20161115tyf/news.shtml";

String wzrytyfgg_data = "";

Future get_wzrytyfgg_data() async {
  
  try {
    http.Response response = await http.get(wzrytyfgg_link);
    wzrytyfgg_data = gbk.decode(response.bodyBytes);
  } catch (e) {
      wzrytyfgg_data = "网络异常，请检查";
  }
return wzrytyfgg_data;
}


