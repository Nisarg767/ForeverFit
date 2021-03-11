import 'package:flutter/material.dart';
import 'package:foreverfit/core/widget/PureInkWell.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/resource/route.dart';

class HealthTipPage extends StatefulWidget {

  @override
  _HealthTipPage createState() => _HealthTipPage();
}

class _HealthTipPage extends State<HealthTipPage> {
  Widget _buildHealthItem(HealthTip exercise) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePath.healthTipDetail, arguments: exercise);
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

class HealthTip {
  final String title;
  final String shortContent;
  final String image;
  final String fakeContent;
  HealthTip({
    @required this.title,
    @required this.shortContent,
    @required this.image,
    @required this.fakeContent,
  });
}

final healTips = <HealthTip>[
  HealthTip(
    title: "Prepare Your Own Food.",
    shortContent:
        """Interval Training is a form of exercise in which you alternate between two or more different...""",
    fakeContent: """
The most important thing you can do for yourself is to prepare your food. The old saying "By failing to prepare, you prepare to fail" couldn't be more true when it comes to nutrition. Nutrition is single-handedly the most important thing when it comes to reaching any type of fitness goal, whether it be muscle gain, fat loss, or just being healthy.

Do this: Set aside a couple hours twice a week, and prepare your meals for the next couple of days. By doing so, it will be much harder to make excuses and fall off the wagon on your nutrition plan.
""",
    image: Resource.image.healthtip,
  ),
  HealthTip(
    title: "Drink Enough Water",
    shortContent:
        """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Most people do not drink enough water—and they are doing their body a great disservice. Being properly hydrated is critical to just about every function in your body, from muscular contraction, to digestion, to allowing your kidneys to filter out metabolic byproducts from your body. Not only can drinking enough water optimize your body's everyday functions, it can also play a role in keeping your appetite and portions in check. That's because water takes up space in your stomach, which promotes fullness.

A study published in the Journal of Obesity split subjects into two groups and gave each subject a face-to-face nutrition and weight-management consultation.[1] One group, however, was instructed to drink 500 mL (roughly 8 ounces) of water 30 minutes before each main meal (breakfast, lunch, and dinner). This group lost an average of 3 pounds more over the next 12 weeks.

Do this: If you're wondering how much water you should be drinking, I typically recommend multiplying your body weight by 0.8. That's the minimum number of ounces you should consume daily. If you're dieting, consider drinking 8 ounces of water before meals to help curb your appetite.
""",
    image: Resource.image.healthtip2,
  ),
  HealthTip(
    title: "Be Consistent",
    shortContent:
        """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Great physiques are not built in weeks or even months. Achieving anything worth mentioning means doing what you are supposed to be doing in terms of nutrition, training, supplementation, and recovery (sleep!) day in and day out. Everyone is going to have an off day or a missed meal here or there, but what is important is that you get back on track and make sure your slip-ups are as few and far between as humanly possible.

Do this: This is where keeping a journal can help. It's easy to convince yourself that your slip-ups are an exception, but if you look at everything written down or entered in black and white, you may find that your slip-ups are the rule rather than the exception.
""",
    image: Resource.image.healthtip3,
  ),

  HealthTip(
    title: "Supplement Smartly",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
While nutrition is king when it comes to making progress and getting your body to change in the way you want, supplementing smartly can enhance performance and enhance recovery. This is a recipe for success if you follow rule 3: Be consistent.

Supplements that I believe should be in every gym goer's bag include whey protein (great any time of day, especially around training) and BCAAs (taken before or during training). If you are trying to gain size or strength, I am also a firm believer in supplementing with creatine. It has been proven safe and effective when trying to maximize strength, power, and muscle size.

Do this: Take your supplementation to the next level by adding a quality pre-workout to your stack. Pre-workouts can give you an energy boost while you train and supply several performance-enhancing ingredients such as caffeine, beta-alanine, citrulline, and taurine. I take the one with my family name on it: Labrada's BCAA Power and SuperCharge! Pre Workout. It's one of a number of good pre-workouts on the market.
""",
    image: Resource.image.healthtip4,
  ),

  HealthTip(
    title: "Sleep Enough",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
One of the most overlooked aspects of maintaining a healthy body and making progress in the gym is making sure your body gets enough sleep. While sleeping, your body is able to recover much more effectively than if you were messing around on Facebook all night. Remember, you're not actually growing during your workout—you're growing the other 22-23 hours of the day, but mainly during sleep!

Do this: Aim to get 7-9 hours of sleep per night. If you're struggling to get even a fraction of that, reassess your priorities and seek out time to nap during the day, or commit to going to bed one hour earlier each night until it becomes a habit.
""",
    image: Resource.image.healthtip5,
  ),

  HealthTip(
    title: "Help Your Body Recover",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
When you're performing strenuous physical activity, such as lifting in the gym, you are causing damage on a microscopic level to your body's skeletal muscle. You're probably familiar with this damage, as it manifests itself in the form of muscle soreness. Often this soreness doesn't set in for 24-48 hours, but when it hits, you'll know it.

Do this: While your body will recover on its own without any help, a variety of therapies can aid this recovery. Massage, foam rolling, stretching, and Epsom-salt baths are all great recovery tools.
""",
    image: Resource.image.healthtip6,
  ),

  HealthTip(
    title: "Set, Track, And Reach Goals",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
When setting goals, make sure you set both the micro and macro kind. It can be discouraging to have a long-term goal that will take months or years for you to achieve, and nothing to shoot for in the interim, which is why micro goals are important. For example, if you want to lose 20 pounds, set that as your long-term goal, and then set your micro goal to lose 4-5 pounds per month. That way, you can enjoy tastes of success en route to your macro goal.

These small successes will keep you motivated and wanting to work, instead of discouraging you.

Do this: Apply the same system to achieving new PRs in the gym, new levels of consistency with your nutrition, and anything else you want to strive for.
""",
    image: Resource.image.healthtip7,
  ),
];
