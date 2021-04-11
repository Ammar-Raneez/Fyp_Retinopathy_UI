import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/components/custom_rounded_button.dart';
import 'package:ui/constants.dart';

class SpecificBlogScreen extends StatefulWidget {
  static String id = "specificBlogScreen";

  @override
  _SpecificBlogScreenState createState() => _SpecificBlogScreenState();
}

class _SpecificBlogScreenState extends State<SpecificBlogScreen> {
  String typeOfBlog;

  var drStagesArticles = ["www.google.lk"];
  var drTypesArticles = ["www.google.lk"];
  var guidelinesArticles = ["www.google.lk"];
  var treatmentsArticles = ["www.google.lk"];

  var chosenBlogType = [];

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    setState(() {
      typeOfBlog = arguments['type'];
      chosenBlogType = typeOfBlog == "Retinopathy Stages"
          ? drStagesArticles
          : typeOfBlog == "Diabetes Types"
              ? drTypesArticles
              : typeOfBlog == "Guidelines"
                  ? guidelinesArticles
                  : treatmentsArticles;
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              "E-Ophthalmologist",
              style: kTextStyle.copyWith(fontSize: 20.0, color: Colors.white),
            ),
          ),
          backgroundColor: Colors.indigo,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                child: Text(
                  typeOfBlog,
                  textAlign: TextAlign.center,
                  style: kTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 11,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Card(
                    child: Container(
                      height: 150,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Image.asset(
                              "images/tempblog.jpg",
                              height: 150,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Clicking on this will navigate to the original blog found on the internet...",
                                    style: kTextStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomRoundedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    colour: Colors.indigo,
                    title: "<-  Back to Home",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
