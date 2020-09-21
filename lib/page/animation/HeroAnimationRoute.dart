import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(tag: 'avatar', child: ClipOval(
            //  child: Image(image: NetworkImage('https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"'),width: 50.0,),
            child: Image.asset('images/time.jpeg'),
          )),
          onTap: (){
            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation animation,Animation secondaryAnimation){
              return FadeTransition(opacity: animation,
                child: HeroAnimationRouteB(),);
            },transitionDuration: Duration(seconds: 5)),);
          },
        ),
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Hero(tag: "avatar", child: Image.asset('images/time.jpeg')),
     ),
   );
  }

}