import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditrack/Pages/AddReminder.dart';

// class MedicineAddedContainer extends StatefulWidget {
//   const MedicineAddedContainer({super.key});

//   @override
//   State<MedicineAddedContainer> createState() => _MedicineAddedContainerState();
// }

// class _MedicineAddedContainerState extends State<MedicineAddedContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         gridDelegate:
//             const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemCount: 2,
//         itemBuilder: (context, index) {
//           return Container(
//             height: 30.h,
//             width: 20.w,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(2),
//               color: const Color.fromARGB(255, 102, 12, 12),
//             ),
//           );
//         });
//   }
// }

// class NewMedicineAdded extends StatelessWidget {
//   const NewMedicineAdded({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "08:00",
//           style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
//         ),
//         Container(
//           height: 40,
//           width: 40,
//           margin: EdgeInsets.only(bottom: 8), // Add margin between items
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 spreadRadius: 0,
//                 blurRadius: 5,
//                 offset: Offset(0, 3),
//               )
//             ],
//             borderRadius: BorderRadius.all(Radius.circular(12)),
//           ),
//           child: const ListTile(
//             leading: Image(
//               width: 50,
//               height: 50,
//               image: AssetImage("assets/images/file.png"),
//             ),
//             title: Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: Row(
//                 children: [
//                   Text(
//                     "Omega - 3",
//                     style: TextStyle(
//                         decoration: TextDecoration.none,
//                         fontSize: 17,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(width: 30),
//                   Text(
//                     "08:00",
//                     style: TextStyle(
//                       decoration: TextDecoration.none,
//                       fontSize: 17,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             subtitle: Text(
//               "1 pill once per day",
//               style: TextStyle(
//                 decoration: TextDecoration.none,
//                 fontSize: 15,
//                 fontFamily: "Poppins-SemiBold",
//               ),
//             ),
//             trailing: Icon(Icons.more_vert),
//           ),
//         ),
//       ],
//     );
//   }
// }

class NewMedicineAdded extends StatefulWidget {
  const NewMedicineAdded({super.key});

  @override
  State<NewMedicineAdded> createState() => _NewMedicineAddedState();
}

class _NewMedicineAddedState extends State<NewMedicineAdded> {
  List<String> medicines = [];
  void AddGridItem() {
    Navigator.pop(context, GridItem(title: "Added "));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5.h),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.green,
                  color: Colors.white54,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image.asset(
                      "assets/images/file.png",
                      width: 65,
                      height: 65,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Tablet Name ",
                      // medicines[index]['name']!,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
