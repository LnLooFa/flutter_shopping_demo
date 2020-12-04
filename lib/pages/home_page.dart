
import 'package:flutter/material.dart';
import 'package:shop_demo/config/service_method.dart';
import 'package:shop_demo/widget/item_gridview_widget.dart';
import 'package:shop_demo/widget/marquee_widget.dart';
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
        future: getHomeData(),
        builder:(context,snapshot){
          if(snapshot.hasData){
            List<Map> swiperDataList = (snapshot.data[0]['data']['slide'] as List).cast(); // 顶部轮播组件数
            List<Map> itemGrid = (snapshot.data[1]['data'] as List).cast(); // 顶部轮播组件数
            return Column(
              children: <Widget>[
                SwiperDiy(swiperDataList:swiperDataList),
                ItemGridView(gridViewList:itemGrid),
                Container(
                  color: Colors.red,
                  height: 30,
                  child: new MarqueeView(
                    text: "ListView即滚动列表控件，能将子控件组成可滚动的列表。当你需要排列的子控件超出容器大小",
                    textStyle: new TextStyle(fontSize: 16.0),
                    scrollAxis: Axis.horizontal,
                  ),
                )
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
