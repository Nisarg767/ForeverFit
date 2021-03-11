import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foreverfit/core/widget/PureInkWell.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/resource/route.dart';

class AbsPage extends StatefulWidget {

  @override
  _AbsPage createState() => _AbsPage();
}

class _AbsPage extends State<AbsPage> {
  Widget _buildExerciseItem(Abs exercise) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePath.absdetail, arguments: exercise);
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

class Abs {
  final String title;
  final String shortContent;
  final String image;
  final String image2;
  final String fakeContent;
  Abs({
    @required this.title,
    @required this.shortContent,
    @required this.image,
    @required this.image2,
    @required this.fakeContent,
  });
}

final detail = <Abs>[
  Abs(
    title: "Cable Crunches",
    shortContent:
    """Interval Training is a form of exercise in which you alternate between two or more different...""",
    fakeContent: """
Purpose: To develop the upper and lower Rectus abdominis.

Execution: Attach a rope to an overhead pulley. Grasp each end of the rope, one end in each hand. Kneel down, holding the rope in front of your forehead, bend and curl your torso downward, rounding your back and moving your head towards your knees while feeling your abdominal muscles crunch together. Keep squeezing your ab muscles at the end of the movement for about 3 seconds, then release and slowly return to the starting position.
""",
    image2:Resource.image.cabelcrunch,
    image: Resource.image.cabelcrunch2,
  ),
  Abs(
    title: "JackKnife Sit-up (shown without Medicine Ball)",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Purpose: To shape and develop the External obliques, Intercostals, and Pectineus.

Execution: Sit on the floor while holding a medicine ball between your hands and your feet out in front of you. Bend your knees slightly and lift your feet so that they are suspended slightly off the ground while at the same time keeping your ankles together. Lean back so that your torso is approximately 45 degrees to the floor.

Hold the medicine ball out straight out from your chest with your arms slightly bent and then twist your torso over to one side as far as you can, bringing the medicine ball towards the floor on that side of your body, pause for a moment, then twist your torso in the opposite direction as far as you can while bringing the medicine ball towards the floor on that side of your body. Repeat this movement over, alternating side to side until you reach failure.
""",
    image: Resource.image.jackknife2,
    image2:Resource.image.jackknife,
  ),
  Abs(
    title: "Hanging Knee Raises",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Purpose: To shape and develop the lower Rectus abdominis.

Execution: If available, secure your arms in arm harnesses attached to the chin up bar, or if you have no arm harnesses, then grasp the chin up bar using an over-hand grip. Allow your body to hang straight down keeping your feet together.

Next, curl your knees up towards your chest while keeping your legs together. Once your curled your knees up as high as you can, pause for a couple seconds while squeezing your lower abdominals, then slowly lower your feet back towards the floor as your legs straighten out again, bringing you back to the starting position.
""",
    image: Resource.image.hangingknee2,
    image2: Resource.image.hangingknee,
  ),
  Abs(
    title: "Seated Leg Tucks",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Purpose: To develop the upper and lower Rectus abdominis.

Execution: Sit crosswise on a bench holding on to the sides for support. Slightly raise your legs and bend your knees and lean backward at about a 45 degree angle. Using a scissor like movement, curl your upper body toward your pelvis, while rounding your back, and simultaneously lift your knees up towards your head, making your body look like a V shape (hence the name V-ins.)

Feel your upper and lower abdominals crunch together as your pelvis and rib cage squeeze together. From this position, lower your knees and torso back to the starting position.
""",
    image: Resource.image.seatedleg2,
    image2: Resource.image.seatedleg,
  ),
  Abs(
    title: "Exercise Ball Pull-in",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Purpose: To shape and develop the lower Rectus abdominis.

Execution: Begin by lying on top of a stability ball with your belly facing down and using your hands, walk your body over the top of the stability ball while keeping your body straight until just the tops of your feet are facing down on the very top of the stability ball.

At this point you will be in a push up position with your arms straight and your abdominals pulled in. Next, using your abdominal muscles, tuck your knees up towards your chest as the ball rolls in the same direction with the tops of your feet planted on top of the ball. Once you've brought your knees and the ball as far up towards your chest as you can, pause for 1 second and then slowly straighten your legs back out and return the ball to the starting position.
""",
    image: Resource.image.ballpullin2,
    image2: Resource.image.ballpullin,
  ),
  Abs(
    title: "Ab Crunch Machine",
    shortContent:
    """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    fakeContent:"""
Purpose: To shape and develop the upper and lower Rectus abdominis.

Execution: Some bodybuilders feel that using machines to train abdominals is an inferior approach to abdominal training, however, many great body builders swear by machines for maximum results. I personally am a big fan of the ab crunch machines that are designed with the gripping handles positioned upwards on both sides of the head. Even the legendary Charles Glass often uses ab crunch machines to train clients. Which-ever variation of ab crunch machine you decide to use, the important thing to remember is that you need to concentrate on squeezing your rib cage and pelvis together as your abdominals contract.

Perform your repetitions nice and slow and really focus on feeling your abdominals burn as they work. If you are unable to achieve this sensation, then the particular machine your using may not be suited for your individual needs.
""",
    image: Resource.image.abcrunch2,
    image2: Resource.image.abcrunch,
  ),

];
