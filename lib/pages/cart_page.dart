import 'package:ecommercerapp/models/restorant.dart';
import 'package:ecommercerapp/pages/payment_page.dart';
import 'package:ecommercerapp/widget/mybuttom.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/mycart_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restorant>(
      builder: (context, resturant, child) {
        final usercart = resturant.usercart;
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            centerTitle: true,
            title: const Text('cart'),
            actions: [
              IconButton(
                icon: Icon(Icons.delete,
                    color: Theme.of(context).colorScheme.inversePrimary),
                onPressed: () {
                  if (usercart.isEmpty)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('The cart is already empty'),
                      ),
                    );
                  else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Are You Sure to make cart empty'),
                          titleTextStyle: TextStyle(
                              fontSize: 17,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                          actions: [
                            //cancel buttom
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('cancel')),
                            //ok buttom
                            TextButton(
                                onPressed: () {
                                  resturant.clearcart();
                                  Navigator.pop(context);
                                },
                                child: const Text('ok'))
                          ],
                        );
                      },
                    );
                  }
                },
              )
            ],
          ),
          body: Column(
            children: [
              usercart.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Text(
                          'cart is empty... ',
                          style: TextStyle(
                              fontSize: 17,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: usercart.length,
                        itemBuilder: (context, index) {
                          return MyCartPageTile(
                            usercart: usercart,
                            index: index,
                            resturant: resturant,
                          );
                        },
                      ),
                    ),
              //buttom
              if (usercart.isNotEmpty)
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Mybuttom(
                      text: 'check out ',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentPage()));
                      },
                    )),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        );
      },
    );
  }
}
