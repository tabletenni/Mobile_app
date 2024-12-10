import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Cameras extends StatefulWidget {
  const Cameras({super.key});

  @override
  State<Cameras> createState() => _CamerasState();
}

class _CamerasState extends State<Cameras> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setupCameraControler();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed:(){
            Navigator.pop(context);
          }),
      ),
      body: _buildUI(),
    );
  }
  Widget _buildUI(){
    if(cameraController == null || cameraController?.value.isInitialized == false){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SafeArea(
      child: SizedBox.expand(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CameraPreview(cameraController!,)
        ],
      ),
    )
    );
  }



  Future<void> _setupCameraControler() async{
    List<CameraDescription> _camearas = await availableCameras();
    if(_camearas.isNotEmpty){
      setState(() {
        cameras = _camearas;
        cameraController = CameraController(
          _camearas.first,
           ResolutionPreset.high
          );
      });
      cameraController?.initialize().then((_){
        setState(() {
          
        });
      });

    }
  }
}