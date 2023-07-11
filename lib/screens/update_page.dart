import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({Key? key}) : super(key: key);
  static String id = 'Update Product';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? productName, desc, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text('Update Product',
              style: TextStyle(
                color: Colors.black,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 70,
              ),
              CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hint: 'Product Name'),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (data) {
                  price = data;
                },
                hint: 'Price',
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hint: 'description'),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hint: 'image'),
              SizedBox(
                height: 60,
              ),
              CustomButton(
                text: 'Update Now',
                onPressed: () async {
                  isLoading = true;
                  setState(() {});

                  try {
                    await updateProduct(product);
                  } catch (ex) {
                    print(ex.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
