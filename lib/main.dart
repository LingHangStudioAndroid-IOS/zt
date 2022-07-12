import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math; 
import 'package:dio/dio.dart';
// import 'package:english_words/english_words.dart';
// import 'package:flutter/rendering.dart';



void main(List<String> args) {
  runApp(MyApp());
}



class Action1 extends StatelessWidget {
  const Action1({ Key? key,required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Second"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        color: Colors.blue.shade50,
        padding: EdgeInsets.symmetric(horizontal: 450),
        child: Row(
          children: [
            Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
          ],
        ),
      )
    );
    
  }
}
//child: Text(text,style: TextStyle(fontWeight: FontWeight.bold),),

class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({
    Key? key,
    this.keepAlive = true,
    required this.child,
  }) : super(key: key);
  final bool keepAlive;
  final Widget child;

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if(oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}


class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

late TabController _tabController;
List tabs=["最新","最热","学校"];
List str1=["新闻1","新闻2","新闻3","新闻4"];
List str2=["新闻详细内容1","新闻详细内容2","新闻详细内容3","新闻详细内容4"];
List ch1=["2022-6-11要问","2022-5-1媒体","2022-4-23学术","2022-3-12要问"];
List ch2=["热度566","热度711","热度435","热度788"];
List imgs=["images/king.png","images/girl.png","images/king.png","images/girl.png"];
List action=["Action1","Action2","Action3","Action4"];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync:this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("武科大助手校园"),
        
        bottom: TabBar(
          controller: _tabController,
          tabs:
            tabs.map((e) => Tab(text:e )).toList(),
         ),
        ),
       
        body: TabBarView(
          controller: _tabController,
           children: tabs.map((e) {
          return KeepAliveWrapper(
            child: Container(
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: 4,
                itemExtent: 200,
                itemBuilder: (context,index){
                  return  Scaffold(
                    
body: GestureDetector(


child:
     Container(
                    margin: EdgeInsets.all(30),  
                    color: Colors.blue.shade50,

                    child:   
                     Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                               Text(str1[index],style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                               Padding(padding: EdgeInsets.symmetric(vertical: 11),),
                               Text(str2[index]),
                               Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                               Text(ch1[index],style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
                            Column(
                              children: [Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                                Image(
                          image: AssetImage(imgs[index]),
                          width: 70,
                          alignment: Alignment.topLeft,
                         ),
                         Padding(padding: EdgeInsets.symmetric(vertical: 13)),
                         Text(ch2[index]),
                         
                              ],
                            )
                          ],
                         )
                  ) ,onTap: () { 
                    

                    
                   Navigator.push( 
          context,
                MaterialPageRoute(
              builder: (context) {
                return Action1(
                  // 路由参数
                  text: str1[index],
                  
                );
              },
            ),
        );
                  
                  
                  },



),

                   

                        
                      


                  );
                },
              )
            ),
          );
        }).toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
}
