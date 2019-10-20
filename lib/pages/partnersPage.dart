
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:DevJams/Presentation/util.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snaplist/snaplist.dart';

class PartnersPage extends StatefulWidget {
  PartnersPage({Key key,this.restaurantID,this.workerID}) : super(key: key);
  final String restaurantID, workerID;

  @override
  _PartnersPageState createState() => _PartnersPageState();
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: background,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _PartnersPageState extends State<PartnersPage> {
  ScrollController scrollController;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {

    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener(() => setState(() {}));
  }

  bool pressAttentionP=true;
  bool pressAttentionS=false;
  bool pressAttentionPBorder=true;
  bool pressAttentionSBorder=false;



  void PAction(){
    setState(() {
    pressAttentionP=true;
    pressAttentionPBorder=true;
    pressAttentionS=false;
    pressAttentionSBorder=false;
    
    });
  }

  void SAction(){
    setState(() {
    pressAttentionPBorder=false;
    pressAttentionS=true;
    pressAttentionSBorder=true;
    pressAttentionP=false;

    });
  }

  @override
  Widget build(BuildContext context) {

    var flexibleSpaceWidget = new SliverAppBar(
      backgroundColor: background,
      expandedHeight: 80.0,
      elevation: 0,
//      centerTitle: true,
      pinned: true,

    );

    return Scaffold(
      backgroundColor: background,
      body: new DefaultTabController(
        length: 1,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              flexibleSpaceWidget,
              SliverPersistentHeader(

                delegate: _SliverAppBarDelegate(

                  TabBar(

                    indicator:BoxDecoration(color: background),
                    isScrollable: true,
                    indicatorColor: background,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(child:Container(
                          margin: EdgeInsets.only(left: 32,right: 8),
                          child: Text("Speakers", style: TextStyle(fontSize: 26.0),)),),
//                      Tab(child:Container(
//                        margin: EdgeInsets.only(left: 0,right: 32),
//                        child:  Text("Sponsors", style: TextStyle(fontSize: 26.0)),)),

                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body:Container(
              color: background,
              child: new TabBarView(

                children: <Widget>[
                  PromotionsPage(),
//                  CollaboratorsPage(),
//                  SponsorsPage(),
                ],
              )),
        ),
      ),
    );

}

List<String> name = ["Sachin Kumar","Nikita Gandhi","Dinesh Shanmugan C","Rohan Mishra","Thiyagaraj T","Shashank Barki", "Ananya", "Ashwini Purohit","Ajay Ravindra","Manjunath Iyer BS"];
List<String> des = ["From chatbots, Voice to building immersive Visual games for Google Assistant","Making handsome deals with ML","Building Android Apps at Scale","The 180 degree shift - from Engineering to Design","Building Your Developer Roadmap","Quicken your Cloud Journey using Qwiklabs", "Getting most out of Developer Communities","Building a startup as a college student","Succeeding in Software","Automation of Android and iOS builds and publishing them to app stores"];
List<String> company = ["Google Developers Expert", "Google","RedBus","Zomato","Kubric","Manhattan Associates", "WTM","Winuall.com","Crio.Do","Atlassian"];
List<String> img = ["lib/assests/one.png","lib/assests/two.png","lib/assests/three.jpg","lib/assests/four.jpg","lib/assests/five.png","lib/assests/six.JPG","lib/assests/seven.jpeg","lib/assests/eight.jpg","lib/assests/nine.JPG","lib/assests/ten.png"];

Widget PromotionsPage(){
  return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext ctxt, int index) {
      return Container(
        height: 280,
            width: MediaQuery.of(context).size.width-32,
            margin: EdgeInsets.only(left:32,right: 32,bottom: 32),
            decoration: BoxDecoration(
            boxShadow:<BoxShadow>[
            BoxShadow(blurRadius: 2.0,
            color:Colors.grey[400] ,
            offset: Offset(0.5,0.5))

            ],
            shape: BoxShape.rectangle,
            color: Colors.white ,
            borderRadius: BorderRadius.all(Radius.circular(5))),
          child:Container(
child: Column(
  children: <Widget>[
    Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16),
          height: 90,
          width: 90,
         color: Colors.black,
         child: Image.asset(img[index])
        ),
        ClipPath(
          clipper: BottomWaveClipper(),
          child: Container(
            height: 60,
            width: (MediaQuery.of(context).size.width/5)*2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(8.0),bottomRight: Radius.circular(8.0)),
              color:Colors.red,
            ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Gallery 1",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
              Text("1 pm to 2 pm",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300))
            ],
          ),
          ))
      ],
    ),
    /*Container(
      margin: EdgeInsets.only(left: 16),
      alignment: Alignment(-1,0),
      child: Text("@twitter",style: TextStyle(color: Colors.blue),),
    ),*/
    Container(
      margin: EdgeInsets.only(left: 16,top: 16),
      alignment: Alignment(-1,0),
      child: Text(name[index],style: TextStyle(fontWeight: FontWeight.w500,fontSize:18),),
    ),
    Container(
      margin: EdgeInsets.only(left: 16,top: 16),
      alignment: Alignment(-1,0),
      child: Text(des[index],style: TextStyle(fontWeight: FontWeight.w400,fontSize:14),),
    ),
    Container(
        margin: EdgeInsets.only(left: 16,top: 16,right: 16),
        child:
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(

              height:15,
              width: 15,
//                              height: 20,
//                    width: (MediaQuery.of(context).size.width/10),
              decoration: BoxDecoration(
                shape:BoxShape.circle,
                color:Colors.yellow,
              ),
              child: Text(" "),),
            Padding(padding: EdgeInsets.only(left: 3),),
            Text("Technical",style: TextStyle(color: Colors.yellow))
          ],
        ),

        Container(
          child: Text(company[index]),
        )

      ],
    ))
  ],
),
      )
      ) ;
  }
));
}

  Widget SponsorsPage(){
    int i=0;
    ScrollController _scrollController = new ScrollController();
    return Container(
height: MediaQuery.of(context).size.height-300,
        color: background,
//        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.05),
        width: MediaQuery.of(context).size.width,
    child:Column(children: <Widget>[
Container(
  height: 500,
//height: (MediaQuery.of(context).size.width/4)*3,
//  height: (MediaQuery.of(context).size.width/4)*3,
  child:
  ListView.builder(
      itemCount: 10,
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext ctxt, int index){

      return  Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[





                        Container(
                            // color: Colors.white,
                              margin: EdgeInsets.all(MediaQuery.of(context).size.width/8),
                              width: (MediaQuery.of(context).size.width/4)*3,
                              height: (MediaQuery.of(context).size.width/4)*3,
                              padding: EdgeInsets.all(32.0),
                              decoration: BoxDecoration(
                                  boxShadow:<BoxShadow>[
                                    BoxShadow(blurRadius: 2.0,
                                        color:Colors.grey[400] ,
                                        offset: Offset(0.5,0.5))

                                  ],
                                  shape: BoxShape.rectangle,
                                  color: Colors.white ,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.asset('lib/assests/zeit.svg', semanticsLabel: "Logo",width: (MediaQuery.of(context).size.width/2)-32, height: 100.0),
                                 // Image.asset('lib/assests/zeit.svg' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
                                ],
                              )),



       ]));}

   ),

),
      Container(child:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back,size: 36,color:Colors.yellow[600]),onPressed: (){
            setState(() {
             _scrollController.animateTo(_scrollController.position.pixels-MediaQuery.of(context).size.width, duration: new Duration(seconds: 1), curve: Curves.ease);
//              _isVisible=false;
            });

          },),
          Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape:BoxShape.circle,
                color:Colors.yellow[600],
              ),
              child:
              IconButton(icon: Icon(Icons.share,size: 36,color: Colors.white,),)),
          IconButton(icon: Icon(Icons.arrow_forward,size: 36,color:Colors.yellow[600],),onPressed: (){
    setState(() {
    _scrollController.animateTo(_scrollController.position.pixels+MediaQuery.of(context).size.width, duration: new Duration(seconds: 1), curve: Curves.ease);
//              _isVisible=false;
    });

    })
        ],
      ))
    ]));
  }

Widget CollaboratorsPage(){
  return Container(
      width: MediaQuery.of(context).size.width,
      child : LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        padding: EdgeInsets.only(bottom:20.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap : (){

              },
              child : Container(
                // color: Colors.white,
                  margin: EdgeInsets.all(12),
                  width: (MediaQuery.of(context).size.width/4)*3,
                  height: (MediaQuery.of(context).size.width/4)*3,
                  padding: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      boxShadow:<BoxShadow>[
                        BoxShadow(blurRadius:2.0,
                            color:Colors.grey[400] ,
                            offset: Offset(0.5,0.5))

                      ],
                      shape: BoxShape.rectangle,
                      color: Colors.white ,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('lib/assests/tekno.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
                    ],
                  )),),
            Container(
                // color: Colors.white,
                  margin: EdgeInsets.all(12),
                  width: (MediaQuery.of(context).size.width/4)*3,
                  height:(MediaQuery.of(context).size.width/4)*3,
                  padding: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      boxShadow:<BoxShadow>[
                        BoxShadow(blurRadius: 2.0,
                            color:Colors.grey[400] ,
                            offset: Offset(0.5,0.5))

                      ],
                      shape: BoxShape.rectangle,
                      color: Colors.white ,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('lib/assests/yourstory.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
                    ],
                  )),
            GestureDetector(
              onTap : (){

              },
              child : Container(
                // color: Colors.white,
                  margin: EdgeInsets.all(12),
                  width: (MediaQuery.of(context).size.width/4)*3,
                  height: (MediaQuery.of(context).size.width/4)*3,
                  padding: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      boxShadow:<BoxShadow>[
                        BoxShadow(blurRadius: 2.0,
                            color:Colors.grey[400] ,
                            offset: Offset(0.5,0.5))

                      ],
                      shape: BoxShape.rectangle,
                      color: Colors.white ,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
                    ],
                  )),),
            
            GestureDetector(
              onTap : (){

              },
              child : Container(
                // color: Colors.white,
                  margin: EdgeInsets.all(12),
                  width: (MediaQuery.of(context).size.width/4)*3,
                  height:(MediaQuery.of(context).size.width/4)*3,
                  padding: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      boxShadow:<BoxShadow>[
                        BoxShadow(blurRadius: 2.0,
                            color:Colors.grey[400] ,
                            offset: Offset(0.5,0.5))

                      ],
                      shape: BoxShape.rectangle,
                      color: Colors.white ,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('lib/assests/edtimes.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
                    ],
                  )),),
        Container(
                // color: Colors.white,
                  margin: EdgeInsets.all(12),
                  width: (MediaQuery.of(context).size.width/4)*3,
                  height:(MediaQuery.of(context).size.width/4)*3,
                  padding: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      boxShadow:<BoxShadow>[
                        BoxShadow(blurRadius: 2.0,
                            color:Colors.grey[400] ,
                            offset: Offset(0.5,0.5))

                      ],
                      shape: BoxShape.rectangle,
                      color: Colors.white ,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('lib/assests/tbi.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
                    ],
                  )),
                   
            ],),
        )
    );
  }
));
}
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo((size.width/8)+8,size.height);
    path.arcToPoint(Offset((size.width/8),size.height-8), radius: Radius.circular(8));

    path.lineTo(size.width/8, (size.height/3));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}