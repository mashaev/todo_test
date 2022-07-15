import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_task/bloc/todo_bloc.dart';
import 'package:todo_task/screen/add_task.dart';
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
    BlocProvider.of<TodoBloc>(context).getTodos();
    _controller =
        TabController(vsync: this, length: _tabCaption.length, initialIndex: 0);
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
          backgroundColor: Colors.white,
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
                onPressed: () async {
                  SharedPreferences session =
                      await SharedPreferences.getInstance();
                  session.remove('todo');
                },
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

        body: Stack(
          children: [
            TabBarView(controller: _controller, children: [
              TabCategory(),
              TabCategory(),
              TabCategory(),
              TabCategory(),
            ]),
            Positioned(
                bottom: 30,
                left: 30,
                right: 30,
                child: SubmitButton(
                    text: 'Add a task',
                    onPresd: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => const AddTask(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration:
                              const Duration(milliseconds: 2000),
                        ),
                      );
                    })),
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
