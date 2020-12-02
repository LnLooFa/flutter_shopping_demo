import "package:dio/dio.dart";
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';


Future getHomePageContext() async{
  try{
    print("开始请求首页数据");
    Response response;
    Dio dio=new Dio();
    dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded") as String;
    var formData={'lon':'115.02932','lat':'35.76189'};
    response = await dio.post(servicePath["homePageContext"],data: formData);
    if(response.statusCode==200){ //成功
      return response.data;
    }else{
      throw Exception("后端接口异常//////");
    }
  }catch(e){
    return print(e);
  }
}