import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foreverfit/core/widget/PureInkWell.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/resource/route.dart';
class ChallengesPage extends StatefulWidget {

  @override
  _ChallengesPage createState() => _ChallengesPage();
}

class _ChallengesPage extends State<ChallengesPage> {
  Widget _buildExerciseItem(Challenge exercise) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePath.challengedetail, arguments: exercise);
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
      itemBuilder: (_, index) => _buildExerciseItem(healTips[index]),
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

class Challenge {
  final String title;
  final String shortContent;
  final String image;
  final String image2;
  final String fakeContent;
  Challenge({
    @required this.title,
    @required this.shortContent,
    @required this.image,
    @required this.image2,
    @required this.fakeContent,
  });
}

final healTips = <Challenge>[
  Challenge(
    title: "The 21-Day Perfect Push-Up Challenge.",
    shortContent:
    """Interval Training is a form of exercise in which you alternate between two or more different...""",
    fakeContent: """
Week 1: "Easy" Push-Up Progression Week
Example: Use higher surface or thick band

Day 1: 4/3/3/2=12
Day 2: 5/4/3/2=14
Day 3: 5/5/4/2=16
Day 4: Rest
Day 5: 6/5/5/3=19
Day 6: 7/6/5/3=21
Day 7: Rest
""",

    image: Resource.image.pushup2,
    image2: Resource.image.pushup,
  ),
  Challenge(
    title: "240-Rep Bodyweight Challenge",
    shortContent:
    """Got 10-15 minutes? Then I've got just the way you should spend it.""",
    fakeContent:"""
Got 10-15 minutes? Then I've got just the way you should spend it.

The 240 challenge is a high-rep routine meant to build strength while giving you a cardiovascular workout. 

It trains every muscle in your body and allows you to check and test your overall fitness level. The best part is that you can take as long as you need to finish the challenge, and you'll have a number to try to beat moving forward.

The workout alternates upper- and lower-body movements, spreading the fatigue and getting your heart and lungs seriously pumping. But as you become tired, it's crucial that you resist the urge to get sloppy. This isn't "30 reps at all costs." 

It's 30 clean, strict reps. If you need to stop and rest in the middle of a movement, by all means do it. Then, when you're ready, jump back in and finish your reps.

You can do this workout every other day, either before or after your other work, or as its own workout whenever you want to test yourself or get some solid full-body work in.
""",
    image: Resource.image.scott2,
    image2: Resource.image.scott,
  ),
  Challenge(
    title: "7 Ways To Turn A Stale Workout Into A Fresh Challenge.",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Here you are again, at the gym. You’ve done this a thousand times, maybe tens of thousands. And let’s be honest: It can get very repetitive after a while. Sure, you change your split from time to time, you shake up the exercises, you do your best to get fired up with motivation. But you’re only human.

What if there were an easy way to turn your workouts around, make them fun again, and, more importantly, make them productive again? Here are seven "theme workouts" that can help you do just that.

Beat The Clock

If you’re like most people, you probably take about an hour to train most body parts. If you're doing legs and back, you might go 90 minutes. Today, get rid of all the flab between sets. Instead of resting, talking, strolling around, and generally stalling, get right back to work.

If you usually take an hour to do your chest, shoulders, or arms, get it done in 30. If your legs and back take 90, do it in 60. No, you won't be able to handle your usual weights on everything. But you will get one of the best pumps ever, and burn some extra body fat in the process!

Rep-Total Challenges

No matter what the exercise, you can set an ambitious number of reps to aim for. The challenge here is to choose a number that's outside of your comfort zone, and then take as many sets as you need to get there.

Let’s say your goal is 50 reps of chins. Your first couple of sets might be 10-12 reps. As you get tired, that may drop to 6-8 reps. By the end, it takes all your energy to grind out a bunch of 2-3-rep sets to reach 50. That's fine!

Another plan: Aim for 50 reps of the squat or bench press using 60 percent of your 1RM. Take as many sets as you need to hit your target number. 

With all of these sets, stop a rep or two before failure, and feel free to use bands or assistive machines or use less weight. Limit your rest periods to one minute at the most. And just to be safe, have a bucket handy.

10 Sets Of 10

In the old days, "10 sets of 10" was a staple among bodybuilders. Let's bring it back.

Choose one exercise for one body part—maybe bench press, squat, barbell row, or military press. Pick a weight that isn’t exactly challenging for 10 reps, but that isn't too light, either. Use this weight for all 10 sets.

Set An Unexpected PR

When we think about setting a new personal record, most of us immediately focus on one of the three powerlifts: the bench press, squat, or deadlift. Why limit yourself? What about going for a new PR in the barbell curl, leg curl, or even a machine like the pec deck?

No, this isn't an everyday thing, and no, it doesn't have to be a true 1RM. A solid 2-3 reps with a surprising weight is probably good enough. Make it your top priority by doing it first when you’re fresh and ready to put out some real effort. Just be sure to warm up properly, and don’t sacrifice good form just to get a new record.

Use Nothing But Barbells

Have you ever tried to organize a whole workout around one piece of equipment? It takes a bit of planning, but you can do it. And if you're used to a higher-volume approach with multiple exercises, dial back the weight and add reps aplenty.

Here are a couple suggestions for an all-barbell (no other equipment) workout, but see if you can come up with your own:

Chest:- Flat press, incline press, decline press
Back:- Barbell row, deadlift, shrug
Shoulders:- Military press, upright row
Legs:- Squats, front squats, stiff-leg deadlifts, walking lunges
Biceps:- Barbell curl, preacher curl, reverse curl
Triceps:- Lying extensions, seated extensions, close-grip bench press

Use Compound Sets For Everything

Under normal circumstances, you would only compound sets for a couple movements per workout, max. Unlike traditional supersets, which hit contrasting or noncompeting muscle groups, compound sets hit the same muscle groups with both movements. They push intensity through the roof. But sometimes, that's exactly what's called for.

Try these compound sets to boost your workout intensity and shock a body part, or mix and match to see what works for you.

Chest:-
Bench press, push-up
Machine fly, machine bench press
Incline dumbbell fly, incline dumbbell press
Incline barbell press, cable cross-over

Legs:-
Leg extension, leg press
Front squat, back squat
Lying leg curl, stiff-leg deadlift
Hack squat, walking lunge

Back:-
Chin-up, lat pull-down
Barbell row, machine row
Pull-over, seated cable row
Lat pull-down, T-bar row
Deadlift, machine row
""",
    image: Resource.image.ways2,
    image2: Resource.image.ways,
  ),
  Challenge(
    title: "Give Your Bis And Tris A New Challenge.",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",

    fakeContent: """
When you pick up a pair of dumbbells to perform some curls, where do you hold them? Most likely in the middle. Or, if you're the type who has been reading bodybuilding and strength-training articles for the last few decades, you might hold them an inch or two from the middle, so your thumb is pressed up against the weight.

Why? Holding a dumbbell off-center, often referred to as an "offset" grip, will tip the balance of the weight toward one side and influence muscle involvement on various movements. For instance, using an offset grip, where the thumb is pressed against the inside of the weight, increases the involvement of the short head of the biceps. Grab it on the other side, with the pinky up against the weight, and you can make triceps extension movements more difficult at lockout.

If this is news to you, great! Try it once, and you'll be amazed at how different it feels. But you can take the same idea further, both with your lifting technique and with some strategic accesories.

Offset-Weight Curl And Extension:-

The reason the offset grip works is because it makes one side of the dumbbell slightly heavier than the other. You can further amplify this effect by actually adding weight to one side of the dumbbell.

For curls: Grip the dumbbell with your thumb pressed against the inside of the weight, and add extra weight to the opposite (pinky) side of the dumbbell.

For skull-crushers or extensions: Grip the dumbbell with your pinky pressed against the inside of the weight, and add extra weight to the opposite (thumb) side of the dumbbell.

Twisting Offset-Grip Dumbbell Curl:-

You can emphasize or amplify the offset technique by adding a simple twist to your curls. This works for both the standard offset curl, and the variation with added weight on one side.

First, I recommend performing these seated. Use the offset grip described above, but start your curl in a neutral (hammer-style) position with the palms facing each other at the bottom of the movement. Curl the weight up, and as the dumbbells clear your thighs, twist (supinate) your wrists so that your palms are facing your shoulders at the top of the movement. Then, reverse the motion back to the beginning position.

This elbow flexion exercise will increase the involvement of the muscles that supinate your forearm, which include not only the biceps, but also the brachioradialis and supinator muscles, which are largely in the forearms.

Twisting Offset-Grip Dumbbell Triceps Extension:-

Adding a twist to the triceps movement won't do a lot for your triceps, but it'll boost involvement of muscles in the forearm, such as the forearm pronator muscles (pronator teres and pronator quadratus), and the anconeus, a small muscle behind the elbow. Make no mistake, though: Your triceps will still be seriously working at the top of the movement!

This move starts as a typical lying dumbbell triceps extension, but instead of keeping your hands in a neutral position throughout the entire movement, twist (pronate) your forearms as you raise the weight, so that you end in a position similar to the top of a dumbbell bench press. Then, reverse the motion back down to the start position.

As with the curls, it's crucial to offset the grip on the correct side, and to make sure that any added weight is on the correct side as well.
""",
    image: Resource.image.bistris2,
    image2: Resource.image.bistris,
  ),
  Challenge(
    title:"3 Dumbbell Moves You Have To Try.",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",

    fakeContent: """ 
1) Batwing Row:-
I call the first exercise a batwing row. If your gym doesn't have an incline bench, no sweat; make your own by stacking a couple of plates on the floor to prop up one end of a flat bench.

This move will strengthen your upper back and improve your posture.

Take the position you would for a normal incline row, making sure you have proper posture. Pull your shoulders back. Feel the tension between your shoulder blades.

Pull both dumbbells up simultaneously and squeeze.

Drop one dumbbell down to your side, row, and return to the starting position. Then switch sides.

Continue rowing in an alternating fashion, maintaining tension in your upper back.

2) Half-Kneeling Curl And Press:-
This total-body movement calls for tension in your glutes, a stabilized trunk, and a strong overhead press. This one exercise amounts to a killer ab workout and some biceps and shoulder work.

In a half-kneeling stance, rest your left knee on a pad or folded towel. Before you even touch the weight, make sure your torso is vertical and your right heel is under your right knee.

Keep the tension in your left glute. This will stabilize your hips and force you to engage your abs to keep your trunk steady.

Facing forward with your hips squared, take a dumbbell in your left hand.

Curl and press the weight overhead. Focus on keeping glute and trunk tension so that your hips don't waver and your body doesn't shake.
Switch knees and repeat.

3) Deficit Reverse Lunge:-
Target your hamstrings while front loading for that extra ab challenge with the deficit reverse lunge.

Step onto a surface that gives you 3-5 inches of elevation. A small box, a bumper plate, or a small step all work well.

Front load the dumbbells, bringing them in front of you at roughly shoulder height. Keep your elbows tucked. This added weight will challenge you to keep your body straight and abs engaged.

Step back into a reverse lunge with one foot off the weight. Then, press straight back up to the standing position.

Do as much work as you can on that front leg with your front foot driving up before switching legs.
""",
    image: Resource.image.dumbel2,
    image2: Resource.image.dumbel,
  )
];
