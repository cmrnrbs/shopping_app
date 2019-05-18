import 'package:flutter/material.dart';
import 'initialize.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 260,
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))
            ),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Image.asset('assets/products/hanginglight.png',width: 240,),
                ),
                Positioned(
                  left: 32,
                  top: 64,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Image.asset('assets/icons/left-arrow.png',color: Colors.white,width: 20,),
                    ),
                  ),
                ),
                Positioned(
                  right: 32,
                  top: 64,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Image.asset('assets/icons/heart.png',color: Colors.white,width: 20,),
                        SizedBox(width: 10,),
                        Image.asset('assets/icons/shopping-bag.png',color: Colors.white,width: 20,),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                width: 8,
                height: MediaQuery.of(context).size.height - 260,
                color: mainColor,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 8,
                height: MediaQuery.of(context).size.height - 260,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Stack(
                          children: <Widget>[
                            Text("Hanging\nLamp light",style: TextStyle(fontWeight: FontWeight.bold,color: mainColor,fontSize: 20,fontFamily: 'MagnumSansMedium'),),
                            Positioned(top:12,right: 0,child: Text("\$70.56",style: TextStyle(fontSize: 16,color: mainColor,fontFamily: 'MagnumSansBold'),))
                          ],
                        ),
                      ),
                      PropertiesList(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                          SizedBox(height: 20,),
                          Text('Description',style: TextStyle(color: mainColor,fontSize: 18),),
                          SizedBox(height: 20,),
                          Text('An adminitrative division of the Maldives comprising the natural atolls of Felidhu Atoll and the Vattaru Reff. It is the smallest',style: TextStyle(color: mainColor,fontSize: 15,height: 1.4),),
                          SizedBox(height: 40,),
                          ],
                        ),
                      ),
                      BuyNowButton()
                    ],
                  ),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}

class PropertiesList extends StatefulWidget {
  @override
  _PropertiesListState createState() => _PropertiesListState();
}

class _PropertiesListState extends State<PropertiesList> {
  List<ProductItemClass> sampleData = new List<ProductItemClass>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new ProductItemClass("In a matter of min", "Easy Install", "assets/icons/clock.png"));
    sampleData.add(new ProductItemClass("Bridge Included", "Ambiance", "assets/icons/idea.png"));
    sampleData.add(new ProductItemClass("Available different", "Color", "assets/icons/paint-palette.png"));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.width /3 - 23,
      margin: EdgeInsets.only(top: 20),
      child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: sampleData.length,itemBuilder: (context,int index){
      return Container(
        margin: EdgeInsets.only(right: index == 0 ? 10 : 0,left: index == sampleData.length -1 ? 10 : 0),
        width: MediaQuery.of(context).size.width /3 - 23,
        height: MediaQuery.of(context).size.width /3 - 23,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: mainColor)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10,),
              Text(sampleData[index].description,style: TextStyle(fontSize: 9),),
              SizedBox(height: 4,),
              Text(sampleData[index].title,style: TextStyle(fontFamily: 'MagnumSansBold',fontSize: 12),),
              SizedBox(height: 4,),
              Image.asset(sampleData[index].imagePath,color: mainColor,width: 32,),
            ],
          ),
        ),
      );
      }),
    );
  }
}

class ProductItemClass
{
  String description,title,imagePath;
  ProductItemClass(this.description,this.title,this.imagePath);
}


class BuyNowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: mainColor),
      child: Center(child: Text('BUY NOW',style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'MagnumSansExtraLight'),),),
    );
  }
}
