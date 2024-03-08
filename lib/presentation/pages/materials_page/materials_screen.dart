import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/domain/models/m_material.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/material_card.dart';

// class MaterialScreen extends StatefulWidget {
//   const MaterialScreen({super.key});

//   @override
//   State<MaterialScreen> createState() => _MaterialScreenState();
// }

// class _MaterialScreenState extends State<MaterialScreen> {
//   TextEditingController searchTextController = TextEditingController();
//   List<MMaterial> _materials = [];
//   @override
//   void initState() {
//     _materials = testModelOfMaterialsFromDatabase;
//     super.initState();
//   }

//   //поиск по теме!
//   void filter(String query) {
//     List<MMaterial> result = [];
//     if (query.isEmpty) {
//       result = testModelOfMaterialsFromDatabase;
//     } else {
//       result = testModelOfMaterialsFromDatabase
//           .where(
//             (material) => material.text.toLowerCase().contains(
//                   query.toLowerCase(),
//                 ),
//           )
//           .toList();
//     }
//     setState(() {
//       _materials = result;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const NavigatorDrawer(),
//       backgroundColor: const Color(0xFFEDF0FF),
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             surfaceTintColor: Colors.transparent,
//             pinned: true,
//             floating: true,
//             backgroundColor: const Color(0xFFEDF0FF),
//             title: PreferredSize(
//               preferredSize: Size(290.w, 50.h),
//               child: TextField(
//                 onChanged: (value) => filter(value),
//                 controller: searchTextController,
//                 decoration: (searchTextController.text.isEmpty)
//                     ? InputDecoration(
//                         hintText: "Введите тему...",
//                         contentPadding: EdgeInsets.all(8.sp),
//                         prefixIcon: const Icon(Icons.search),
//                         filled: true,
//                         fillColor: const Color(0xFFD8E2FF),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                           borderRadius: BorderRadius.circular(50.sp),
//                         ),
//                       )
//                     : InputDecoration(
//                         contentPadding: EdgeInsets.all(8.sp),
//                         prefixIcon: const Icon(Icons.search),
//                         filled: true,
//                         fillColor: Colors.amber,
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                           borderRadius: BorderRadius.circular(50.sp),
//                         ),
//                       ),
//               ),
//             ),
//           ),

//           //кнопка фильтрации
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: EdgeInsets.all(8.sp),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.sp),
//                     color: const Color(0xFFD8E2FF),
//                   ),
//                   height: 32.h,
//                   width: 122.w,
//                   alignment: Alignment.center,
//                   child: Text(
//                     "Фильтр",
//                     style: TextStyle(color: Colors.black, fontSize: 16.sp),
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           //карточки с материалами
//           SliverGrid.builder(
//             itemCount: _materials.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//             ),
//             itemBuilder: (BuildContext context, int index) => MaterialCard(
//               topic: _materials[index].topic,
//               text: _materials[index].text,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// невозможно кастомить под себя UI.

class MaterialScreen extends StatefulWidget {
  const MaterialScreen({super.key});

  @override
  State<MaterialScreen> createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  TextEditingController searchTextController = TextEditingController();
  /*
  //поиск по теме!
  void filter(String query) {
    List<MMaterial> result = [];
    if (query.isEmpty) {
      result = db;
    } else {
      result = db
          .where((material) =>
              material.topic.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      _materials = result;
    });
  }
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigatorDrawer(),
      backgroundColor: const Color(0xFFEDF0FF),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: Colors.transparent,
            pinned: true,
            floating: true,
            backgroundColor: const Color(0xFFEDF0FF),
            title: GestureDetector(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              child: Container(
                padding: EdgeInsets.all(8.sp),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.sp),
                  color: const Color(0xFFD8E2FF),
                ),
                width: 290.w,
                height: 50.h,
                child: const Icon(Icons.search),
              ),
            ),
          ),

          //кнопка фильтрации
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    color: const Color(0xFFD8E2FF),
                  ),
                  height: 32.h,
                  width: 122.w,
                  alignment: Alignment.center,
                  child: Text(
                    "Фильтр",
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  ),
                ),
              ),
            ),
          ),
          SliverGrid.builder(
            itemCount: testModelOfMaterialsFromDatabase.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) => MaterialCard(
              topic: testModelOfMaterialsFromDatabase[index].topic,
              text: testModelOfMaterialsFromDatabase[index].text,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List searchItems = [
    MMaterial(
        topic: "Интеграл Римана",
        text:
            "Интегра́л Римана — наиболее широко используемый вид определённого интеграла. Очень часто под термином «определённый интеграл» понимается именно интеграл Римана, и он изучается самым первым из всех определённых интегралов во всех курсах математического анализа.[1] Введён Бернхардом Риманом в 1854 году, и является одной из первых формализаций понятия интеграла."),
    MMaterial(
        topic: "Функция Дирихле",
        text:
            "Функция Дирихле́ — функция, принимающая единицу на рациональных значениях и ноль — на иррациональных, стандартный пример всюду разрывной функции. Введена в 1829 году немецким математиком Дирихле."),
    MMaterial(
        topic: "Сумма Римана",
        text:
            "Сумма Римана — один из механизмов определения интеграла через сумму вида Ef(x)delt(x). Используется в определении интеграла Римана. Названа в честь первооткрывателя, Бернхарда Римана.")
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List matchQuery = [];
    for (MMaterial material in searchItems) {
      if (material.topic.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(material);
      }
    }
    return GridView.builder(
      itemCount: matchQuery.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) => MaterialCard(
        topic: matchQuery[index].topic,
        text: matchQuery[index].text,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchQuery = [];
    for (MMaterial material in searchItems) {
      if (material.topic.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(material);
      }
    }
    return GridView.builder(
      itemCount: matchQuery.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) => MaterialCard(
        topic: matchQuery[index].topic,
        text: matchQuery[index].text,
      ),
    );
  }
}
