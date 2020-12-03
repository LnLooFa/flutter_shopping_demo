
import 'package:flutter/material.dart';
import 'package:shop_demo/config/service_method.dart';
import 'package:shop_demo/widget/swiperdiy_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getHomePageContext(),
        builder:(context,snapshot){
          // print("data============> ${snapshot.data.toString()}");
          if(snapshot.hasData){
            // var data=json.decode(snapshot.data.toString());

            List<Map> swiperDataList = (snapshot.data['data']['slide'] as List).cast(); // 顶部轮播组件数
            return Column(
              children: <Widget>[
                SwiperDiy(swiperDataList:swiperDataList)
              ],
            );
          }else{
            return Center(
              child: Text('加载中'),
            );
          }
        }
    );
  }
}
