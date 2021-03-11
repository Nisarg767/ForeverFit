import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foreverfit/core/widget/PureInkWell.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/resource/route.dart';

class ExercisesGroupPage extends StatefulWidget {

  @override
  _ExercisesGroupPageState createState() => _ExercisesGroupPageState();
}

class _ExercisesGroupPageState extends State<ExercisesGroupPage> {
  Widget _buildExerciseItem(Exdetail exercise) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePath.exerciseDetail, arguments: exercise);
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
                  widthFactor: 0.5,
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
                      style: Resource.style.homeItemTitle2(),
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
      itemBuilder: (_, index) => _buildExerciseItem(detail[index]),
      itemCount: detail.length,

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _buildBody(),
    );
  }
}

class Exdetail {
  final String title;
  final String shortContent;
  final String image;
  final String image2;
  final String fakeContent;
  Exdetail({
    @required this.title,
    @required this.shortContent,
    @required this.image,
    @required this.image2,
    @required this.fakeContent,
  });
}

final detail = <Exdetail>[
  Exdetail(
    title: "Cable Cross-Over: Low To High",
    shortContent:
    """Interval Training is a form of exercise in which you alternate between two or more different...""",
    fakeContent: """
How to Do It: Set both sides of a cable pulley machine to the lowest setting and attach a D-handle to each side. Grab a handle in each hand with palms facing up (supinated grip) and stand between the handles with your feet shoulder-width apart. Keep your back straight, your chest up, and your arms extended down at your sides. This is the starting position.

Keeping your arms slightly bent, bring both handles up and forward until your hands are at eye level. The movement should resemble a giant "scooping" motion from your hips to the front of your face. Use a relaxed tempo and get a good contraction at the top, then slowly return both handles to the starting position

Trainer Tip: This exercise targets the upper region of the pectoralis major. Don't use heavy weight and low reps for this one. Depending on your fitness level, a 10-40-pound load in each hand for 3-4 sets of 8-12 reps should be all you need to start plating that upper chest.
""",
    image2:Resource.image.cabelcrossover,
    image: Resource.image.crossover1,
  ),
  Exdetail(
    title: "Cable Cross-Over: High To Low",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Set both sides of the cable pulley machine to the highest setting and attach a D-handle to each side. Using an overhand (pronated) grip, grab a handle in each hand and stand between them with your feet shoulder-width apart. Your arms should be extended out to your sides like a T, with your elbows slightly bent. This is the starting position.

Bring both handles down and toward your bellybutton in a downward scooping motion until they meet in front of your hips. Squeeze your pecs at the bottom and, while keeping your core tight, slowly bring both handles back to shoulder level. That's one rep.

Trainer Tip: This exercise targets the lower portion of your pectoralis major. To work your big pec from a different angle, set the pulley height at about midway and bring the handles to the center of your core using a neutral (palms facing each other) grip. This standard cable cross-over move further strengthens your chest.
""",
    image: Resource.image.crossover2,
    image2:Resource.image.cabelcrossover,
  ),
  Exdetail(
    title: "Incline Dumbbell Bench Press",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Set an incline bench at a 30-45-degree angle. Grab two dumbbells using an overhand grip, and sit with your back and head against the bench and your feet flat on the ground. Lift both dumbbells above your face with your arms extended. This is the starting position.

Lower both dumbbells until you reach the middle of your chest, then press the weights up and slightly toward each other until you reach the starting position again. That's one rep.

Trainer Tip: A 2016 study found that performing a press on a bench positioned at 30-45 degrees instead of a flat position activated the upper pecs more during 20-50 percent of maximum contraction.[1] To thicken your upper chest, pause about halfway through the rep and squeeze and hold a contraction for a second, then complete the rep.
""",
    image: Resource.image.inclinedumbel,
    image2: Resource.image.inclinedumbel2,
  ),
  Exdetail(
    title: "Dumbbell Neutral-Grip Bench Press",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Grab a dumbbell in each hand using a neutral grip (palms facing each other) and lie back on a flat bench. Hold the dumbbells close together with your arms extended up in the air over your chest. This is the starting position.

Focus on contracting your pec muscles and lower the dumbbells until they just touch your chest. Once they do, press them back to the starting position. That's one rep.

Trainer Tip: Keep the weights close to each other throughout the exercise's entire range of motion. Visualize pushing the weights upwards using your pecs and not your arms.
""",
    image: Resource.image.neutralgrip1,
    image2: Resource.image.neutralgrip,
  ),
  Exdetail(
    title: "Barbell Bench Press",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Lie back in a barbell bench press station with your feet flat on the ground and your head against the bench. Your eyes should be directly below the racked bar. Grab the bar with an overhand grip slightly wider than shoulder-width. Keeping your arms fully extended, unrack the bar so that it's directly over your chest. This is the starting position.

Keeping your elbows in, lower the bar to touch your chest at nipple level, then push it up explosively until your arms are straight again. As you perform the lift, make sure to engage your core and avoid excessively arching your lower back or moving your chest. That's one rep.

Trainer Tip: Always use a spotter when performing a barbell bench press with heavy weights. The spotter can be a fellow gym member, but it's best if they are a certified personal trainer or a knowledgeable training buddy.
""",
    image: Resource.image.barbell,
    image2: Resource.image.barbell2,
  ),
  Exdetail(
    title: "Resistance Band Pull-Apart",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Stand with your feet shoulder-width apart and your head facing forward. Hold a resistance band in front of you using an overhand grip, with your arms fully extended. It's fine if there is extra band extending beyond each hand. This is the starting position.

Slowly spread your arms as if you're trying to pull the band apart. As you do this, focus on bringing your shoulder blades together. Keep spreading your arms until the band touches your chest. Slowly bring your arms back together in front of you at eye level. Maintain control of the stretch throughout each repetition.

Trainer Tip: Do 3 sets of 10-15 reps as a warm-up or finisher. You can also do this move between chest exercises or sets to keep your pump going strong.
""",
    image: Resource.image.bandpull2,
    image2: Resource.image.bandpull,
  ),
  Exdetail(
    title: "Plate Press-Out",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Grab a plate weighing 10-45 pounds and stand straight with your feet hip-width apart. Holding the plate with both hands, extend your arms out straight in front of your chest. This is the starting position.

Keeping your abs tight and your back and arms straight, squeeze your shoulder blades together to bring the plate closer to your chest. Once you're brought the plate in as close as you can, press the weight straight back out again. That's one rep.

Trainer Tip: Do 10-15 reps. To increase difficulty, do these horizontal reps first, then press the plate up above your head instead of toward your chest. Do 10-15 of these overhead reps. Combining the plate press and overhead press is a great way to harden your upper body to work under fatigue.
""",
    image: Resource.image.platepress,
    image2: Resource.image.platepress2,
  ),

  Exdetail(
    title: "Push-Up",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Place your hands shoulder-width apart on the floor. Extend your arms and legs so that only the palms of your hands and the tips of your toes touch the floor. Your feet should be hip-width apart. This is the starting position.

Keeping your toes and hands in contact with the ground, lower your body toward the floor, until your elbows form a 90-degree angle and your upper arms are parallel to the ground. With your elbows tucked in toward your sides, push against the floor to return to the starting position. As you move up and down, squeeze your abs and glutes to support your lower back.

Trainer Tip: To increase difficulty, do a rotational push-up. As you return to the starting position, raise one arm off the ground and lift it above you as you turn your torso. In the end position, your body should resemble a T. Hold that position for a moment, then bring your raised hand back to ground. Do another push-up and rotate to the other side.
""",
    image: Resource.image.pushup3,
    image2: Resource.image.pushup4,
  ),
  Exdetail(
    title: "Dip",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Stand between two parallel bars. Place one hand on each bar and raise yourself off the floor until you are supporting your full weight on your extended arms. Lean forward slightly so your chest is at a downward angle. This is the starting position.

Bend your arms to lower yourself down, while maintaining your forward lean. You should get a good chest and triceps stretch as you do this. Return to the starting position by pushing against the bars. That's one rep.

Trainer Tip: By keeping your abs tight throughout this motion, you are exercising your pecs to hold your body in place. To increase difficulty, wear a dip belt or hold a dumbbell between your ankles.
""",
    image: Resource.image.dips2,
    image2: Resource.image.dips,
  ),


  Exdetail(
    title: "Sliding Disc Push-Up",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: While kneeling on the floor with your arms about shoulder-width apart, place each hand on a sliding disc such as a Valslide, a weight plate, or even a paper plate. Slowly raise yourself into push-up position without letting your hands slide out from underneath you. This is the starting position.

Put pressure on each Valslide to spread your arms apart as you lower your body toward the floor. Once you've reached the bottom of the push-up, use your chest muscles to pull the sliders back together again and return to the starting position. That's one rep.

Trainer Tip: For a variation of this exercise, try sliding one hand up in front of you instead of out to the side as you lower yourself down to the floor. Return that hand to the push-up position and repeat with the other arm. Both of these push-up variations force your body to adapt to instability, which improves your balance, core strength, and upper-body endurance.
""",
    image: Resource.image.slidingdisc2,
    image2: Resource.image.slidingdisc,
  ),

  Exdetail(
    title: "Hammer Strength Chest Press",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Sit in the chest press machine with your thighs parallel to the floor and your feet flat on the ground. If necessary, adjust the seat so that the hand grips are at about nipple height and your arms are parallel to the floor. Choose a relatively light weight at first. This is the starting position.

Allow the handles to move slowly back toward your body as you keep your head, back, and shoulders in contact with the bench. When your arms are as far back as they can comfortably go, push them forward until they are fully extended in front of you. That's one rep.

Trainer Tip: Don't use this machine for heavy weight and fast reps. Go too heavy, too fast and at the bottom of the range of motion you'll get a bounce that brings momentum into play and reduces the muscle-building benefits of the exercise.
""",
    image: Resource.image.hammer2,
    image2: Resource.image.hammer,
  ),

  Exdetail(
    title: "Seated Pec-Deck Machine",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Sit at a pec-deck machine with your arms bent at 90 degrees, your forearms resting against the vertical pads, and your hands holding the handles with an overhand grip. This is the starting position.

Keep your elbows in the 90-degree position and pull them back slowly until you feel a chest stretch. At the end of your range of motion, squeeze your forearms, elbows, and chest to return your arms to the starting position. That's one rep.

Trainer Tip: Your hands should play minimal or no role in this exercise. In fact, you don't even need to hold on to the handles. Keep your forearms against the vertical pads to ensure your chest is completely isolated.
""",
    image: Resource.image.pecdeck2,
    image2: Resource.image.pecdeck,
  ),

  Exdetail(
    title: "Dumbbell Pull-Over",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Put the thumbs and fingers of both your hands together to create a diamond-shaped space between them. Place the handle of a dumbbell in that space, overlapping your hands to lock the dumbbell into place. Lie back on a bench with the secured dumbbell above your face and your arms extended. This is the starting position.

Keeping your elbows locked in place, slowly lower the dumbbell past your head and toward the floor. As you return the weight to the starting position, focus on contracting your pecs instead of relying on arm strength. Once the weight is at the starting position, flex your pecs. That's one rep.

Trainer Tip: The key to this exercise is to use a slow, controlled tempo, and to focus on contracting your pectoral muscles as you raise the dumbbell back to the starting position.
""",
    image: Resource.image.pullover2,
    image2: Resource.image.pullover,
  ),
];
