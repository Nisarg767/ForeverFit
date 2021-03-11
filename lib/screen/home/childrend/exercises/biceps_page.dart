import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foreverfit/core/widget/PureInkWell.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/resource/route.dart';

class BicepsPage extends StatefulWidget {

  @override
  _BicepsPage createState() => _BicepsPage();
}

class _BicepsPage extends State<BicepsPage> {
  Widget _buildExerciseItem(Biceps exercise) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePath.bicepsdetail, arguments: exercise);
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

class Biceps {
  final String title;
  final String shortContent;
  final String image;
  final String image2;
  final String fakeContent;
  Biceps({
    @required this.title,
    @required this.shortContent,
    @required this.image,
    @required this.image2,
    @required this.fakeContent,
  });
}

final detail = <Biceps>[
  Biceps(
    title: "High Cable Curl",
    shortContent:
    """Interval Training is a form of exercise in which you alternate between two or more different...""",
    fakeContent: """
How to Do It: You'll need two cable cross-over pulley machines with D-handles for this exercise. Set the height of both handles so your triceps are parallel to the ground when you hold them in a neutral grip, palms facing each other. Stand between both handles with your arms outstretched, each hand holding a handle. This is the starting position.

Curl both handles until your wrists are near your ears. Squeeze the biceps, then return to the starting position. That's one rep.

Trainer Tip: If the pulley machines are too close together, do a high single-arm biceps curl. Stand away from the machine holding one handle so there is already tension on your arm. Place the other arm on your hip. Do a curl and repeat, then switch to the other arm.
""",
    image2:Resource.image.highcabel,
    image: Resource.image.highcabel2,
  ),
  Biceps(
    title: "Low Cable Rope Curl",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: For this exercise, you only need one side of a cable pulley machine. Set the height of the pulley as low as possible. Attach a rope to the carabiner and hold each end with an overhand grip. To do this, make a "C" shape with both hands so your fingertips are facing each other, then grab an end of the rope in each hand.

Stand holding the rope in front of your hips and away from the machine so there's some tension on your arms. This is the starting position.

Keeping your elbows tucked in at your sides, curl the rope toward your chin, and squeeze your biceps at the top of the rep. Bring the rope back down in front of your hips. That's one rep.

Trainer Tip: Switch things up by using a short bar attachment instead of a rope. Or do a single-arm low cable curl by attaching one handle to the pulley machine, standing away from the machine, and curling the handle to chest level.
""",
    image: Resource.image.lowcabel2,
    image2:Resource.image.lowcabel,
  ),
  Biceps(
    title: "Chin-Up",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Grab a sturdy overhead bar with both hands using a supinated (underhand) grip at shoulder width. Keep your legs straight—don't cross your feet over each other. Start by hanging from the bar with your elbows straight. Pull yourself vertically until your chin is higher than the bar. Return to the starting position with your arms fully extended. Repeat.

Trainer Tip: If you can't do one chin-up, place a box underneath the bar and jump up to complete the rep, effectively doing a "jumping" chin-up. If you're an advanced lifter, make the chin-up harder by attaching a kettlebell or weight plate to a dip belt, or by holding a dumbbell between your feet.
""",
    image: Resource.image.chinups2,
    image2: Resource.image.chinups,
  ),
  Biceps(
    title: "Incline Dumbbell Curl",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Grab a pair of dumbbells and sit down on an incline bench set at a 45-degree angle. Lean back and keep your back and head against the bench, letting the dumbbells hang at your sides in a supinated grip. This is the starting position.

Curl both dumbbells toward your shoulders, pause at the top of the rep, then lower the weights back down to the starting position.

Trainer Tip: Start with a light weight and, once you reach the top of the rep, turn your wrist even more (increasing the supination) to contract the biceps. Then return to the start.
""",
    image: Resource.image.curl2,
    image2: Resource.image.curl,
  ),
  Biceps(
    title: "Isometric Plate Hold",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Stand with your feet shoulder-width apart and your knees slightly bent. Grab a 5-10-pound weight plate in each hand. Extend your arms out in front of your chest so one plate is on top of each hand with palms facing the ceiling—a bit like a waiter holding a plate of food. Keep your arms fully straight and locked out. Hold this position for 30 seconds.

Trainer Tip: This exercise requires core, shoulder, biceps, and forearm strength to keep the weight up. Once you can do 3 sets of 30 seconds, aim for 3 sets of 1 minute.
""",
    image: Resource.image.platehold2,
    image2: Resource.image.platehold,
  ),
  Biceps(
    title: "Dumbbell Concentration Curl",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Sit on a bench with both feet on one side. Slightly bend your back forward and separate your legs so they're wider than shoulder width. Grab a dumbbell with your right hand using a supinated grip, placing your right elbow against the inside of your right thigh. Let the dumbbell hang down so your arm is straight. This is the starting position.

Curl the dumbbell toward your chest, squeeze at the top, then release the weight back down. That's one rep. Do all prescribed reps on one side, then switch arms.

Trainer Tip: Do this exercise at least once a week to develop your biceps peak.
""",
    image: Resource.image.dumbelcurl2,
    image2: Resource.image.dumbelcurl,
  ),
  Biceps(
    title: "Dumbbell Hammer Curl",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Holding a dumbbell in each hand with a neutral grip, stand tall with your feet shoulder-width apart. Position the dumbbells at your sides with your arms hanging straight down. This is the starting position.

Flex both elbows and bring both dumbbells to the front of each shoulder. Squeeze at the top of the rep, then lower both dumbbells until your arms are straight again. That's one rep.

Trainer Tip: If you're reaching failure on your last set, alternate the arms you curl with. Keep your elbows tight against your sides so they don't them flare out.
""",
    image: Resource.image.dumbelhammer2,
    image2: Resource.image.dumbelhammer,
  ),

  Biceps(
    title: "EZ-Bar Reverse Curl",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Grab an EZ-bar using a wide overhand (pronated) grip and stand with your back straight, feet shoulder-width apart, knees slightly bent, bar resting in front of your hips. This is the starting position.

Bring the barbell to chest level then return it back to the starting position. Keep your elbows tucked in close to your sides and don't use momentum to raise the weight.

Trainer Tip: Your hands should be placed to the right of where the EZ-bar "curls" up, not directly over the bar's bump. This will be a more comfortable wrist position.
""",
    image: Resource.image.ezbar2,
    image2: Resource.image.ezbar,
  ),
  Biceps(
    title: "Seated Machine Curl",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Adjust the machine seat so your thighs are parallel to the floor when you're sitting with your back straight. Your feet should be flat on the ground with the lower part of your triceps and your elbows pressed against the arm pad. Stand up partially, grab the handles with a supinated grip, and sit back down with the handles. This is the starting position.

Pull the handles in a circular arc until they're near the front of your shoulder. Squeeze your biceps at the top, then slowly lower the handles under control back to the starting position. That's one rep.

Trainer Tip: The only body parts that should be moving are your hands, wrists, and forearms. Don't swing backward to curl the weight, or lean your shoulders forward to get further under the weight.
""",
    image: Resource.image.seatedmachine2,
    image2: Resource.image.seatedmachine,
  ),

  Biceps(
    title: "Barbell Curl",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Stand up straight holding an Olympic or short barbell with a supinated grip. Position the barbell so your arms touch the sides of your torso and your fingers touch your thighs. Stand straight with your knees slightly bent, shoulders back, and core tight. This is the starting position.

Flex your arms and raise the bar in an arc until it nears the front of your shoulders. Throughout the curl, keep your wrists stiff, your upper arms against the sides of your torso, and your back straight. Slowly lower the bar back to the starting position. That's one rep.

Trainer Tip: Use a Fat Gripz or Harbinger Big Grip workout tool to add thickness to the part of the barbell you're holding. This increased thickness will force you to use your forearms and grip strength even more than when you do a regular curl.
""",
    image: Resource.image.barbelcurl2,
    image2: Resource.image.barbelcurl,
  ),

  Biceps(
    title: "Barbell Drag Curl",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Set up the same way as you would for a barbell curl. Grip the bar comfortably. This time, instead of making an arc motion, simply drag the barbell up your shirt until it reaches your chest or until your elbows are fully bent. Squeeze your biceps, then slowly lower the weight back down to the starting position. The barbell should stay tight to your body so that the force is generated from the biceps alone.

Trainer Tip: Your elbows should form a 90-degree angle, with your triceps popping out behind your back. This exercise targets the biceps brachii or "peak," so if that specific area needs work, do this exercise once a week.
""",
    image: Resource.image.barbeldrag2,
    image2: Resource.image.barbeldrag,
  ),


  Biceps(
    title: "Suspension Trainer Curl",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Hang a suspension trainer from a sturdy overhead structure, such as a pull-up bar. Set the handles at chest level or a bit below. Grab a handle in each hand using a supinated grip. Stand away from the anchor point with your arms extended out in front of you at eye level. This is the starting position.

Brace your core and bring the handles toward your forehead. Squeeze at the top. Return the handles until your arms are straight out in front of you again. That's one rep. Your shoulders and feet should not move during the exercise.

Trainer Tip: Make this exercise harder by lengthening the straps and stepping further away from the anchor point. This position places more tension on your core and biceps.
""",
    image: Resource.image.suspension2,
    image2: Resource.image.suspension,
  ),



  Biceps(
    title: "Resistance Band Curl",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Do this curl using a resistance tube with handles or a looped strength band. Stand on top of the band with your feet shoulder-width apart, shoulders back, and spine straight.

Grab the band using a supinated grip, with your hands outside your torso and your arms extended straight down. This is the starting position.

Curl the band to chin level, then bring it back down to the starting position under control. That's one rep.

Trainer Tip: For a quick pump, stand on top of a looped resistance band, set a timer for 30 seconds, and do as many curls as possible. You can sacrifice some range of motion toward the end since the goal is to quickly flush the muscle with blood.
""",
    image: Resource.image.resband2,
    image2: Resource.image.resband,
  ),


  Biceps(
    title: "Dumbbell Preacher Curl",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
How to Do It: Grab a single dumbbell in your right hand and sit down at the preacher curl bench. Put your right arm on the pad, with your arm extended. This is the starting position.

Before starting, make sure your core is tight, your feet are flat on the ground, and your left hand is placed comfortably on your hip, thigh, or arm pad. Using the biceps of your right arm, bring the dumbbell as close to your right shoulder as possible, squeeze at the top, and slowly return to the starting position.

Start with a light weight so you can complete a full range of motion. As you advance to heavier weights, muscle fatigue may set in before you finish your reps. To complete the full number of reps, it's okay to do a few partial reps at the end, where you're not fully extending your working arm.

Trainer Tip: To spur biceps growth, use what's called negative training on this exercise. First, choose a heavier than normal weight. As you lift, use your free hand to help you curl the weight up. Once you get the weight to the top, release your free hand and, very slowly, lower the heavy weight with the curling hand. Repeat for 8-12 reps.
""",
    image: Resource.image.dumbelpeacher,
    image2: Resource.image.dumbelpeacher2,
  ),




];
