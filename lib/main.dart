import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SingleShimmer());
  }
}

class SingleShimmer extends StatelessWidget {
  const SingleShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/intro_image_001.png',
                    width: 270,
                    height: 270,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Phlox company',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36
                    ),
                  )
                ],
              ),
            ),
            Shimmer.fromColors(
              child: const Text(
                'Please drag the page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              baseColor: const Color(0xFF616161),
              highlightColor: const Color(0xFF424242),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

class ListShimmer extends StatelessWidget {
  const ListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: ListView.builder(
          itemCount: 16,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return itemList(context);
          },
        )
    );
  }

  Widget itemList(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8),
      child: Card(
          color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 160,
          child: Shimmer.fromColors(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .57,
                          color: Colors.yellow,
                          height: 20
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .5,
                          color: Colors.yellow,
                          height: 20
                        ),
                      ],
                    )
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.red
                    ),
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(width: 18),
                ],
              ),
            baseColor: const Color(0xFF616161),
            highlightColor: const Color(0xFF424242),
          ),
        )
      ),
    );
  }
}

