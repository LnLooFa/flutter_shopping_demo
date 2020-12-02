
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_demo/pages/classify_page.dart';
import 'package:shop_demo/pages/home_page.dart';
import 'package:shop_demo/pages/member_page.dart';
import 'package:shop_demo/pages/shopping_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> boottomTabs=[
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: "首页",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      label: "分类",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      label: "购物车",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      label: "会员中心",
    ),
  ];

  final List tabBodies =[
    HomePage(),
    ClassifyPage(),
    ShoppingPage(),
    MemberPage()
  ];

  int currentIndex=0;
  var currentPage;

  @override
  void initState() {
    currentPage=tabBodies[currentIndex];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items:boottomTabs,
        onTap: (index){
          setState(() {
            currentIndex=index;
            currentPage=tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}

