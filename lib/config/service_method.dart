import "package:dio/dio.dart";
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

Future getHomeData() async{
  return Future.wait([getHomePageContext(), getHomeGridView()]);
}

Future getHomePageContext() async{
  try{
    print("开始请求首页数据");
    Response response;
    Dio dio=new Dio();
    response = await dio.get(servicePath["homePageContext"]);
    print(response);
    if(response.statusCode==200){ //成功
      return response.data;
    }else{
      throw Exception("后端接口异常//////");
    }
  }catch(e){
    return print(e);
  }
}


Future getHomeGridView() async{
  try{
    print("开始请求GridView");
    Response response;
    Dio dio=new Dio();
    response = await dio.get(servicePath["homeGridView"]);
    print(response);
    if(response.statusCode==200){ //成功
      return response.data;
    }else{
      throw Exception("后端接口异常//////");
    }
  }catch(e){
    return print(e);
  }
}

