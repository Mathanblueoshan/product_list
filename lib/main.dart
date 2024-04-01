import 'package:api_parse_json/view/widgets/drawer.dart';
import 'package:api_parse_json/viewmodel/productsviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ProductsViewModel(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductsViewModel>(context, listen: false).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
        builder: (context, constraints) => Scaffold(
          appBar: AppBar(
            elevation: 10,
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: const Text("Products List",style: TextStyle(fontWeight: FontWeight.bold),),
            actions:constraints.maxWidth < 950 ? const [
              Text("Steve",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
               CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage("https://image.lexica.art/full_jpg/7515495b-982d-44d2-9931-5a8bbbf27532"),
            ),
             SizedBox(width: 15,),
             ]:[IconButton(onPressed: (){}, icon: const Icon(Icons.logout_outlined,color: Colors.black,))],
          ),
          drawer: constraints.maxWidth < 950 ? const Drawer(

            child: DrawerBox(),
            
          ) : null,
          body: Row(
            children: [
              constraints.maxWidth > 950
                  ? const Expanded(
                        child: DrawerBox())
                  : Container(),
              Expanded(
                flex: 4,
                child: Consumer<ProductsViewModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      itemCount: value.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:constraints.maxWidth < 600 ? 1 : constraints.maxWidth < 780 ? 2 : 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        final products = value.products[index];
                        return Card(
                          elevation: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 200,
                                                      
                                    child: Image.network(
                                      products.thumbnail.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                                      
                                  Text(products.title.toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                                  Text(products.description.toString(),style: const TextStyle(fontSize: 14,color: Colors.grey),),

                                   Text(products.category.toString(),style: const TextStyle(fontSize: 14,color: Colors.grey),),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

                 constraints.maxWidth > 1200 ?  Expanded(
                  
                      child: Container(
                        height: double.infinity,
                      color: const Color.fromARGB(255, 85, 255, 59),
                      child: Consumer<ProductsViewModel>(builder: (context, value, child) {
                        return ListView.builder(
                          itemCount: value.products.length,
                          itemBuilder: (context, index) {
                            final products = value.products[index];

                          return Card(
                            child:Banner(
                              textStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),
                              location: BannerLocation.topStart,
                              color: Colors.green,
                              message:"${products.discountPercentage.toString()}%",
                              child: Image.network(products.images[0])),
                          );
                          
                        },);
                      },)
                    )
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

