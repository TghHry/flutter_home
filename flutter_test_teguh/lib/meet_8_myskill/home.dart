// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test_teguh/meet_8_myskill/provider.dart';
// import 'package:provider/provider.dart' as provider ;

// class HomePage extends ConsumerWidget{
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final angkaRiverpod = ref.watch(counterProvider);
//     return Scaffold(
//       appBar: AppBar(
//         // title: const Text("Latihan Materi 8"),
//       ),
//       body: Center(
//         // child: Consumer(builder: (context, CounterModel counterModel, child) {
//         child: ,
//           Text(
//             counterModel.counter.toString(),
//             style: TextStyle(fontSize: 100),
//           );
//         }),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               context.read<CounterModel>().increment();
//             },
//             child: Icon(Icons.add),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               context.read<CounterModel>().decrement();
//             },
//             child: Icon(Icons.remove),
//           )
//         ],
//       ),
//     );
//   }
// }
