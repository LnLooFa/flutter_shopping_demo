import 'package:flutter/material.dart';

class ItemGridView extends StatelessWidget {

  final List gridViewList;

  const ItemGridView({Key key, this.gridViewList}) : super(key: key);

  Widget _homeTopGridView(BuildContext context,item){
    return InkWell(
      onTap: (){
        print("点击事件");
      },
      child: Column(
        children: <Widget>[
          Image.network(item["h5_icon"],width: 50,),
          Text(
            item["title"],
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.left, // 对齐方式
            style: TextStyle(
                fontSize: 14
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:180,
      child: GridView.count(
        crossAxisCount: 5,
        children: gridViewList.map((item){
          return _homeTopGridView(context,item);
        }).toList(),
      ),
    );
  }
}
