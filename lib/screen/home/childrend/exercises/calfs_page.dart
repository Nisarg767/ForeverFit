import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foreverfit/core/widget/PureInkWell.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/resource/route.dart';

class CalfsPage extends StatefulWidget {

  @override
  _CalfsPage createState() => _CalfsPage();
}

class _CalfsPage extends State<CalfsPage> {
  Widget _buildExerciseItem(Calfs exercise) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePath.calfsdetail, arguments: exercise);
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

class Calfs {
  final String title;
  final String shortContent;
  final String image;
  final String image2;
  final String fakeContent;
  Calfs({
    @required this.title,
    @required this.shortContent,
    @required this.image,
    @required this.image2,
    @required this.fakeContent,
  });
}

final detail = <Calfs>[
  Calfs(
    title: "Seated Barbell Calf Raise",
    shortContent:
    """Interval Training is a form of exercise in which you alternate between two or more different...""",
    fakeContent: """
If you are a serious lifter, there are two things you already know about calf training. First, the soleus (the less-visible, but volume-enhancing portion of the calf) is targeted with bent-leg movements. Second, free-weight movements are awesome for building muscle.

So why haven't you been doing seated barbell calf raises? This may be a tough exercise, but when it comes to building calves, it is so worth it. Grab a barbell, sit your butt down, and get to work.

Wrap the bar with a pad or towel so it doesn't hurt your legs. Have a partner help you lift the bar to get yourself set up. Place the balls of your feet on stacked plates so your heels can stretch at the bottom of the movement. Perform reps with a full range of motion and without using momentum.

If you're short on time or floor space, you can always hop on the seated calf machine as a quick and easy alternative–but for superior growth, the barbell version is definitely the way to go. 
""",
    image2:Resource.image.seatedcalf,
    image: Resource.image.seatedcalf2,
  ),
  Calfs(
    title: "Single-Leg Calf Press",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Now you can shift your attention to the gastrocnemius, the more visible portion of the calf. You know from working other muscle groups that focusing on one side at a time can help bring up a lagging muscle, so apply the same logic to your calves. Devote enough time to each leg to ensure each side receives the same amount of love.

Single-leg calf presses can be performed on the leg press, the donkey calf raise machine, or just standing with free weights, so there's no reason why you can't incorporate this exercise into your routine. To isolate the gastrocnemius, keep your knee straight throughout the movement. Choose a weight you know you can lift without having to cheat and bend your knee or use momentum.

For each calf, perform one set of raises with the toes of that foot pointed out, one with toes straight forward, and one with toes pointed in. Each angle shifts the emphasis to a different area of the muscle. Between the three sets, you'll target every angle and generate a noticeable pump. It may take more time to work each side on its own, but serious growth takes serious time and commitment, so be patient as you work for better calf growth.
""",
    image: Resource.image.legcalf2,
    image2:Resource.image.legcalf,
  ),
  Calfs(
    title: "Double-Leg Calf Raise",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Calf raises are the classic calf-strengthening exercise. They use your body weight to strengthen and tone the gastrocnemius and soleus.

Starting position: Stand near a wall for balance. Place your feet hip-width apart, and make sure your ankles, knees, and hips are in vertical alignment to protect your joints.

Action: Press down into the balls of both feet to raise your body upward. Keep your abdominal muscles pulled in so that you move straight upward, rather than shifting your body forward or backward.

Variations:
Start standing on a stair, or similar so your heels can drop lower than your toes. Keeping the balls of your feet on the stair, lower your heels as far as you can toward the floor. Then press your heels up as high as you can.
Add weight to add intensity. Repeat the exercise holding a dumbbell or other weight in one hand. Keep your hand on a wall for balance.
""",
    image: Resource.image.doubleg2,
    image2: Resource.image.doubleg,
  ),


  Calfs(
    title: "Farmer’s walk on toes",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
This variation on a traditional farmer’s walk is excellent for functional calf strengthening and balance, Kelley says.

Hold a dumbbell in each hand with your feet hip-width apart.
Keeping your shoulders down and your core engaged, lift your heels so you’re standing on your toes.
Without letting your heels touch the ground, walk forward on your toes for a set number of reps or time.
""",
    image: Resource.image.former2,
    image2: Resource.image.former,
  ),


  Calfs(
    title: "Jump rope",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Hold the rope with your palms facing up and your wrists roughly halfway between your feet and the top of your head. Your wrists should be a few inches away from the sides of your body.
    
Start with the rope behind your heels, and spin the rope up and over your head. (Once you’ve built up momentum, you should be able to continue spinning the rope by moving your wrists with minimal elbow and shoulder movement.
    
Keep a slight bend in your knees, stay on your toes, and jump no more than a couple inches off the ground.
    
Engage your core and keep your spine neutral (by keeping your chest up and looking straight ahead, not down).
""",
    image: Resource.image.jump2,
    image2: Resource.image.jump,
  ),


  Calfs(
    title: "Dumbbell jump squat",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Stand tall with your feet shoulder-width apart, hold a dumbbell in front of your chest with both hands.

Keeping your chest up, core engaged, and back flat, push your hips back and lower your body until your thighs are parallel to the floor.

Push yourself back up explosively, jumping straight up.

Land softly, lowering yourself immediately into your next rep.

How to Make Jump Squats Easier:-

If weighted jump squats prove problematic in any way, use lighter weights, or simply switch to the body-weight squat jump.

Another option if you have knee issues or are overweight: “Don’t jump,” says Trevor Thieme, C.S.C.S., Openfit’s Fitness and Nutrition Content Director. “Not jumping might seem like it defeats the purpose of the exercise, but studies show that performing a movement explosively while keeping your feet on the ground provides similar benefits to traditional plyometrics without increasing the stress on your joints.”

 
How to Make Jump Squats Harder:-

If you’re looking for ways to increase the difficulty of the move, use heavier weights, jump higher, or add a pause at the bottom of the movement, suggests Thieme. That last option will eliminate the help you get from the stretch reflex, which is the rubber band-like tendency of a muscle to return to a shortened state when stretched.

However you perform the squat jump, try not to save it for the end of a workout.

“The squat jump requires what it helps you build — explosive power — so you don’t want to save it for the end of a workout when your legs are tired,” Thieme says. “You want to perform it when your legs are fresh, during the first half of a training session.”
""",
    image: Resource.image.jumpsquat2,
    image2: Resource.image.jumpsquat,
  ),

  Calfs(
    title: "Downward dog",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Begin in a tabletop position with your hands planted on the ground beneath your shoulders and your knees below your hips.

Pressing firmly into your palms, tuck your toes, lift your knees off the ground, and slowly extend your hips upward.

Without locking your knees, carefully straighten your legs until your body creates a triangle shape with the ground.

Remember to engage your core as you continue to lengthen your spine and lift your hips as high as possible.

To deepen the stretch, bend one knee and then the other to peddle the feet.
""",
    image: Resource.image.downward2,
    image2: Resource.image.downward,
  ),


  Calfs(
    title: "Straight-leg calf stretch against wall",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
This is a good stretch to target your gastrocnemius and simultaneously improve ankle flexibility, Braun says.

Standing arm’s distance away from a wall, step one foot back and slightly bend your front knee.

Lean forward to push your hands against the wall, and press your back heel down into the ground for a deep stretch. Make sure your leg is straight.
Switch legs and repeat.

To isolate the soleus, try a variation with your back leg slightly bent.
""",
    image: Resource.image.straight2,
    image2: Resource.image.straight,
  ),

];
