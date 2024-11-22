import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:audioplayers/audioplayers.dart';

class MediaController extends GetxController {
  // Gambar
  var selectedImagePath = ''.obs;
  
  // Video
  var selectedVideoPath = ''.obs;
  var videoPlayerController = Rx<VideoPlayerController?>(null);
  
  // Audio
  final AudioPlayer audioPlayer = AudioPlayer();
  var isPlayingAudio = false.obs; // Status audio

  // Speech-to-text
  var speechText = ''.obs; // Menyimpan teks hasil speech-to-text
  late stt.SpeechToText _speech;
  // ignore: unused_field
  bool _isListening = false;

  final ImagePicker _picker = ImagePicker();

  // Method untuk memilih gambar dari kamera
  Future<void> pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      selectedImagePath.value = pickedImage.path;
      Get.snackbar(
        'Success',
        'Image successfully captured',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Method untuk memilih video dari kamera
  Future<void> pickVideo() async {
    final pickedVideo = await _picker.pickVideo(source: ImageSource.camera);
    if (pickedVideo != null) {
      selectedVideoPath.value = pickedVideo.path;
      _initializeVideoPlayer(File(pickedVideo.path));
      Get.snackbar(
        'Success',
        'Video successfully captured',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'No video selected',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Method untuk inisialisasi video player
  void _initializeVideoPlayer(File videoFile) {
    videoPlayerController.value = VideoPlayerController.file(videoFile)
      ..initialize().then((_) {
        videoPlayerController.value!.play();
      });
  }

  // Method untuk memutar audio
  Future<void> playAudio(String url) async {
    await audioPlayer.play(UrlSource(url));
    isPlayingAudio.value = true;
  }

  // Method untuk menjeda audio
  Future<void> pauseAudio() async {
    await audioPlayer.pause();
    isPlayingAudio.value = false;
  }

  // Method untuk menghentikan audio
  Future<void> stopAudio() async {
    await audioPlayer.stop();
    isPlayingAudio.value = false;
  }

  // Method untuk memulai mendengarkan suara (speech-to-text)
  Future<void> startListening() async {
    _speech = stt.SpeechToText();

    bool available = await _speech.initialize();
    if (available) {
      _isListening = true;
      _speech.listen(onResult: (result) {
        speechText.value = result.recognizedWords; // Menyimpan hasil teks
        print(speechText.value); // Menampilkan hasil di console
      });
    } else {
      Get.snackbar(
        'Error',
        'Speech recognition is not available',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Method untuk berhenti mendengarkan suara
  Future<void> stopListening() async {
    _isListening = false;
    await _speech.stop();
  }

  @override
  void onClose() {
    // Membersihkan resource audio dan video
    videoPlayerController.value?.dispose();
    audioPlayer.dispose();
    super.onClose();
  }
}
