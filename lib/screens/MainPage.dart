import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scorelive/screens/Account.dart';
import 'package:scorelive/screens/Competition.dart';
import 'package:scorelive/screens/HomePage.dart';
import 'package:scorelive/screens/News.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}
 int currentTab = 0;
 List screens=[
   HomePage(),
   Competition(),
   News(),
   Account()
];
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
     bottomNavigationBar: BottomAppBar(
       color: Color(0xFF1E1E1E),
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10),
         child: (
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             GestureDetector(
               onTap: (){
                 setState(() {
                   currentTab = 0;
                 });
               },
               child: Column(
                 children: [
                   Icon(Icons.home,
                     color: currentTab == 0 ? Color(0xFFF63D68) : Colors.grey.shade500,),
                   Text("Home",
                     style: TextStyle(
                       color:Colors.grey.shade500,
                     ),)
                 ],
               ),
             ),
             GestureDetector(
               onTap: (){
                 setState(() {
                   currentTab = 1;
                 });
               },
               child: Column(
                 children: [
                   Icon(Icons.list ,
                     color: currentTab == 1 ? Color(0xFFF63D68) : Colors.grey.shade500,),
                   Text("Competition",
                     style: TextStyle(
                       color: Colors.grey.shade500,
                     ),)
                 ],
               ),
             ),
             GestureDetector(
               onTap: (){
                 setState(() {
                   currentTab = 2;
                 });
               },
               child: Column(
                 children: [
                   Icon(Icons.newspaper ,
                     color: currentTab == 2 ? Color(0xFFF63D68) : Colors.grey.shade500,),
                   Text("News",
                     style: TextStyle(
                       color: Colors.grey.shade500,
                     ),)
                 ],
               ),
             ),
             GestureDetector(
               onTap: (){
                 setState(() {
                   currentTab = 3;
                 });
               },
               child: Column(
                 children: [
                   Icon(Icons.person ,
                     color: currentTab == 3 ? Color(0xFFF63D68) : Colors.grey.shade500,),
                   Text("Account",
                     style: TextStyle(
                       color:  Colors.grey.shade500,
                     ),)
                 ],
               ),
             )

           ],
         )
         ),
       ),
     ),
        body: screens[currentTab],
    );
  }
}
