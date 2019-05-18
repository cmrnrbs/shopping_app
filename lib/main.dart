import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'initialize.dart';
import 'detail_page.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Shopping App',
  home: HomePage(),
));


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentPage(),
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
    children: <Widget>[
     Column(
       children: <Widget>[
         TopBanner(),
         CustomNavigationBar(),
         Container(
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height -104,
           child: SingleChildScrollView(
             scrollDirection: Axis.vertical,
             child: Column(
               children: <Widget>[
                 QuickNavigationBar(),
                 TitleBar(),
                 ProductsMenu(),
                 BottomTitleBar(),
                 CarouselMenu()
               ],
             ),
           ),
         )
       ],
     )
    ],
    );
  }
}


class TopBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 8,
      color: mainColor,
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      margin: EdgeInsets.only(top:32),
      width: MediaQuery.of(context).size.width,
      height: 64,
        child: Stack(
        children: <Widget>[
          Positioned(left:0,top:22,child: Image.asset('assets/icons/menu.png',width: 20,)),
          Positioned(right:0,top:22,child: Image.asset('assets/icons/shopping-bag.png',width: 20,)),
    ],
    ),
    );
  }
}

class QuickNavigationBar extends StatefulWidget {
  @override
  _QuickNavigationBarState createState() => _QuickNavigationBarState();
}

class _QuickNavigationBarState extends State<QuickNavigationBar> {
  List<MenuItemClass> sampleData = new List<MenuItemClass>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new MenuItemClass(true,"assets/icons/lamp.png"));
    sampleData.add(new MenuItemClass(false,"assets/icons/sofa.png"));
    sampleData.add(new MenuItemClass(false,"assets/icons/window.png"));
    sampleData.add(new MenuItemClass(false,"assets/icons/table.png"));
    sampleData.add(new MenuItemClass(false,"assets/icons/armchair.png"));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(scrollDirection: Axis.horizontal,shrinkWrap: true,itemCount: sampleData.length,itemBuilder: (context,int index){

        return Padding(

          padding: EdgeInsets.only(left:index ==0 ? 32 : 0,top:0,bottom: 12),
          child: Row(
            children: <Widget>[
              new InkWell(
                splashColor: mainColor,
                borderRadius: const BorderRadius.all(Radius.circular(32)),
                onTap: (){
                  setState(() {
                    sampleData.forEach((element) => element.isSelected  =false);
                    sampleData[index].isSelected =true;
                  });
                },
                child: new MenuItem(sampleData[index]),
              ),
              SizedBox(width: 10,)
            ],
          ),
        );
      }),
    );
  }
}

class MenuItemClass
{
  bool isSelected;
  String imagePath;
  MenuItemClass(this.isSelected,this.imagePath);
}

class MenuItem extends StatelessWidget {
  final MenuItemClass _item;
  MenuItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: _item.isSelected ? mainColor.withOpacity(0.8) : Colors.transparent,
            blurRadius: 16,
              spreadRadius: 0,
            offset: Offset(0.0, 8.0)
          )
        ],
        borderRadius: BorderRadius.circular(32),
        color:_item.isSelected ? mainColor : menuColor
      ),
      child: Center(
        child: new Image.asset(_item.imagePath,width: 32,color: _item.isSelected ? Colors.white : mainColor,),
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: 32,vertical: 18),
      child: Stack(
       children: <Widget>[
         new RichText(text: new TextSpan(
           style: new TextStyle(
             fontSize: 20.0,
             color: Colors.black,
           ),
           children: <TextSpan>[
             new TextSpan(
               text: 'Lamp - ',
               style: new TextStyle(
                 fontWeight: FontWeight.bold,
                 color: mainColor,
                   fontFamily: 'MagnumSansMedium'
               )
             ),
             new TextSpan(
               text: 'Desk lamp',
               style:  new TextStyle(
                 fontWeight: FontWeight.normal,
                 color: mainColor,
                 fontFamily: 'MagnumSansExtraLight'
               )
             )
           ]
         )),
         SeeAllButton()

       ],
      ),
    );
  }
}
class SeeAllButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: InkWell(
        onTap: (){
          print('click!');
        },
        child: Row(
          children: <Widget>[
            Text('See all',style: TextStyle(fontSize: 12.0,color: mainColor),),
            Icon(Icons.keyboard_arrow_right,color: mainColor,)
          ],
        ),
      ),
    );
  }
}

class ProductItemClass
{
  bool isSelected;
  Color itemColor;
  String imagePath,price,title,propertiesText;

  ProductItemClass(this.isSelected,this.itemColor,this.imagePath,this.price,this.title,this.propertiesText);
}

class ProductCard extends StatelessWidget {
  ProductItemClass _item;
  ProductCard(this._item);
  @override
  Widget build(BuildContext context) {
    Radius myValue = Radius.circular(5);
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: 260,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: _item.isSelected ? mainColor.withOpacity(0.7) : Colors.transparent,
            blurRadius: 20,
            offset: Offset(0.0, 8.0)
          )
        ],
        color: _item.itemColor,
        borderRadius: BorderRadius.only(topLeft: myValue,topRight: myValue,bottomLeft: myValue,bottomRight: Radius.circular(50)),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(right: 24,bottom: 24,child: Icon(Icons.add_circle,color: Colors.white,)),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(_item.imagePath,width: 156,),
              ),
              SizedBox(height: 20,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 18),child: Text(_item.price,style: TextStyle(color:Colors.white,fontSize: 14),)),
              SizedBox(height: 4,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 18),child: Text(_item.title,style: TextStyle(color:Colors.white,fontSize: 14,fontWeight: FontWeight.bold),)),
              SizedBox(height: 4,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 18),child: Text(_item.propertiesText,style: TextStyle(color:Colors.white,fontSize: 10),)),
            ],
          )
        ],
      ),

    );
  }
}

class ProductsMenu extends StatefulWidget {
  @override
  _ProductsMenuState createState() => _ProductsMenuState();
}

class _ProductsMenuState extends State<ProductsMenu> {

  List<ProductItemClass> sampleData = new List<ProductItemClass>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new ProductItemClass(true,mainColor, "assets/products/hanginglight.png", "\$70.56", "Hanging Light", "Elegant"));
    sampleData.add(new ProductItemClass(false,secondColor, "assets/products/desklamp.png", "\$60.00", "Desk Lamp", "Classic"));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: sampleData.length,itemBuilder: (context,int index){
        return Padding(
          padding: EdgeInsets.only(left:index ==0 ? 32 : 0,top:0,bottom: 16),
          child: Row(

            children: <Widget>[
              new InkWell(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (contetx)=> DetailPage()));
                },
                splashColor: sampleData[index].itemColor,
                child: Row(
                  children: <Widget>[
                    ProductCard(sampleData[index]),
                    SizedBox(width: 24,)
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class BottomTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: 32,vertical: 18),
      child: Stack(
        children: <Widget>[
          new RichText(text: new TextSpan(
              style: new TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(
                    text: 'Accesories - ',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                        fontFamily: 'MagnumSansMedium'
                    )
                ),
                new TextSpan(
                    text: 'Lamp',
                    style:  new TextStyle(
                        fontWeight: FontWeight.normal,
                        color: mainColor,
                        fontFamily: 'MagnumSansExtraLight'
                    )
                )
              ]
          )),

        ],
      ),
    );
  }
}
class CarouselMenu extends StatefulWidget {
  @override
  _CarouselMenuState createState() => _CarouselMenuState();
}

class _CarouselMenuState extends State<CarouselMenu> {
  List<String> sampleData = new List<String>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add("assets/accesories/ac1.jpg");
    sampleData.add("assets/accesories/ac2.jpg");
    sampleData.add("assets/accesories/ac3.jpg");
    sampleData.add("assets/accesories/ac4.jpg");
  }
  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      enlargeCenterPage: true,
      height: 180.0,
      items: sampleData.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('$i',fit: BoxFit.cover,),
                )
            );
          },
        );
      }).toList(),
    );
  }
}


