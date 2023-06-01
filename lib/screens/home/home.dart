import 'package:e_commerce/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:e_commerce/models/Category_Model/Category_Model.dart';
import 'package:e_commerce/models/product_model/product_model.dart';
import 'package:e_commerce/widgets/top_tiles/top_tiles.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];
  List<ProductModel> productModelList = [];


  bool isLoading = false;
  @override
  void initState() {
    getCaregoryList();
    super.initState();
  }

  void getCaregoryList() async {
    setState(() {
      isLoading = true;
      
    });
    FirebaseFirestoreHelper.instance.getCategories();
    FirebaseFirestoreHelper.instance.getBestProducts();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? Center(
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),
      ):
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopTiles(subtitle: "", title: "Latest Store"),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "What's on your mind?"),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    )
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            productModelList.isEmpty
            ? const Center(
              child: Text("Best Product is empty"),
            ) :
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
            child: Row(
              children: categoriesList
              .map(
                (e) => Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Card(
                color: Colors.white,
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child:  SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(e.image),
                ),
              ),
            ),
            )
            .toList(),
         ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 12.0, left: 12.0), 
           child: Text(
            "Best Products",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
       const SizedBox(
          height: 12.0,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            itemCount: productModelList.length,
            gridDelegate: 
            const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.9,
              crossAxisCount: 2), 
              itemBuilder: (ctx, index) {
                ProductModel singleProduct = productModelList[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12.0,
                      ),
                      Image.network(
                        singleProduct.image,
                        height: 60,
                        width: 60,
                        ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
              singleProduct.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
                  Text("Price: \$${singleProduct.price}"),
                      SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        height: 45,
                        width: 140,
                        child: OutlinedButton(
                          onPressed: () {}, 
                        child: const Text(
                          "Buy",
                          ),
                        ),
                      ),
                    ],
                  ),
                );
            }),
        ),
          ],
        ),
      ),
    );
  }
}
