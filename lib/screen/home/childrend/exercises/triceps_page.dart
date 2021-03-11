import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foreverfit/core/widget/PureInkWell.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/resource/route.dart';

class TricepsPage extends StatefulWidget {

  @override
  _TricepsPage createState() => _TricepsPage();
}

class _TricepsPage extends State<TricepsPage> {
  Widget _buildExerciseItem(Triceps exercise) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePath.tricepsdetail, arguments: exercise);
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

class Triceps {
  final String title;
  final String shortContent;
  final String image;
  final String image2;
  final String fakeContent;
  Triceps({
    @required this.title,
    @required this.shortContent,
    @required this.image,
    @required this.image2,
    @required this.fakeContent,
  });
}

final detail = <Triceps>[
  Triceps(
    title: "Skullcrusher",
    shortContent:
    """Interval Training is a form of exercise in which you alternate between two or more different...""",
    fakeContent: """
Why it's on the list: The guys who literally wrote the book on how to optimize training with EMG-based exercise selection point to this as the best overall triceps activation exercise.[1] While this move—also known as a French press or lying triceps extension—doesn't necessarily isolate the lateral or long heads more than other exercises, having the arm position perpendicular to your body combines the activity of the two heads to catapult this movement to the top of the list.

In your workout: Using an EZ-bar, small barbell, or dumbbell, do 3 sets for 8-12 reps as the first or second exercise in your routine. Make sure you have a spotter to help you get the weight into position and allow for a bit more safety when you're lowering the bar toward your face—there's a reason this exercise is called a skullcrusher!
""",
    image2:Resource.image.skullcrusher,
    image: Resource.image.skullcrusher2,
  ),
  Triceps(
    title: "Close-Grip Bench Press",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: If you've read any of our previous best-exercise articles, like those for chest and back, then you already know that we love compound (multijoint) exercises because they're the best for muscle growth. Even though the bench press is usually a chest exercise, you can effectively target smaller muscle groups like your triceps and build upper-body strength with this heavy multijoint movement.

Extending the elbows during those heavy barbell presses is an arm workout in itself. Powerlifters have been doing the close-grip bench press for ages, and they're known for having some mighty large guns. One of the first EMG studies on pressing angles and muscle activation discovered that a flat bench with a narrow grip activates the long head of the triceps to a greater extent than an inclined bench.

To really torch the back of your arms, use a close grip, but keep your hands around 8-10 inches apart. Going with a closer grip doesn't put any more stress on your elbow, but it does increase the strain on your wrists. Tuck your arms in to decrease the amount of stress on your pecs and shoulders while increasing the demand on your triceps.

In your workout: Place this movement first or second in your workout. Do 3-4 sets of 6-10 reps.
""",
    image: Resource.image.closegripbench2,
    image2:Resource.image.closegripbench,
  ),
  Triceps(
    title: "Weighted Parallel-Bar Dip",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: This is another multijoint triceps exercise, so it's near the top of the muscle-building list—especially weighted, which makes it more ideal for building mass. Attaching a belt around your waist with plates can increase the resistance so you fail within the target rep range of 8-12 ideal for muscle growth.

To focus on the triceps, keep your body as vertical as possible. Don't lean forward, which hits your chest instead of your arms, and keep those elbows tight to your sides. Think dips won't work for you? Take a look at any male gymnast; horseshoe triceps come standard issue with all those dips!

In your workout: While there's a pretty high degree of muscle recruitment with dips, it's often best to do them later in your workouts. Start your triceps workout with big weights and presses, then use dips in the middle to flush those arms with blood. Load up your dip belt and shoot for 3-4 sets of 8-12 reps.
""",
    image: Resource.image.parallelbar2,
    image2: Resource.image.parallelbar,
  ),
  Triceps(
    title: "Weighted Bench Dip",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: Another dip? Yep. EMG evidence suggests that there's substantial triceps activation during a bench dip.[3] How can we make this move even better? By bumping up the load with added weight! Any time we increase the mechanical load, metabolic stress, and mechanical stress to a muscle fiber, we can increase the recruitment of repair proteins normally present.

This multijoint movement is similar to the machine dip, but it requires a partner to place weights across your thighs and position two flat benches the right distance apart. Dropsets are easy to do: just remove a plate to extend your set.

In your workout: Put this in the middle or at the end of your workout. If you are feeling super fatigued, this may not be the best exercise, since your shoulders could end up in a compromised position by rounding forward. Shoot for 3 sets of 8-12 reps.
""",
    image: Resource.image.weighteddips2,
    image2: Resource.image.weighteddips,
  ),
  Triceps(
    title: "Triceps Dip Machine",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: This compound exercise makes it especially easy to find a weight that targets your desired goal. For example, if you're strength training, simply move the pin to a heavier load than if you're training for hypertrophy (8-12 reps). You'll likely need to strap yourself in, but this move also makes it easy to do forced reps (with a partner), dropsets, or even rest-pause sets to boost your intensity.

Why it's on the list: This compound exercise makes it especially easy to find a weight that targets your desired goal. For example, if you're strength training, simply move the pin to a heavier load than if you're training for hypertrophy (8-12 reps). You'll likely need to strap yourself in, but this move also makes it easy to do forced reps (with a partner), dropsets, or even rest-pause sets to boost your intensity.
""",
    image: Resource.image.tricepsdip2,
    image2: Resource.image.tricepsdip,
  ),
  Triceps(
    title: "Board Press",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: This one may be new to a lot of you. The idea behind this movement is to restrict the bottom portion of the barbell bench press by placing 2x4s on your chest. This allows you to preferentially train the final upper-arms lockout of the bench press.

Movement analysis of the barbell bench press, whether close grip or regular, demonstrates that quite a bit of elbow extension occurs over the final two-thirds of the press off the chest. When you dust off your anatomy books, you'll see that the primary action of the triceps is elbow extension. This means that board presses really target your triceps!

If you need any more proof why you should add in occasional board presses, look to the top-equipped powerlifters in the field who also do this limited-ROM movement to increase arm strength.

In your workout: Slot this one in the number two or three position in your routine. This exercise may feel goofy at first, but once you get the hang of it, you'll learn to relish all the plates clanging as you do it. Go heavy here! Shoot for the low end of hypertrophy at 4 sets of 8 reps.
""",
    image: Resource.image.boardpress,
    image2: Resource.image.boardpress2,
  ),
  Triceps(
    title: "Seated Overhead Dumbbell Extension",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: Once your arms go overhead, the long head becomes the target, so it's always a good idea to include some kind of overhead exercise in your triceps workout.

The dumbbell overhead triceps extension is just one of many good options, and it's probably the easiest to get into, especially when seated. If you have a partner, it's even easier if they hand you the weight. (You can also do a few assisted reps.) Once again, minimize elbow flare on this movement.

In your workout: After warming up with multijoint exercises, you'll be ready for seated extensions toward the second half of your workout. Do 3 sets of 8-10 reps. The goal here is to really load the muscles during the eccentric portion of the lift, so concentrate on a good stretch past a 90-degree angle as you lower the weight.
""",
    image: Resource.image.seated2,
    image2: Resource.image.seated,
  ),

  Triceps(
    title: "Cable Overhead Extension With Rope",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: We named this the top cable move on our list because it focuses on the often underdeveloped long head. It is also extremely easy to get into position for this exercise. With a rope attached to an upper pulley, lean forward using a split stance and lock your upper arms by the sides of your head. Your elbows are the hinges, with no other movement taking place in the shoulders as you extend through your arms. Again, avoid flaring your arms.

In your workout: A great second or third exercise in place of push-downs, do 3 sets of 8-12 reps.
""",
    image: Resource.image.cableoverhead2,
    image2: Resource.image.cableoverhead,
  ),
  Triceps(
    title: "Single-Arm Cable Kick-Back",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: We're not big fans of the dumbbell kick-back because there are so many ways to cheat it, and the angle of resistance is less effective than what you can achieve with a resistance band or cable. When the angle of pull is coming from the side rather than straight down, it's much harder to cheat.

To optimize this cable kick-back for maximum muscle activation, take a bench and incline it up to about 60 degrees. Facing the weight stack with your chest on the bench, perform the cable kick-back with your upper arm locked parallel to the floor. Surprisingly, a well-executed kick-back creates similar muscle activation as a single-arm dumbbell extension for both the long and lateral heads.[1]

Just make sure you don't drop your elbow—a very common mistake—which turns this single-joint movement into a multijoint one. Keep your upper arm parallel to the floor as you fully extend your elbow and squeeze. Don't use a handle here; just grab the rubber ball at the end of the cable.

In your workout: Maximum contraction is key, and you won't be able to go very heavy with this exercise, so place it last in your routine. Shoot for 3 sets of 10-12 reps.
""",
    image: Resource.image.kickback2,
    image2: Resource.image.kickback,
  ),

  Triceps(
    title: "Cable Push-Down",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: Going back to the "gold standard" training book of EMG, the authors demonstrated that cable push-downs actually activated the lateral head of the triceps more than skullcrushers, kick-backs, or any other major triceps exercises.[2] If you're not doing this movement already, it's a fairly good single-joint, lateral-head movement as long as you don't let your arms drift from your sides. Dropsets are also easy to do with this exercise!

In your workout: Since this is an isolation exercise, do it toward the end of your workout for 3 sets of 10-12 reps. Once you pass the beginner level, it may be okay to allow your elbows to drift a bit from your sides to allow a greater stretch on the triceps.
""",
    image: Resource.image.cabelpush2,
    image2: Resource.image.cabelpush,
  ),


];
