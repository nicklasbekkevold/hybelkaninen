import 'package:flutter/material.dart';

import './main_tabs/main_tab.dart';
import './main_tabs/todo_tab.dart';
import './main_tabs/logg_tab.dart';
import '../widgets/my_drawer.dart';

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
      backgroundColor: Colors.red,
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
        indicatorColor: Colors.redAccent,
        controller: _tabController,
        tabs: tabs,
      ),
      title: Text('KLÆBU'),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
    ),
    body: TabBarView(
      controller: _tabController,
      children: <Widget>[
        MainTab(),
        TodoTab(),
        LoggTab(),
      ],
    ),
    drawer: MyDrawer(),
    floatingActionButton: _fab(fabIndex, context),
    );
  }

}