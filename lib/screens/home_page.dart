import 'package:flutter/material.dart';
import './main_widgets/home_info_list.dart';
import './main_widgets/dust_bunnies.dart';
import './main_widgets/tasks.dart';
import './main_widgets/stateful_tasks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/person_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  String selectedPopupRoute = "HomePage";
  final List<String> popupRoutes = <String>[
    "Edit Household", "Change Household", "Sign out",
  ];

  _showDialog(BuildContext context) {
    return () async {
      String selected = await showDialog<String>(
        context: context,
        child: SimpleDialog(
          children: <Widget>[
            SimpleDialogOption(
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit household'),
              onTap: () => print("Pressed: Edit household"),
              ),
            ),
            SimpleDialogOption(
              child: ListTile(
                leading: Icon(Icons.swap_horiz),
                title: Text('Change household'),              
              onTap: () => print("Pressed: Change household"),              
              ),
            ),
            SimpleDialogOption(
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sign out'),
              onTap: () => print("Pressed: Sign out"),
              ),
            ),
          ],
        ),
      );
      if (selected != null) {
        setState(() {
          selectedPopupRoute = selected;
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _showDialog(context),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('KLÆBU', style: Theme.of(context).textTheme.title,),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          )
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return homeInfoList(context, index);
        },
      ), 
      floatingActionButton: FloatingActionButton( 
        child: Icon(Icons.add),
        onPressed: () {Navigator.of(context).pushNamed("AddTask"); },
      ), 
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return PersonTile(context, document['name'], document['points']);
  }

}

/*
class HomePage extends StatefulWidget {

  final int initialIndex;

  HomePage(this.initialIndex);

  @override
  _HomePageState createState() => _HomePageState(initialIndex);

}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  int initialIndex;

  _HomePageState(this.initialIndex);

  final List<Tab> tabs = <Tab>[
    Tab(text: "HOME",),
    Tab(text: "TODO",),
    Tab(text: "LOGG",),
  ];
 
  TabController _tabController;
  var fabIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this, initialIndex: initialIndex);
    _tabController.addListener(_getFab);
    fabIndex=initialIndex;
  } 

  void dispose() {
    _tabController.dispose();
    super.dispose();
  } 

  FloatingActionButton _fab(int index, BuildContext context) {
    final List<FloatingActionButton> fabs=[
    null, //HOME
    FloatingActionButton( //TODO
      child: Icon(Icons.add),
      onPressed: () {Navigator.of(context).pushNamed("AddTask"); },
    ),
    null, //LOGG
    ];

    return fabs[index];
  }
  

  void _getFab() {
    setState((){
      fabIndex=_tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      bottom: TabBar(
        indicatorColor: Theme.of(context).accentColor,
        controller: _tabController,
        tabs: tabs,
      ),
      title: Text('KLÆBU', style: Theme.of(context).textTheme.title,),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
    ),
    body: TabBarView(
      controller: _tabController,
      children: <Widget>[
        MainTab(),
        TodoTab(),
        LoggTab(),
      ],
    ),
    // drawer: MyDrawer(),
    floatingActionButton: _fab(fabIndex, context),
    );
  }

}
*/