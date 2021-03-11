import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foreverfit/core/widget/PureInkWell.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/resource/route.dart';

class LegsPage extends StatefulWidget {

  @override
  _LegsPage createState() => _LegsPage();
}

class _LegsPage extends State<LegsPage> {
  Widget _buildExerciseItem(Legs exercise) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePath.legsdetail, arguments: exercise);
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

class Legs {
  final String title;
  final String shortContent;
  final String image;
  final String image2;
  final String fakeContent;
  Legs({
    @required this.title,
    @required this.shortContent,
    @required this.image,
    @required this.image2,
    @required this.fakeContent,
  });
}

final detail = <Legs>[
  Legs(
    title: "Squat (High And Low Bar)",
    shortContent:
    """Interval Training is a form of exercise in which you alternate between two or more different...""",
    fakeContent: """
Why it's on the list: Squats are king because they're simply the most challenging leg movement you can do, especially when loaded appropriately. They work all the lower-body musculature (we're counting glutes), and have been shown to spike muscle-building hormone release. In fact, we even know that squatting before doing curls has been shown to significantly improve arm strength![1]

We've grouped the high bar squat and low bar squat here, although they're a bit different. Bodybuilders typically use the high bar squat, in which the bar rests atop the traps, which hits all the leg musculature fairly evenly. Powerlifters prefer the low version, in which the bar instead sits further down atop the rear delts, since this variation slightly shifts the body's center of gravity such that the glutes take up more of the workload, which immediately allows the lifter to use more weight.

Biomechanically, these two versions are completely different animals. With the high bar squat, the torso stays more vertical and increases the knee movement away from the center of gravity. This places a greater load on the quads. The low bar squat has a greater torso lean and increases the hip movement away from the center of gravity, thus placing a greater stress on the glutes.

In all variations, the depth of squat is determined by your ability to maintain a neutral spine, as well as tightness in your hip flexors and tightness in your calves. If you round your back before reaching 90 degrees in your hips, stop at that point and reverse direction. Rounding your lower back can injure the discs, especially if you're using a heavy weight!

You're not restricted to one type or the other, so feel free to use either movement in your workout, though you wouldn't typically include both on the same training day.

In your workout: Do this movement first with several light warm-up sets, pyramiding up in weight, before attempting your heaviest weight for multiple sets. Doing squats later in your workout mean your quads will be prefatigued, so you'll definitely sacrifice some weight, and good form will be more difficult to maintain.
""",
    image2:Resource.image.squat,
    image: Resource.image.squat2,
  ),
  Legs(
    title: "Front Squat",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: Some individuals find that squats build their butts well, but they really need help building their quads. If that's you, try front squats! By shifting the bar from the back to the front of the body, even just 6-8 inches, you change the relative amount of muscle loading that occurs. Front squats emphasize the quads over the glutes and hams, which means you'll sacrifice some of the load.

This movement generally requires some pretty serious upper-back and core strength to maintain a neutral spine and keep you from missing weights. Don't be surprised if adding these into your workout routine beefs up your back as well! Also, with a front squat, you naturally maintain a much more vertical position, which may decrease the risk of low-back injury.[2]

In your workout: This exercise should typically replace the squat in your workout; do it first, when your energy levels are highest. You can hold the bar in the front rack position (also referred to as a clean grip) or with arms crossed. Do multiple sets of 6-10 reps, favoring the lower end if you're looking to build strength.
""",
    image: Resource.image.frontsquat2,
    image2:Resource.image.frontsquat,
  ),
  Legs(
    title: "Olympic Lifts: Snatch And Power Clean",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: Movements like snatches and power cleans take some serious dedication and technique to master, but they can be unrivaled when you are trying to improve jumping power or squat strength. In fact, one scientific study found a nearly 18-percent greater improvement in squat 1RM after following an Olympic-based program compared to a traditional powerlifting program.

While the rep ranges aren't usually done in the golden range for hypertrophy, the large amount of muscle mass used and higher intensities may increase testosterone release.[4]

In your workout: These exercises require absolute concentration on technique and body position. Choose one or the other; this should be your very first exercise of the day. Focus on getting a good triple extension (ankles, knees, and hips), almost as if you were jumping with the bar.

Lee Boyce has an excellent article on the Olympic lifts that we highly recommend. Stick to reps of 2-3; sets can range from 3-8.
""",
    image: Resource.image.olympic2,
    image2: Resource.image.olympic,
  ),
  Legs(
    title: "Deadlift",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: Deadlifts and deadlift variations like sumo are considered whole-body exercises, specifically for the posterior chain, which includes the hamstrings and glutes. But there is quad activation in this movement as well, mainly observed in the sumo deadlift.

Because you can use a tremendous amount of weight, you'll see strength improvements in all these areas. And because of the amount of muscle mass that's engaged in the movement, this exercise can incur a nice hormonal response as well.

In your workout: This gets tricky, as deadlifts are typically trained during a program that's built around the bench press one day, squat the next, and deadlift on the last. That doesn't neatly fit with a bodybuilder's leg day.

Furthermore, the deadlift is commonly trained as part of back day. If you're training it with legs, you probably won't be able to go too heavy—keep the reps moderate, and stop short of failure.
""",
    image: Resource.image.deadlift2,
    image2: Resource.image.deadlift,
  ),
  Legs(
    title: "Bulgarian Split Squat",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: This one is deceptively difficult, partly because of balance and partly because you're training one side at a time. The Bulgarian split squat is essentially a split squat, but your rear leg is elevated, which forces the front leg to pick up more of the workload. Try it on a Smith machine if you find it difficult to balance the weight.

When done right, this movement is devastating to your quads. In fact, some EMG evidence suggests that 4 sets using your 10-rep max with Bulgarians aren't too different from back squats.[5] The same study also found similar testosterone responses between Bulgarians and back squats![5]

In your workout: You really can't use much weight on this movement, so push it toward the middle of your leg-training session. Do multiple sets of 8-12 reps per leg, and shoot for close to muscular failure on each set. If you really want to bring up the intensity, try bodyweight Bulgarians with blood flow restriction (BFR).
""",
    image: Resource.image.bulgarian2,
    image2: Resource.image.bulgarian,
  ),
  Legs(
    title: "Hack Squat",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: Machine exercises don't rank high on our list, because they control the pathway for you, meaning stabilizing muscles take a back seat. In addition, the hormone boost they generate just doesn't compare to their free-weight brethren.[6] That's one reason to do them later in your leg-training session, when your thighs are already fatigued.

However, one of the primary benefits of the hack squat is that you can manipulate foot placement. A high placement allows you to descend further, which emphasizes the glutes and hamstrings. A lower placement means the quads take up a greater percentage of the workload. A placement slightly forward of the hips may be the most comfortable.

It's also easier to spot on machine exercises and use advanced techniques like forced reps and dropsets, because you don't have to worry about collapsing under a weight.

While you can do reverse hacks on this machine, in which you're facing toward the apparatus, that version offers very little spinal protection and is not recommended unless you really know what you're doing.

In your workout: Hack squats are typically done after free-weight exercises and before single-joint leg movements. The sweet spot is probably around 3 sets of 8-12 reps. Really control the tempo on these, and avoid locking out your knees at the top to place some serious tension on those quads!
""",
    image: Resource.image.hacksquat2,
    image2: Resource.image.hacksquat,
  ),

  Legs(
    title: "Dumbbell Lunge",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: Like all the movements listed thus far, multijoint lunges require hip and knee extension, which gives you the stimulus for the thighs and glutes. They can be done standing in place, or stepping forward or backward—decide for yourself which subtle variation you prefer. You can also choose between a barbell and dumbbells.

We slightly prefer the latter because of the ease of getting into and out of the start position and the decreased likelihood of knocking something down when doing the walking version down the weight-room floor.

Lunges are best done when your legs are prefatigued, so a moderate load works particularly well for this exercise. Step forward far enough that you go straight down when you descend, rather than leaning forward. For knee health, keep the knees behind an imaginary line that comes up from your toes when stepping forward, and drive the weight back up through your midfoot.

In your workout: Do 3 sets of 8-20 reps per side, going higher the further back it is in your routine. As you reach muscle failure, jettison the dumbbells, and do a few more reps without them, like you would in a dropset.
""",
    image: Resource.image.lunge2,
    image2: Resource.image.lunge,
  ),


  Legs(
    title: "Leg Press",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: For those of you hoping leg presses could replace squats in your leg workout, the divide between the two movements can't be overstated. Because the leg press recruits less muscle mass than squats, it simply doesn't generate the same degree of testosterone release.[6] Nor is the body position here particularly functional, unless your log cabin collapses and your only way out is pushing the timber forward.

Like hack squats, however, the leg press allows for a variety of foot positions, effectively enabling you to target weaknesses such as the teardrops or outer thighs. Be careful not to lower the sled too far, though; doing so will lift your glutes up off the butt pad and cause your lower spine to curl. A rounded back puts you at risk for an injury.

In your workout: After free-weight leg exercises, do 3 sets of 8-12 reps. This exercise is especially safe when combined with intensity-boosting techniques such as rest-pause, dropsets, or forced reps.
""",
    image: Resource.image.legpress2,
    image2: Resource.image.legpress,
  ),


  Legs(
    title: "Romanian Deadlift",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: This upper hamstrings/glute exercise is unlike most others because you can really overload it. Plus, most hamstring routines focus on leg-curl movements, which center around the knee joint, but this one works from the hip joint. It's vastly underutilized in most trainees' workouts, another reason we believe it's a good fit.

The Romanian deadlift is probably one of the trickiest exercises you'll ever learn to do, and learning good form is imperative. More often than not, we see this done incorrectly, so keep practicing. You never want to allow your lower back to round.

Once you get it down, it'll help with body positioning during bent-over rows and bent-over lateral raises, too. If you have never done this movement before, beware that it's potent and could leave you hobbling for days!

In your workout: Do the Romanian deadlift as a transition between your frontal and rear thigh exercises, because the glutes are involved in each. Do 3 sets of 8-12 reps, paying particular attention to good form. Work on keeping a neutral spine and really reaching backward with your hips; too many lifters restrict their range of movement when performing this move. Some people will experience a bit of a hamstring quiver when reaching back as far as possible.
""",
    image: Resource.image.romanian2,
    image2: Resource.image.romanian,
  ),


  Legs(
    title: "Machine Squat",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: For newcomers to squatting, the machine squat offers a degree of safety while learning the movement pattern. (Goblet squats are great for beginners as well.) Machine movements also work well when done later in your workout, when your legs are fried and you need an assist with balancing the weight. If you're advanced and using this as your squat of choice, you're probably not choosing the right version of the movement. You've been warned!

In your workout: Beginners should do these first for 3-4 sets of 8-12 reps, using a weight that approaches muscle failure. If done later in your workout, you can allow the reps to drift higher to pump the thighs and glutes.
""",
    image: Resource.image.machine2,
    image2: Resource.image.machine,
  ),

];
