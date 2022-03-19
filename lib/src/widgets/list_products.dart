import 'package:fakeshop/src/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ListProducts extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  ListProducts({Key? key}) : super(key: key);

  get index => null;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        if (productController.isLoading.value) {
          return Center(
            child: const CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      color: Colors.indigo,
                    ),
                    height: 200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              imageUrl:
                                  productController.productList[index].image,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.amber,
                            child: Column(
                              children: [
                                Text(
                                  productController.productList[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Kategori Produk : ' +
                                      productController
                                          .productList[index].category,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Rp. ' +
                                      productController.productList[index].price
                                          .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                if (productController
                                        .productList[index].rating !=
                                    null)
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                      vertical: 2,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          productController
                                              .productList[index].rating!.rate
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
      }),
    );
  }
}
