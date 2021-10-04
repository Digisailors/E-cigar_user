import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:e_cigar_user/Themes/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String value = "New York, USA";
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FadedSlideAnimation(
            Icon(Icons.location_on, color: kMainColor),
            durationInMilliseconds: 200,
            beginOffset: const Offset(0, 0),
            endOffset: const Offset(0, 0),
          ),
        ),
        title: Row(
          children: [
            Text(value, style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 15, color: Colors.grey[500])),
            IconButton(
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[500]),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Container()));
              },
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                /*.................................*/
              },
            ),
          ), //IconButton
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "What'd you like to smoke today?",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Container(
            height: 83.3,
            margin: const EdgeInsets.only(left: 10),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  var categories = Category.getDummyCategories();
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 83.3,
                      width: 83.3,
                      color: Theme.of(context).cardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FadedScaleAnimation(
                            Image.asset(
                              categories[index].image,
                              height: 37.3,
                              width: 41.3,
                            ),
                            durationInMilliseconds: 200,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            categories[index].title!,
                            style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.bold, fontSize: 10.0),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Container(
            color: Colors.white,
            child: ListView.builder(
              shrinkWrap: true,
              
              itemBuilder: (context, index){
                // return RestaurantCard();
                return Container(
                  color : Colors.white
                );
            }),
          )
        ],
      ),
    );
  }
}

class Category {
  final String image;
  final String? title;

  Category(this.image, this.title);
  static List<Category> getDummyCategories() {
    return [
      Category('images/Categories/ic_fastfood.png', 'DISPOSABLE VAPE'),
      Category('images/Categories/ic_Seafood.png', 'VAPE DEVICES'),
      Category('images/Categories/ic_chinese.png', 'STARTER KITS'),
      Category('images/Categories/ic_dessert.png', 'NIC SALTS'),
      Category('images/Categories/ic_Seafood.png', 'PODS'),
    ];
  }
}
