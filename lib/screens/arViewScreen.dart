import 'package:arcore_flutter_plugin_example/models/ItemModel.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARViewScreen extends StatefulWidget {
  ItemModel itemModel;
  ARViewScreen({this.itemModel});

  @override
  _ARViewScreenState createState() => _ARViewScreenState();
}

class _ARViewScreenState extends State<ARViewScreen> {
  ArCoreController arCoreController;

  void whenARCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = controlOnPlaneTap;
  }

  void controlOnPlaneTap(List<ArCoreHitTestResult> results) {
    final hit = results.first;
    addItemImagetoScene(hit);
  }

  Future addItemImagetoScene(ArCoreHitTestResult hitTestResult) async {
    // Orginal Code with PNG
    // final bytes= (await rootBundle.load(widget.itemImg)).buffer.asUint8List();
    // final imageItem= ArCoreNode(
    //   image: ArCoreImage(bytes: bytes, width: 300, height: 300),
    //   position: hitTestResult.pose.translation + vector.Vector3(0.0, 0.0, 0.0),
    //   rotation: hitTestResult.pose.rotation + vector.Vector4(0.0, 0.0, 0.0, 0.0),
    // );
    // arCoreController.addArCoreNodeWithAnchor(imageItem);

    // EDITED TO OBJ SFA
    final objectNode = ArCoreReferenceNode(
      name: widget.itemModel.name,
      object3DFileName: widget.itemModel.sfb,
      position: hitTestResult.pose.translation,
      rotation: hitTestResult.pose.rotation,
    );
    arCoreController.addArCoreNode(objectNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: whenARCoreViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }
}
