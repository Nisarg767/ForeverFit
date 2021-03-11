import 'package:flutter/material.dart';
import 'package:foreverfit/core/widget/PureInkWell.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/resource/route.dart';

class TrainersPage extends StatefulWidget {
  @override
  _TrainersPageState createState() => _TrainersPageState();
}

class _TrainersPageState extends State<TrainersPage> {
  Widget _buildTrainerItem(Trainer trainer) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          RoutePath.trainerDetail2,
          arguments: trainer,
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xffD4D4D4), width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[

            SizedBox(
              width: Resource.space.xMedium,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    trainer.name,
                    style: Resource.style.homeItemTitle(),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    trainer.description,
                    style: Resource.style.homeItemContent(),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: Iterable.generate(
                          trainer.rating,
                          (index) => Icon(
                            Icons.star,
                            size: 16,
                            color: Resource.color.mainColorLight,
                          ),
                        ).toList(),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 16,
                          ),
                          Text(
                            trainer.location,
                            style: Resource.style.homeItemContent(),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16, right: 16),
        itemBuilder: (_, index) => _buildTrainerItem(trainers[index]),
        itemCount: trainers.length,
      ),
    );
  }
}

class Trainer {
  final String name;
  final String description;
  final String location;
  final int rating;
  final String image;

  Trainer({
    @required this.name,
    @required this.description,
    @required this.location,
    @required this.rating,
    @required this.image,
  });
}

final trainers = [

  Trainer(
    name: "Rushi Joshi",
    description: "Mass gain",
    location: "Ahmedabad",
    rating: 5,
    image: Resource.image.trainerDarshanBarapatre,

  ),
];
