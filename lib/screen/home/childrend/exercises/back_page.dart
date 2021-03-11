
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foreverfit/core/widget/PureInkWell.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/resource/route.dart';

class BackPage extends StatefulWidget {

  @override
  _BackPage createState() => _BackPage();
}

class _BackPage extends State<BackPage> {
  Widget _buildExerciseItem(Back exercise) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePath.backdetail, arguments: exercise);
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

class Back {
  final String title;
  final String shortContent;
  final String image;
  final String image2;
  final String fakeContent;
  Back({
    @required this.title,
    @required this.shortContent,
    @required this.image,
    @required this.image2,
    @required this.fakeContent,
  });
}

final detail = <Back>[
  Back(
    title: "Barbell Deadlift",
    shortContent:
    """Interval Training is a form of exercise in which you alternate between two or more different...""",
    fakeContent: """
Why it's on the list: This is technically more than a back exercise—it hits the entire posterior chain from your calves to your upper traps—but it's the absolute best for overall backside development. Technique is uber-important with the deadlift, but once you nail it, you can progress to lifting monster weights that will recruit maximum muscle, release muscle-building hormones, and help you get big.

There are also numerous deadlift progression programs you can follow to help you reach new personal bests. Physiologists love to prescribe the deadlift when programming for strength and conditioning because the exercise hammers your musculature and is one of the best choices to strengthen your bone structure.

Stick with the conventional deadlift on back day; other variations, like the popular sumo-style, increase the activity of muscle groups other than the back.[1]

In your workout: If you're going heavy (sets of fewer than about 6 reps), do deadlifts first so you're fresh. If you're doing deads for repetitions, you can do them later in your workout.
""",
    image2:Resource.image.deadlift,
    image: Resource.image.deadlift2,
  ),
  Back(
    title: "Bent-Over Barbell Row",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: This is probably the second-best back movement in terms of sheer weight you can lift. EMG research has suggested that hitting bent-over barbell rows will work the larger muscle groups of the upper and lower back equally, making this a great overall back builder.

Like the deadlift, this is another technical move that requires excellent form but rewards you with a ton of muscle.

In your workout: Do bent-over rows toward the start of your back workout for heavy sets in lower rep ranges, about 6-8 or 8-10. The Smith version is a suitable substitute; it locks you in the vertical plane, but your body has to be in just the right position relative to the bar. The bent-over barbell row has a significantly greater lumbar load than many other back exercises, so it's best done early in your workout in order to save your lower back.[2] If you're wrecked from deadlifts, it may behoove you to skip this movement.
""",
    image: Resource.image.bentover2,
    image2:Resource.image.bentover,
  ),
  Back(
    title: "Wide-Grip Pull-Up",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: It's always a good idea to have an overhead pulling movement in your back routine, and the pull-up is one of the best. Wide-grip pull-ups are excellent for putting emphasis on the upper lats. A closer grip may allow for a longer range of motion, but it may be possible to load the wide-grip pull-up to a greater degree because of an optimized starting joint position. The biggest challenge here for most trainers is training to failure in the right rep range for growth, which is 8-12.

If you do pull-ups early in your workout, you might have to add a weighted belt. Of course, if you find them difficult, you can always use an assisted pull-up machine or a good spotter, or switch to the wide-grip pull-down, which is a solid substitute. If your shoulders are healthy, pulling behind the head is okay.

Good form is extremely important here. In the starting position, the scapula should be retracted—pull your shoulder blades down and toward each other—prior to initiating the pull.

In your workout: Because the pull-up range of motion is so long, several light reps make great warm-up moves for the shoulder joints. Since form is so important with these, it may be best to push pull-ups toward the front of your workout to ensure proper shoulder-joint positioning.
""",
    image: Resource.image.widegrip2,
    image2: Resource.image.widegrip,
  ),
  Back(
    title: "Standing T-Bar Row",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: We selected the T-bar row over a chest-supported version because you can pile on much more weight here, even though that typically translates into a bit of cheating through the knees and hips. For some, maintaining a flat back can be challenging, in which case the supported version is a better choice.

These aren't squats, so keep your legs locked in a bent angle throughout. You also typically have a choice of hand positions and width. A wider grip will put more emphasis on the lats, while a neutral grip will better target the middle back (rhomboids, teres, and traps). This exercise is probably one of the easier rows to spot.

In your workout: Do this toward the front half of your workout. Rather than slinging weight around with this movement, really focus on the stretch and contraction of the back. If you're an experienced lifter, load up with 25s instead of the 45s, and further increase range of motion by allowing a slight protraction of the scapula at the bottom of every rep. If you do this, be sure to "reset" with a flat back before initiating the next pull!
""",
    image: Resource.image.tbar2,
    image2: Resource.image.tbar,
  ),
  Back(
    title: "Wide-Grip Seated Cable Row",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: Just about everyone defaults to the close-grip bar on rows. If that sounds like you, you'll find using a wide grip on a lat bar a nice change of pace because it shifts some of the emphasis to the upper lats. Wide rows mimic some back machines, so don't do both in your workout unless you make some other kinds of changes, like grip or target rep range. You might even try flipping your grip—and going about shoulder-width apart—which better targets the lower lats as the elbows stay tighter to your sides.

In your workout: Like machines, cables are best done toward the end of your workout. Choose a weight that enables you to complete no more than about 12 reps.
""",
    image: Resource.image.seatedcabel2,
    image2: Resource.image.seatedcabel,
  ),
  Back(
    title: "Reverse-Grip Smith Machine Row",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: Reverse-grip movements mean two things: The biceps play a greater role, and with the elbows now pulling back close to your sides, the target becomes the lower portion of the lats. The Smith machine allows you to concentrate only on pulling as much weight as possible, since you don't have to worry about balancing it.

Bend over about 45 degrees, staying close to the bar, and expect a little contribution from the hips and knees when you're pounding out the heavy sets. While some gym rats consider the Smith machine taboo, the fixed plane of the movement and ability to really control a weight (think tempo of four seconds up and four down) can be both a novel and humbling exercise.

In your workout: You don't need more than a single reverse-grip movement in your routine. Do it about midway through your workout, after your heavy overhand pulls. At any point in your back workout, don't be afraid to throw on some wrist straps. Your goal is to hammer your back and put it through the wringer, not be constantly limited by your grip strength.
""",
    image: Resource.image.reversegrip2,
    image2: Resource.image.reversegrip,
  ),
  Back(
    title: "Close-Grip Pull-Down",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: Since we've already covered the wide-grip pull-up, the wide-grip pull-down is too similar, so we opted for the close-grip handle for our pull-down selection. EMG research suggests that use of a close neutral grip activates the lats similarly to a regular grip, so you're not missing out on any muscle fibers.

In your workout: This exercise can make a good warm-up move for your shoulders, but when used as a mass-building exercise, it's best placed toward the end of your workout for sets of 8-12 reps.

Slow down the rep tempo on these, squeeze hard at the bottom of each rep, and allow a good stretch at the to
""",
    image: Resource.image.closegrip,
    image2: Resource.image.closegrip2,
  ),

  Back(
    title: "Single-Arm Dumbbell Row",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: This is a great unilateral exercise—each side works independently—that allows you to move a lot of weight. You'll get greater range of motion when training unilaterally, and you won't be restrained if your weaker side fails first. You may also be better able to support your lower back—which may have taken plenty of punishment by now—when placing one hand on a bench. Allowing a slight degree of rotation of the trunk may engage a greater degree of "core" musculature, as well.

In your workout: Unless you intentionally flare your elbow out wide, this exercise focuses more on your lower lats. Do it anywhere from the middle to the end of your workout for sets of 10-12.
""",
    image: Resource.image.singlearm2,
    image2: Resource.image.singlearm,
  ),
  Back(
    title: "Decline Bench Dumbbell Pull-Over",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: Pull-overs for back? Absolutely! This one mimics the straight-arm cable pull-down you're probably familiar with. Yes, this is a single-joint move, but it allows you to really target and torch your lats. The decline version puts your lats under tension for a longer range of motion than when using a flat bench. Just make sure the dumbbell clears your head, and drop it on the floor behind you when you're done.

In your workout: In almost all cases, single-joint movements should be done last in your body-part routine. Keep the reps on the higher end for a nice finishing pump, around 12-15 per set.
""",
    image: Resource.image.declinebench2,
    image2: Resource.image.declinebench,
  ),

  Back(
    title: "Single-Arm Smith Machine Row",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Why it's on the list: This bad boy is basically a single-arm dumbbell row performed on a Smith machine. It's a great and novel choice for your lower lats. Stand sideways to the machine, grasping the bar toward the middle, and keep your body close to the apparatus using a split stance and bent knees for balance. As you pull the bar up as high as you can, your body may sway a bit to keep the movement natural, which is OK.

In your workout: Do this exercise toward the end of your back routine for sets of 8-10 or 10-12. Do it in place of the single-arm dumbbell row—not both—since the exercises are similar.
""",
    image: Resource.image.smithmachine2,
    image2: Resource.image.smithmachine,
  ),


];
