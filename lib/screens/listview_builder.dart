import 'package:flutter/material.dart';
import 'package:flutter_components/themes/app_theme.dart';

class ListViewBuilderScreen extends StatefulWidget {
   
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {

final List<int> imagesIds = [1,2,3,4,5,6,7,8,9,10];
final ScrollController controller = ScrollController();
bool isLoading = false;

@override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      // print( '${controller.position.pixels}, ${controller.position.maxScrollExtent} ');
      if ((controller.position.pixels + 500) >= controller.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

Future fetchData() async {
  if (isLoading) return;
  isLoading = true;
  setState(() {});

  await Future.delayed(const Duration( seconds: 3));

  addFive();

  isLoading = false;
  setState(() {});

  if ((controller.position.pixels + 100) >= controller.position.maxScrollExtent) return ;
  
  controller.animateTo(
    controller.position.pixels + 120, 
    duration: const Duration( milliseconds: 300), 
    curve: Curves.fastOutSlowIn);
}

  void addFive() {
    final lastId = imagesIds.last;
    
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );

    setState(() {});
  }

  Future<void> onrefresh() async {
    await Future.delayed(const Duration( seconds: 2 ));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFive();

  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [

            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: onrefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controller,
                itemCount: imagesIds.length,
                itemBuilder: (BuildContext context, index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/jar-loading.gif'), 
                    image: NetworkImage('https://picsum.photos/500/300?image=${ imagesIds[index] }')
                    );
                },
                ),
            ),

              if (isLoading)
                Positioned(
                    bottom: size.height/2 + 30,
                    left: (size.width * 0.5) - 30,
                    child: const _Loading()
                  ),

          ],
        ),
      )
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle
      ),
      child: const CircularProgressIndicator( color: AppTheme.primary),
    );
  }
}