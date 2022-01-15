
import 'package:flutter/material.dart';
import 'package:useditem/Views/Widgets/CustomButton.dart';
import 'package:useditem/Views/Widgets/CustomEditText.dart';

class ProductDetails extends StatefulWidget {
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final TextEditingController messageController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    messageController.text='is this item is still avilable?';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image.asset('assets/images/test.jpg'),
            Text('title tile0',style: TextStyle(fontSize: 20),),
            Text('Price: 50',style: TextStyle(fontSize: 18,color: Colors.grey),),
            Text('Send seller a message',style: TextStyle(fontSize: 18,color: Colors.grey),),
            Row(
              children: [
                Expanded(
                    flex: 3,
                  child: defaultFormField(
                    controller: messageController,
                    type: TextInputType.text,
                    validator: (){},
                  ),
                ),
                Expanded(
                 flex:1,
                  child: CustomButton(
                    width:0,
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(129, 225, 209, 1.0)),
                    label: "send",
                    onPressed: (){


                    },
                  ),
                ),
              ],
            )


          ],
        ),
      ),
    );
  }
}
