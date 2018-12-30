import 'package:flutter/material.dart';

import './main_widgets/dust_bunnies.dart';
import './main_widgets/tasks.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KLÆBU', style: Theme.of(context).textTheme.title,),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: <Widget>[
                DustBunnies(),
                Tasks(),
            ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton( 
        child: Icon(Icons.add),
        onPressed: () {Navigator.of(context).pushNamed("AddTask"); },
      ),
    );
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