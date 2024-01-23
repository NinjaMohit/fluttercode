import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Assignment5());
  }
}

class Assignment5 extends StatefulWidget {
  const Assignment5({super.key});

  @override
  State<Assignment5> createState() => _Assignment5State();
}

class _Assignment5State extends State<Assignment5> {
  bool isPost1liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Instagram home page",
            style: TextStyle(
                fontStyle: FontStyle.italic, color: Colors.black, fontSize: 30),
          ),
          backgroundColor: Colors.white,
          actions: const [
            Icon(
              Icons.favorite_rounded,
              color: Colors.red,
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.network(
                      "https://static.vecteezy.com/system/resources/thumbnails/003/171/355/small/objective-lens-icon-with-six-rainbow-colors-vector.jpg",
                      width: double.infinity),
                  color: Colors.amber,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isPost1liked = !isPost1liked;
                          });
                        },
                        icon: isPost1liked
                            ? const Icon(Icons.favorite_rounded)
                            : const Icon(Icons.favorite_outline_outlined)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.comment_outlined,
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.collections_bookmark_outlined))
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.network(
                      "https://static.vecteezy.com/system/resources/thumbnails/003/171/355/small/objective-lens-icon-with-six-rainbow-colors-vector.jpg",
                      width: double.infinity),
                  color: Colors.amber,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline_outlined)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.comment_outlined,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                        )),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.collections_bookmark_outlined))
                  ],
                )
              ],
            )
          ],
        ))


        //maintaining scroll feature by using listView
        //listview is list with scroll by default
        // body: ListView(
        //   children: [
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Container(
        //           child: Image.network(
        //               "https://static.vecteezy.com/system/resources/thumbnails/003/171/355/small/objective-lens-icon-with-six-rainbow-colors-vector.jpg",
        //               width: double.infinity),
        //           color: Colors.amber,
        //         ),
        //         Row(
        //           children: [
        //             IconButton(
        //                 onPressed: () {},
        //                 icon: const Icon(Icons.favorite_outline_outlined)),
        //             IconButton(
        //                 onPressed: () {},
        //                 icon: const Icon(
        //                   Icons.comment_outlined,
        //                 )),
        //             IconButton(
        //                 onPressed: () {},
        //                 icon: const Icon(
        //                   Icons.send,
        //                 ))
        //           ],
        //         )
        //       ],
        //     ),
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Container(
        //           child: Image.network(
        //               "https://static.vecteezy.com/system/resources/thumbnails/003/171/355/small/objective-lens-icon-with-six-rainbow-colors-vector.jpg",
        //               width: double.infinity),
        //           color: Colors.amber,
        //         ),
        //         Row(
        //           children: [
        //             IconButton(
        //                 onPressed: () {},
        //                 icon: const Icon(Icons.favorite_outline_outlined)),
        //             IconButton(
        //                 onPressed: () {},
        //                 icon: const Icon(
        //                   Icons.comment_outlined,
        //                 )),
        //             IconButton(
        //                 onPressed: () {},
        //                 icon: const Icon(
        //                   Icons.send,
        //                 ))
        //           ],
        //         )
        //       ],
        //     )
        //   ],
        // ),
        );
  }
}
