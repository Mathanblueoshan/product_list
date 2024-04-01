import 'package:flutter/material.dart';

class DrawerBox extends StatelessWidget {
  const DrawerBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
    color: Colors.grey,
    child:Column(
      children: [
      Container(
        width: double.infinity,
        height: 200,
        child: const Column(
          children: [
            SizedBox(height: 30,),
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundImage:NetworkImage("https://image.lexica.art/full_jpg/7515495b-982d-44d2-9931-5a8bbbf27532"),
               ),
            ),
    
             Text("steve johnson",style:  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
             Text("steve21@gmail.com",style:  TextStyle(fontSize: 15,color: Color.fromARGB(255, 97, 94, 94)),),
    
          ],
        ),
    
      ), 
    
      const Divider(color: Color.fromARGB(255, 5, 5, 5),),
      //body
    
      Container(
        child: const SingleChildScrollView(
          child: Column(
          
    
          children: [
            
              SizedBox(height: 30,),
    
              SizedBox(
               child: Column(
               
                children: [
                 ListTile(
                leading: Icon(Icons.home_outlined,color: Colors.black,),
                title:Text("Home",style:  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),), 
              ),
    
               ListTile(
                leading: Icon(Icons.shopify,color: Colors.black,),
                title:Text("Products",style:  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),), 
              ),
    
               ListTile(
                leading: Icon(Icons.supervisor_account_outlined,color: Colors.black,),
                title:Text("Refer & Earn",style:  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),), 
              ),
    
               ListTile(
                leading: Icon(Icons.live_help_outlined,color: Colors.black,),
                title:Text("Help",style:  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),), 
              ),
               ListTile(
                leading: Icon(Icons.settings,color: Colors.black,),
                title:Text("Settings",style:  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),), 
              ),
               ],),
              ),
             
              ListTile(
                leading: Icon(Icons.logout_outlined,color: Colors.black,),
                title:Text("Logout",style:  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),), 
              ),
          ],
        ),),
        
      )
    ],)
                        );
  }
}
