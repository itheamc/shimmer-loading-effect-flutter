import 'package:flutter/material.dart';
import 'package:shimmer_effect/shimmer.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _stopLoading();
    });
  }

  Future<void> _stopLoading() async {
    await Future.delayed(const Duration(milliseconds: 3500), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        children: [
          Shimmer(
            loading: _loading,
            child: ListView.builder(
              itemCount: Colors.accents.length,
              physics: _loading ? const NeverScrollableScrollPhysics() : null,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: double.maxFinite,
                    height: 75.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.accents[index]
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              maxChildSize: 0.8,
              minChildSize: 0.25,
              initialChildSize: 0.25,
              snap: true,
              builder: (_, controller) => Material(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20.0)
                ),
                elevation: 20.0,
                shadowColor: Colors.grey,
                child: Shimmer(
                  loading: _loading,
                  child: SingleChildScrollView(
                    controller: controller,
                    physics:
                        _loading ? const NeverScrollableScrollPhysics() : null,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            "20",
                            style: TextStyle(
                              fontSize: 48,
                              color: Colors.green,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: 175.0,
                            height: 175.0,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: 175.0,
                            height: 175.0,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
