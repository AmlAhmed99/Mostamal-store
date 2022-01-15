
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:useditem/Views/Widgets/CustomEditText.dart';
import 'package:useditem/Views/Widgets/SearchWidget.dart';

class SearchScreen extends StatelessWidget {
  var textController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Product"),),
      body:  Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //if(state is LoadSearchstate)
                LinearProgressIndicator(),
              SizedBox(height:10 ,),
              defaultFormField(
                controller: textController,
                label: "search product",
                type: TextInputType.text,
                prefix: Icon(Icons.search),
                validator: (value) {
                  if (value == null || value.isEmpty ) {
                    return 'Please enter product name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              //Expanded(
                // child: ConditionalBuilder(
                //   condition: searchItem != null,
                //   builder: (context) => ListView.separated(
                //     physics: BouncingScrollPhysics(),
                //     itemBuilder: (context, index) => SearchWidget(),
                //     separatorBuilder: (context, index) => Container(
                //       width: double.infinity,
                //       height: 1.0,
                //       color: Colors.grey[300],
                //     ),
                //     //itemCount: searchItem.data.data.length,
                //   ),
                //   fallback: (context) => Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Image.asset('assets/images/noItem.png'),
                //       Text('Type to search products'),
                //     ],
                //   ),
                // ),
             // )
            ],

          ),
        ),
      ),

    );
  }
}
