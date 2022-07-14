import 'package:flutter/material.dart';
import 'package:todo_task/service/api_service.dart';
import 'package:todo_task/widgets/drawer_widget.dart';
import 'package:todo_task/widgets/submit_button.dart';
import 'package:todo_task/widgets/tab_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<Tab> _tabCaption = [
    const Tab(child: Text('All')),
    const Tab(child: Text('Completed')),
    const Tab(child: Text('Uncompleted')),
    const Tab(child: Text('favorite')),
  ];
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    ApiService.getTodos();
    _controller =
        TabController(vsync: this, length: _tabCaption.length, initialIndex: 0);
  }

  Widget submitButton() {
    Widget contnt;
    Function()? onPresd;
    // if (mainCtr.submittingBtn.value) {
    contnt = new CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white));
    onPresd = () {};
    //} else {
    contnt = Text('Отправить', style: TextStyle(color: Colors.white));
    onPresd = () {};
    // }

    return SizedBox(
      child: ElevatedButton(
          onPressed: onPresd,
          child: contnt,
          style: ElevatedButton.styleFrom(primary: Colors.green)),
      height: 40.0,
      width: 200.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabCaption.length,
      child: Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: AppBar(
          //backgroundColor: Colors.white,
          title: const Text(
            'Board',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
          ],
          bottom: TabBar(
              indicatorPadding: const EdgeInsets.all(10),
              labelColor: Colors.black,
              controller: _controller,
              isScrollable: true,
              tabs: _tabCaption),
        ),

        body: TabBarView(controller: _controller, children: [
          Stack(
            children: [
              Positioned(
                  bottom: 30,
                  left: 30,
                  right: 30,
                  child: SubmitButton(text: 'Add a task', onPresd: () {})),
              TabCategory(
                text: 't',
              ),
            ],
          ),
          TabCategory(
            text: 'v',
          ),
          TabCategory(
            text: 'b',
          ),
          TabCategory(
            text: 'g',
          ),
        ]),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
