import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/services/services_pending/rejected_request_page.dart';

class StatusWidget extends StatefulWidget {
  final String status;
  final String rejectedReason;
  final bool rejectedNeedDoc;
  final String serviceName;
  const StatusWidget(
      {Key? key,
      required this.status,
      required this.rejectedReason,
      required this.rejectedNeedDoc,
      required this.serviceName})
      : super(key: key);

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: getBorderColor(widget.status)),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  getIcon(widget.status),
                  color: getIconColor(widget.status),
                  size: 18.0,
                ),
                Expanded(
                  child: Text(
                    getText(widget.status),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: getTextColor(widget.status)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: widget.status == 'Documents Requested',
              child: ElevatedButton(
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  side:
                      MaterialStateProperty.all(BorderSide(color: Colors.red)),
                ),
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) =>
                          RejectedWidget(
                            folder: 'document_requested',
                            rejectedReason: widget.rejectedReason,
                            rejectedNeedDoc: widget.rejectedNeedDoc,
                            serviceName: widget.serviceName,
                          )));
                },
                // => showDialog(
                //     barrierDismissible: false,
                //     context: context,
                //     builder: (BuildContext context) {
                //       return Row(
                //         children: [
                //           Expanded(
                //             child: Column(
                //               children: [
                //                 Expanded(
                //                   child: RejectedWidget(
                //                     folder: 'document_requested',
                //                     rejectedReason: widget.rejectedReason,
                //                     rejectedNeedDoc: widget.rejectedNeedDoc,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ],
                //       );
                //     }),
                child: Text(
                  'Rejected Reasons',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getBorderColor(status) {
    return status == 'Started'
        ? Colors.grey
        : status == 'Pending'
            ? Color.fromRGBO(250, 169, 22, 1)
            : status == 'Completed'
                ? Colors.green
                : Colors.red;
  }

  String getText(status) {
    return status == 'Started'
        ? 'Your service is yet to be reviewed'
        : status == 'Pending'
            ? 'The documents submitted are being reviewed by the Admin'
            : status == 'Completed'
                ? 'The service has been reviewed and approved'
                : 'The service has been rejected. Please check the reasons and submit it again';
  }

  Color getTextColor(status) {
    return status == 'Started'
        ? Colors.grey
        : status == 'Pending'
            ? Color.fromRGBO(250, 169, 22, 1)
            : status == 'Completed'
                ? Colors.green
                : Colors.red;
  }

  IconData getIcon(status) {
    return status == 'Started'
        ? Icons.replay
        : status == 'Pending'
            ? Icons.access_time
            : status == 'Completed'
                ? Icons.done
                : Icons.close;
  }

  Color getIconColor(status) {
    return status == 'Started'
        ? Colors.grey
        : status == 'Pending'
            ? Color.fromRGBO(250, 169, 22, 1)
            : status == 'Completed'
                ? Colors.green
                : Colors.red;
  }
}
