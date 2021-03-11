import 'package:flutter/material.dart';
import 'package:foreverfit/core/widget/PureInkWell.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/resource/route.dart';

class Beginner extends StatefulWidget {

  @override
  _Beginner createState() => _Beginner();
}

class _Beginner extends State<Beginner> {
  Widget _buildHealthItem(Diet exercise) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePath.dietdetail, arguments: exercise);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          child: Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.fill,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 100, minHeight: 100), // here
                  child: Image.asset(
                    exercise.image,
                  ),
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: FractionallySizedBox(
                  widthFactor: 0.85,
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: Resource.color.mainColorLight,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(32))),
                    child: Text(
                      exercise.title,
                      textAlign: TextAlign.center,
                      style: Resource.style.homeItemTitle7(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      itemBuilder: (_, index) => _buildHealthItem(healTips[index]),
      itemCount: healTips.length,
      padding: EdgeInsets.all(16),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: _buildBody(),
    );
  }
}

class Diet {
  final String title;
  final String shortContent;
  final String image;
  final String fakeContent;
  Diet({
    @required this.title,
    @required this.shortContent,
    @required this.image,
    @required this.fakeContent,
  });
}

final healTips = <Diet>[
  Diet(
    title: "Weight Gain",
    shortContent:
    """Interval Training is a form of exercise in which you alternate between two or more different...""",
    fakeContent: """
Breakfast : 
  
  -> Mon-Tue : 1 Handful of Desi Chana + 1 Glass Milk
  
  -> Wed-Thu : 1 Handful Of Steeped Mag + 2 Date Palm with Ghee + 4 Almond + 4 Cashews 
  
  -> Fri-Sat-Sun : 1 Handful Of Soybean + 1 Glass Milk + 2 Bananas

Lunch & Dinner : 

  -> 1 bowl salad + yogurt(Alternative) 
  
  -> 3-4 Chapatis + 1.5 bowls of vegetables / beans 
  
  -> 1 Bowl Rice + 1 Bowl Lentils 
  
Snacks : 

  -> Apple/Banana/Any Fruit/Dry Fruit
  
  -> 1 Cheese Bubble With Wheat Bread
""",
    image: Resource.image.weightgain,
  ),
  Diet(
    title: "Weight Loss",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
After Wake-Up : 1 Glass of Warm Water

Breakfast : 
  
  -> Mon-Tue : 1 Handful of Desi Chana + 1 Banana 
  
  -> Wed-Thu : Moong Sprouts + Dry Fruit (4 Almonds + 4 Cashews + 4 Pistachios + 1 Walnut) 
  
  -> Fri-Sat-Sun : Oats or 1 Handful of Peanuts with Chana or Peanut Salad 

Lunch & Dinner : 

  -> 2-3 Chapatis + Regular Homemade Sabzi + Vegetable Salad 
  
  -> 2-3 Chapatis + Homemade Dal or Homemade Sprouts + Vegetable Salad 
  
  -> 1 Small Bowl Rice + Homemade Dal +Vegetable Salad 
  
Snacks : 

  -> Boiled Eggs(if Non Vegetarian) or 1 Cheese Cube
  
  -> 1 N Any Seasonal Fruit 
  
  -> 1 Handful of Beans(Chana or Peanuts or Roasted Moong) 
  
Before Sleep : 

  -> Have 2 Glasses of Regular Water 

Important Instructions : 
  
  -> Try to avoid Junk Food,Oily and Processed Foods. 
  
  -> Minimize your Sugar Intake,Try to avoid Sugary foods if possible. 
  
  -> Drink 3-4 L Water daily. 
  
  -> Whenever feels more hungry,have a cup of Black Coffee. 
  
  -> Never Give Up.
""",

    image: Resource.image.weightloss,
  ),

];
