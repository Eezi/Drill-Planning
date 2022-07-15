import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:markdown_app/components/drawer.dart';
import 'package:markdown_app/components/bottomNavigation.dart';

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({ Key? key }) : super(key: key);
  @override
  State<MyTabbedPage> createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Edit'),
    Tab(text: 'Preview'),
  ];

  late TabController _tabController;
  late TextEditingController _textEditingController;
  QuillController _controller = QuillController.basic();

  
  String text = "";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _textEditingController = TextEditingController();
  }

 @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      bottomNavigationBar: BottomMenu(),
      floatingActionButton:FloatingActionButton( //Floating action button on Scaffold
          onPressed: (){
              //code to execute on button press
          },
          child: Icon(Icons.send), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: Colors.black,
        //title: const Text("Markdown Editor", style: TextStyle(color: Colors.white)),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: QuillEditor.basic(
              controller: _controller,
              readOnly: false, // change to true to be view only mode
            ),
            /*child: TextField(
              controller: _textEditingController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "Input Text",
                border: InputBorder.none,
              ),
              onChanged: (String text) {
                setState(() {
                  this.text = text;
                });
              },
            ),
          ),*/
        ),
          Container(
            margin: EdgeInsets.all(20),
            child: Markdown(data: text),
            // child: Text(text, style: TextStyle(color: Colors.black)),
          )

        ],
      ),
    );
  }
}
