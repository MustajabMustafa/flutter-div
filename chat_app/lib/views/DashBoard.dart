import 'package:chat_app/viewmodels/DashBoard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => DashboardViewModel(),
        builder: (context, viewModel, child) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xFF075E54),
                title: const Text("Chat App"),
                actions: [
                  Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.search,
                          size: 26.0,
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_vert_outlined,
                          size: 26.0,
                        ),
                      )),
                ],
                bottom: const TabBar(
                  indicatorColor: Colors.white,
                  indicatorWeight: 3,
                  labelColor: Colors.white,
                  unselectedLabelColor: Color(0xFF6BA9AA),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(
                      text: 'CHATS',
                    ),
                    Tab(
                      text: 'STATUS',
                    ),
                    Tab(
                      text: 'CALLS',
                    ),
                  ],
                ),
              ),
              body: const TabBarView(
                children: [
                  //Chat_Screen(),
                  //Status_Screen(),
                  //Calls_Screen(),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color(0xFF075E54),
                child: const Icon(
                  Icons.comment,
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }
}

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xFF075E54),
//           title: const Text("Chat App"),
//           actions: [
//             Padding(
//                 padding: const EdgeInsets.only(right: 20.0),
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: const Icon(
//                     Icons.search,
//                     size: 26.0,
//                   ),
//                 )),
//             Padding(
//                 padding: const EdgeInsets.only(right: 20.0),
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: const Icon(
//                     Icons.more_vert_outlined,
//                     size: 26.0,
//                   ),
//                 )),
//           ],
//           bottom: const TabBar(
//             indicatorColor: Colors.white,
//             indicatorWeight: 3,
//             labelColor: Colors.white,
//             unselectedLabelColor: Color(0xFF6BA9AA),
//             labelStyle: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//             tabs: [
//               Tab(
//                 text: 'CHATS',
//               ),
//               Tab(
//                 text: 'STATUS',
//               ),
//               Tab(
//                 text: 'CALLS',
//               ),
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: [
//             //Chat_Screen(),
//             //Status_Screen(),
//             //Calls_Screen(),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {},
//           backgroundColor: const Color(0xFF075E54),
//           child: const Icon(
//             Icons.comment,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
