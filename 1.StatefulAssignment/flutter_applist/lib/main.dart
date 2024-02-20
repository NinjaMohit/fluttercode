import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListViewDemo(),
      ),
    );
  }
}

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State {
  List<List<String>> cricket = [
    [
      "https://cdn.britannica.com/48/252748-050-C514EFDB/Virat-Kohli-India-celebrates-50th-century-Cricket-November-15-2023.jpg",
      "https://www.mykhel.com/img/2018/11/rohitsharma-cropped_fg3ec7qrkgv1b6j0scq9o1gr.jpg",
      "https://img1.hscicdn.com/image/upload/f_auto,t_ds_w_1200,q_50/lsci/db/PICTURES/CMS/342600/342690.jpg"
    ],
    [
      "https://static.toiimg.com/thumb/msid-90271894,width-1280,height-720,resizemode-4/90271894.jpg",
      "https://imgresizer.eurosport.com/unsafe/1200x0/filters:format(jpeg)/origin-imgresizer.eurosport.com/2014/12/03/1364267-29279285-2560-1440.jpg",
      "https://images.hindustantimes.com/img/2022/09/08/1600x900/ANI-20220908347-0_1662659270899_1662659270899_1662659283445_1662659283445.jpg"
    ],
    [
      "https://cdn.zeebiz.com/sites/default/files/styles/zeebiz_850x478/public/2023/04/22/238236-sachin-ians.jpg?itok=MuCaig4g",
      "https://images.mid-day.com/images/images/2024/jan/rd_d.jpg",
      "https://img.bleacherreport.net/img/images/photos/002/674/892/hi-res-458836937-jacques-kallis-of-south-africa-drives-straight-for-a_crop_north.jpg?1387895339&w=3072&h=2048"
    ]
  ];

  List formats = [
    "T20 Highest Run-Getters",
    "ODI Highest Run-Getters",
    "Test Highest Run-Getters",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cricket Legends In Each Format"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView.separated(
        itemCount: cricket.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(
                formats[index],
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 50,
                ),
              ),
              Container(
                height: 600,
                width: 600,
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: cricket[index].length,
                  itemBuilder: (context, index1) {
                    return Container(
                      height: 200,
                      width: 200,
                      padding: const EdgeInsets.all(10),
                      child: Image.network(
                        cricket[index][index1],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const Text(
            "-----------------------------------------------------------------------------------------",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w200),
          );
        },
      ),
    );
  }
}
