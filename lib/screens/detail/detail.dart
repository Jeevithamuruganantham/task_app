import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/screens/detail/widgets/date_picker.dart';
import 'package:task_app/screens/detail/widgets/task_timeline.dart';
import 'package:task_app/screens/detail/widgets/task_title.dart';

class DetailPage extends StatelessWidget {
 final Task task;
 DetailPage(this.task);

  @override
  Widget build(BuildContext context) {
    final detailList = task.desc;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DatePicker(),TaskTitle()
                ],
              ),
            ),
          ),
          detailList==null?
          SliverFillRemaining(
            child: Container(
              color:Colors.white ,
              child: Center(child: Text('No task tdy',
              style: TextStyle(color: Colors.grey,fontSize: 18),))),
          ):
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => TaskTimeLine(detailList[index]),
              childCount: detailList.length
            ),
          )
        ],)
    );
  }
  Widget _buildAppBar(BuildContext context){
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon:Icon(Icons.arrow_back_ios),
        iconSize: 20,
      ),
      actions: [
        Icon(Icons.more_vert,
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${task.title} tasks',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 5,),
            Text(
              'you have ${task.left}tasks for today!',
              style: TextStyle(fontSize: 12,color:Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}