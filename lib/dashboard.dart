import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/daily_statistics.dart';
import 'package:login_screen/dashboard_model.dart';
import 'package:login_screen/log_in_screen.dart';
import 'package:login_screen/my_account.dart';
import 'package:login_screen/utils/Constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<DashboardModel> homePageList;

  @override
  void initState() {
    super.initState();
    homePageList = [
      DashboardModel(
          name: "Daily Statistics",
          imageUrl: "assets/daily_stats.png",
          child: DailyStatistics()),
      DashboardModel(
          name: "User Details",
          imageUrl: "assets/user_details.png",
          child: DailyStatistics()),
      DashboardModel(
          name: "Add Payment Plan",
          imageUrl: "assets/add_payment_plan.png",
          child: DailyStatistics()),
      DashboardModel(
          name: "Add-On",
          imageUrl: "assets/add_on.png",
          child: DailyStatistics()),
      DashboardModel(
          name: "View PDF",
          imageUrl: "assets/view_pdf.png",
          child: DailyStatistics()),
      DashboardModel(
          name: "Export Data",
          imageUrl: "assets/export_data.png",
          child: DailyStatistics()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double blockDeviceWidth = MediaQuery.of(context).size.width / 100;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Constants.prefs!.setBool("loggedIn", false);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            )
          ],
          centerTitle: true,
          title: Text("Dashboard",
              style: TextStyle(color: Color(0xFF00D9B1), fontSize: 30)),
        ),
        body: Center(
          child: GridView.builder(
            itemCount: homePageList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? 2
                        : 3),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return homePageList[index].child;
                  }));
                },
                child: Card(
                  color: Color(0xFF1e1f25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          homePageList[index].imageUrl,
                          height: blockDeviceWidth * 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            homePageList[index].name,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                child: DrawerHeader(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTOkHm3_mPQ5PPRvGtU6Si7FJg8DVDtZ47rw&usqp=CAU"),
                    radius: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF111320),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                tileColor: Color(0xFF111320),
                leading: Icon(
                  Icons.person_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                title: Text("My Account",
                    style: TextStyle(
                      color: Color(0xFF00D9B1),
                    )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyAccountScreen()));
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                tileColor: Color(0xFF111320),
                leading: Icon(
                  Icons.settings_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                title: Text("Settings",
                    style: TextStyle(
                      color: Color(0xFF00D9B1),
                    )),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10),
                tileColor: Color(0xFF111320),
                leading: Icon(
                  Icons.logout_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                title: Text("Log Out",
                    style: TextStyle(
                      color: Color(0xFF00D9B1),
                    )),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
