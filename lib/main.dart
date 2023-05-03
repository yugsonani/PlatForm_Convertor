import 'package:flutter/material.dart';
import 'package:plat_form_convertor/settings.dart';
import 'alert.dart';
import 'calls.dart';
import 'chats.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const homepage(),
    },
  ));
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> with TickerProviderStateMixin {
  late TabController tabController;
  PageController pageController = PageController();

  int index = 0;

  List<Widget> pages = [
    const chats(),
    const calls(),
    const settings(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Platform converter App"),
          centerTitle: true,
          bottom: TabBar(
              controller: tabController,
              indicatorColor: Colors.white,
              onTap: (val) {
                setState(() {
                  index = val;
                  pageController.animateToPage(val,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeIn);
                });
              },
              tabs: const <Tab>[
                Tab(
                  child: Text(
                    "CHATS",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    "CALLS",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    "SETTINGS",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ]),
        ),
        floatingActionButton: (tabController.index == 0)
            ? FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const Alert();
                      });
                },
                child: const Icon(Icons.add),
              )
            : null,
        body: PageView(
          controller: pageController,
          children: pages.map((e) => e).toList(),
          onPageChanged: (val) {
            setState(() {
              tabController.animateTo(val);
              index = val;
            });
          },
        ),
      ),
    );
  }
}
