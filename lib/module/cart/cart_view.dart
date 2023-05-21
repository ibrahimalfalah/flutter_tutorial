import 'package:flutter/material.dart';
import 'package:offline/shared/network/local/cache_helper.dart';
import 'package:offline/shared/network/local/local_database.dart';
 int ? value;
class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {

  @override
  void initState() {
    super.initState();
    value = 0;
  }
  @override
  Widget build(BuildContext context) {

    setState(() {
      value = CacheHelper.getData(key: 'numberOfItems');
    });
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.maxFinite,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
             Text('Number of item is $value',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0),),
            const SizedBox(
              height: 40.0,
            ),
            Container(
              height: 40.0,
              width: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.cyan,
              ),
              child: MaterialButton(
                onPressed: (){
                  setState(() {
                    if(value != null) {
                      value = value!  + 1;
                      CacheHelper.saveData(key: 'numberOfItems', value: value);
                    } else if(value == null) {
                      setState(() {
                        value = 0;
                        CacheHelper.saveData(key: 'numberOfItems', value: value);
                      });
                    }

                  });
                },
                child: const Center(child: Text('increase item',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24.0),)),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Container(
              height: 40.0,
              width: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.red,
              ),
              child: MaterialButton(
                onPressed: (){
                    CacheHelper.removeData(key: 'numberOfItems');
                },
                child: const Center(child: Text('remove data',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24.0),)),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Container(
              height: 40.0,
              width: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.yellow,
              ),
              child: MaterialButton(
                onPressed: (){
                    DatabaseHelper.insertToDatabase(id: 6, username: 'sara', item: 'android mobile', qty: 1, price: 100);
                    DatabaseHelper.insertToDatabase(id: 7, username: 'ibrahim', item: 'ios mobile', qty: 4, price: 3000);
                    DatabaseHelper.insertToDatabase(id: 8, username: 'ali', item: 'labtop', qty: 2, price: 1000);
                    DatabaseHelper.insertToDatabase(id: 9, username: 'leen', item: 'tv', qty: 1, price: 300);
                    DatabaseHelper.insertToDatabase(id: 10, username: 'omar', item: 'tablet', qty: 10, price: 1500);
                },
                child: const Center(child: Text('insert data into database',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24.0),)),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
