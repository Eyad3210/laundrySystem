import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/logic/controller/complaint_controller.dart';
import 'package:project2/utils/theme.dart';
import 'package:project2/view/screens/complaints/complaint_widget.dart';

class ListComplaint extends StatelessWidget {
  ListComplaint({Key? key}) : super(key: key);
  var controller = Get.find<ComplaintController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
          IconButton(
              onPressed: () {
                controller.complaintListGet.clear();
                controller.fetchComplaints();
              },
              icon: Icon(Icons.refresh))
        ],
        backgroundColor: mainColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Complaints",
        ),
      ),
      body: Obx(() => controller.complaintListGet.isNotEmpty
          ? ListView.builder(
              itemCount: controller.complaintListGet.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.complaintInfoListGet.clear();

                    controller.fetchComplaintsInfo(
                        controller.complaintListGet[index].complaintId);
                    print(controller.complaintInfoListGet);

                    AwesomeDialog(
                        context: context,
                        btnOkOnPress: () {},
                        showCloseIcon: true,
                        dialogType: DialogType.NO_HEADER,
                        body:
                            Obx(() => controller.complaintInfoListGet.isNotEmpty
                                ? Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Complaint"),
                                      Text(controller
                                          .complaintInfoListGet[0].message
                                          .toString()),
                                      Divider(),
                                      Text("Answer"),
                                      controller.complaintInfoListGet.length ==
                                              1
                                          ? Text("لا يوجد رد حتى الان")
                                          : Text(controller
                                              .complaintInfoListGet[1].message
                                              .toString())
                                    ],
                                  )
                                : CircularProgressIndicator(
                                    color: mainColor,
                                  )))
                      ..show();
                  },
                  child: ComplaintCard(
                    name:
                        controller.complaintListGet[index].complaint_type_name,
                    nameState: controller.complaintListGet[index].statusName,
                  ),
                );
              })
          : Center(
              child: CircularProgressIndicator(
              color: mainColor,
            ))),
    );
  }
}
