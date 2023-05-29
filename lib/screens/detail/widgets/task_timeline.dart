import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeLine extends StatelessWidget {
  final Map<String,dynamic>detail;
  TaskTimeLine(this.detail);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15,),
        child:Row(
          children: [
            _buildTimeline(detail['tlColor']),
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(detail['time']),
                detail['title'].isNotEmpty?
                _buildCard(detail['bgColor'],detail['title'],detail['slot'],)
                : _buildCard(Colors.white,'','')]
            ))
          ],
        )
    );
  }
  Widget _buildCard(Color bgcolor,String title,String slot){
    return Container(); 
  }
  Widget _buildTimeline(Color color){
     return Container(
      height:80,
      width: 20,
      child:TimelineTile(
        alignment:TimelineAlign.manual ,
        lineXY:0,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0,
          width: 15,
          indicator: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 5,color:color),
            ),
          )
        ),
        afterLineStyle: LineStyle(
          thickness: 2,
          color:color
        ),
      )
       
      
     );
  }
}