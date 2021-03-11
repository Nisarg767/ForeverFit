import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foreverfit/core/widget/PureInkWell.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/resource/route.dart';

class ShoulderPage extends StatefulWidget {

  @override
  _ShoulderPage createState() => _ShoulderPage();
}

class _ShoulderPage extends State<ShoulderPage> {
  Widget _buildExerciseItem(Shoulder exercise) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePath.shoulderdetail, arguments: exercise);
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

class Shoulder {
  final String title;
  final String shortContent;
  final String image;
  final String image2;
  final String fakeContent;
  Shoulder({
    @required this.title,
    @required this.shortContent,
    @required this.image,
    @required this.image2,
    @required this.fakeContent,
  });
}

final detail = <Shoulder>[
  Shoulder(
    title: "Barbell Push Press",
    shortContent:
    """Interval Training is a form of exercise in which you alternate between two or more different...""",
    fakeContent: """
Why it made the list: This press allows you to load up the most weight (or do more reps) above all other overhead pressing moves. It's considered a bit more of a whole-body movement for developing explosiveness, so you lose some of the isolation effect if you do this same movement seated.

With the barbell atop your upper chest, bend your knees slightly and explode upward on the balls of your feet while pressing the bar overhead. Your lower body, core, delts, triceps, and upper pecs are all involved.

This is considered more of a strength/power movement than a bodybuilding exercise, but building more strength here can help you load up more plates in any number of other lifts. Moreover, doing movements that engage a great deal of muscle mass boost muscle-building hormones better than movements that don't.

In your workout: Because this variation uses so many muscle groups, don't do it every workout. When you do use it, perform it first in your workout, after warming up well.

For bodybuilders, this isn't the exercise to do every shoulder training day, but it's a great choice for increasing strength and power during an offseason phase.
""",
    image2:Resource.image.barbellpush,
    image: Resource.image.barbellpush2,
  ),
  Shoulder(
    title: "Standing Military Press (Barbell Or Dumbbell)",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it made the list: This is essentially a push press without the extra bit of body English generated through your legs. That makes it a better isolation movement, but this movement still isn't considered an isolation exercise. In fact, it's a highly demanding multijoint overhead press that, because it's not seated, still allows for a bit of momentum as well as increased muscle activation compared to the seated version.

Keep the bar just off your upper chest, and press straight overhead, stopping just short of lockout. Maintain a slight bend in your knees to absorb subtle changes in your center of gravity and relieve some of the stress on your lower back. We included both the barbell and dumbbell here. Research has shown that dumbbells elicit a greater degree of EMG activation, but this usually comes at the expense of the amount of weight lifted.

Be sure to maintain a neutral hip position. Tipping your hips forward or sticking your butt back can wreak havoc with your lumbar spine. If you spend all of your time injured, you'll miss out on the gains!

In your workout: This is your multijoint overhead press in your workout, so it substitutes for any of the other presses on this list. After warming up well, choose a challenging weight, but not one so heavy that you break form. If your triceps are lagging, grab a pair of dumbbells rather than a barbell; they require less triceps activation.
""",
    image: Resource.image.militarypress2,
    image2:Resource.image.militarypress,
  ),
  Shoulder(
    title: "Dumbbell Incline Row",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it made the list: What the heck is a multijoint rowing exercise doing in an article about shoulder exercises? Remember, rowing movements don't just work the "back"; they also involve the rear delts to a significant degree as well.

We didn't realize just how much until we saw research from a 2014 study out of the University of Wisconsin (La Crosse) that compared mostly shoulder exercises to see which had the greatest EMG activation on each of the three delt heads.[2] Of note, this particular row scored just as high as a dumbbell lateral raise for middle-delt activation (and significantly better than dumbbell shoulder presses, cable lateral raises, and even barbell upright rows). For rear delts, that same row scored the same as the seated rear-delt raise in terms of activation but significantly higher than the other eight exercises, though none of them would be considered rear-delt moves.

Because the row appears to hit both those heads particularly well, it appears it would be a good addition to your shoulder workout. Because other types of rows weren't considered in the study, it's impossible to say whether they'd be equally as good, but there are surely a number of variations to this movement, including supported T-bar rows and standing (done bent-over) T-bar rows. To best mimic the movement done in the study, which used dumbbells, use a wide grip on the machine.

In your workout: If you pair back and shoulders on the same training day, this would be a smart exercise to transition between the two body parts. If you include this move with your shoulder workout, do your overhead presses first. Try this before adding single-joint movements.
""",
    image: Resource.image.dumbelincline2,
    image2: Resource.image.dumbelincline,
  ),
  Shoulder(
    title: "Seated Overhead Dumbbell Press",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it made the list: Switching out the barbell for dumbbells on overhead presses works each side independently, making the move more challenging and requiring more input from stabilizer muscles. Moreover, the range of motion is a bit longer as you press the weights together overhead. (We recommend you don't allow them to touch.)

Going from standing to a seated position further removes your lower body from the lift. Because your upper arms go straight out to your sides during the motion, the middle delts are heavily recruited, with far less stress on the anterior delts than when a barbell is in front of your head.

In your workout: Do it first in your shoulder session. You'll generally be able to go much heavier on the seated dumbbell press than the standing alternative because of the increased base of support. When going heavy, we recommend a seat back that allows you to press your spine into it for safety. Also, use a spotter to help you get the weights into the starting position and give you a spot (or even a forced rep or two) as you push toward failure.

Raising the weights into position can be harder than it looks. Beginners, try this: When prepping to hoist the dumbbells overhead, grab a weight in each hand, sit down, place the dumbbells on your thighs toward your knees, and quickly lift one knee toward your shoulder to hoist the weight. Repeat using the opposite knee.
""",
    image: Resource.image.seatedoverhead2,
    image2: Resource.image.seatedoverhead,
  ),
  Shoulder(
    title: "Seated Overhead Barbell Press",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it made the list: Sitting not only makes it hard to use momentum, it also creates a nice base from which to push the weight. A barbell recruits a greater degree of triceps musculature than dumbbells can. If you've got sore shoulders, stick to keeping the bar in front of you.

When you lower the barbell to the front, notice how your upper arms no longer move directly out to your sides, an indication that the anterior delts are now picking up some of the workload. In fact, this is evident in muscle activation patterns, which demonstrate significantly greater anterior delt activation with a barbell over dumbbells. Some lifters lower the bar behind their head, which more directly stimulates the middle delts. We discourage this approach, which even many longtime lifters find painful.

In your workout: Do these first in your workout, and use challenging weights. Use a seat back for support on heavy sets.
""",
    image: Resource.image.seatedoverheadbarbell2,
    image2: Resource.image.seatedoverheadbarbell,
  ),
  Shoulder(
    title: "Upright Row",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it made the list: There's another family of multijoint movements that also targets the middle delts; upright rows. Each variation—whether on cables, using a Smith machine, or even an EZ-bar or barbell—has its advantages, but none is intrinsically better than the others. Wrist comfort may be the deciding factor for you. Don't take a close grip, which can internally rotate your shoulders; instead, take one in which your upper arms go directly out to your sides.

While a closer grip increases range of motion, a wider grip has been demonstrated to have significantly greater delt activation, minimizing the biceps' role in the movement.[3] That means it's great for the middle delts.

In your workout: Even though it's a multijoint movement, don't do this first in your workout. Consider doing it after your overhead press. It can even be done as a burnout move at the end of your routine, if you're looking to bring up the middles.
""",
    image: Resource.image.uprightrow2,
    image2: Resource.image.uprightrow,
  ),
  Shoulder(
    title: "Arnold Press",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it made the list Start with the dumbbells in front of your shoulders with your palms facing you. Press the weights overhead while simultaneously rotating your wrists, so that, in the top position, your palms face forward. Rotate your wrists in the opposite direction when lowering the weights.

In your workout: Consider doing these second in your workout after a more basic overhead press. If those overhead presses are heavy, do your Arnold presses with a slightly higher rep range—say, for sets of 10-12 reps.
""",
    image: Resource.image.arnold2,
    image2: Resource.image.arnold,
  ),

  Shoulder(
    title: "Machine Rear-Delt Fly",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it made the list: There are three movement arcs for single-joint exercises. We put this one before movements for the front and middle heads because the rears are so often undertrained compared to the others. Maintaining rear-delt size and strength relative to the other two is important for both posture and rotator-cuff health.

While you can do a bent-over version with dumbbells to hit the posterior delts, lifters often cheat and sling the weights up with poor control. When doing the rear pec-deck machine, go for a neutral grip—not palms-down—to maximally activate the muscle.[4]

In your workout: Perform your multijoint movements first in your workout, but if your rear delts are lagging, do this one first in your order of isolation moves.
""",
    image: Resource.image.machinerear2,
    image2: Resource.image.machinerear,
  ),
  Shoulder(
    title: "Dumbbell Lateral Raise",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it made the list: This is a great single-joint movement for the middle delts, but they're tougher to master than they seem. Beginners often have trouble learning how to lead with their elbows. They also tend to rest at the bottom of the motion, when in fact it's better to stop the downward arc when their arms are about 30 degrees out to their sides.

On some sets, take the motion about 30 degrees past shoulder height for a longer range of motion; you may have to sacrifice some weight with this variation. This movement also works well with down-the-rack training, whereby you quickly exchange your dumbbells for lighter ones (about 5 pounds) each time you hit muscle failure.

In your workout: Position it with other single-joint movements, after multijoint presses, but be aware of the amount of stimulation your middle delts might already be getting. Many of the movements already mentioned target the middle delts especially well. If you want to bring them up, do this exercise first; if your front or rear delts need more work, do this exercise last.
""",
    image: Resource.image.dumbellateral2,
    image2: Resource.image.dumbellateral,
  ),

  Shoulder(
    title: "Front Dumbbell Raise",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it made the list: Raising your straight arm directly in front of you emphasizes the anterior head of your deltoids. We put this one last because the front delts tend to be disproportionately large among individuals who overdo chest training relative to backside muscles. (And we don't know anybody who'd do that! Cough) So the front delts tend to already be well-developed.

Front raises can be done with a barbell or various cable handles, but we went with the standard dumbbell version. Each side works independently, which can help you not only spot strength imbalances but also correct them. These also calls in more stabilizer activity, so your core has to work that much harder.

In your workout: Do it during the latter half of your shoulder workout, after your multijoint movements have been completed. Position it in front of (or behind) single-joint movements for the other delt heads, depending on whether your front delts are relatively weaker/smaller (or stronger/larger) than the others.
""",
    image: Resource.image.dumbelfront2,
    image2: Resource.image.dumbelfront,
  ),


];
