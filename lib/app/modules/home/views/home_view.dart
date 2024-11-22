import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/app/routes/app_pages.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import '../controllers/home_controller.dart';
import '../../image/controllers/image_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 60, 60),
        centerTitle: false,
        title: const Row(
          children: [
            AvatarWidget(
              imageUrl: 'public/images/chat.png',
              isLeft: true,
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DELIVER TO',
                  style: TextStyle(
                    color: Color(0xFFFC6E2A),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Halal lab office',
                  style: TextStyle(
                    color: Color(0xFF676767),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white,
            onPressed: () {
              Get.toNamed(Routes
                  .LOGOUT); // Assuming this method is defined in your HomeController
            },
          ),
          const AvatarWidget(
            imageUrl: 'public/images/keranjang.png',
            isLeft: false,
            backgroundColor: Color(0xFF181C2E),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Hey Hilmy, ',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextSpan(
                    text: 'Good Afternoon!',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSearchBar(context),
            const SizedBox(height: 20),
            const Text('All Categories', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            _buildCategoryList(),
            const SizedBox(height: 20),
            const Text('Recipe for today', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            _buildRecipeGridList(),
            const SizedBox(height: 20),
            const Text('Open Restaurants', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            _buildRestaurantGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const SearchPage());
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: const Row(
          children: [
            Icon(Icons.search, color: Color(0xFF676767)),
            SizedBox(width: 10),
            Text(
              'Search dishes, restaurants',
              style: TextStyle(color: Color(0xFF676767)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryCard(
            label: 'Gudeg',
            imageUrl: 'public/images/gudeg.jpg',
            onTap: () {
              print('Gudeg button tapped');
            },
          ),
          CategoryCard(
            label: 'Hot Dog',
            imageUrl: 'public/images/hotdog.jpg',
            onTap: () {
              print('Hot Dog button tapped');
            },
          ),
          CategoryCard(
            label: 'Burger',
            imageUrl: 'public/images/burger.jpg',
            onTap: () {
              print('Burger button tapped');
            },
          ),
          CategoryCard(
            label: 'Pizza',
            imageUrl: 'public/images/pizza.png',
            onTap: () {
              print('Pizza button tapped');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeGridList() {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryCard(
            label: 'breakfast',
            imageUrl: 'public/images/sarapn.jpg',
            onTap: () {
              controller.moveToResep();
              Get.toNamed(Routes.RESEP);
              print('Gudeg button tapped');
            },
          ),
          CategoryCard(
            label: 'have lunch',
            imageUrl: 'public/images/havelunch.png',
            onTap: () {
              controller.moveToResep();
              print('Hot Dog button tapped');
            },
          ),
          CategoryCard(
            label: 'dinner',
            imageUrl: 'public/images/dinner.jpg',
            onTap: () {
              controller.moveToResep();
              print('Burger button tapped');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantGrid() {
    return GridView.count(
      crossAxisCount: 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        RestaurantCard(
          name: 'Restaurant 1',
          imageUrl: 'public/images/rest1.jpg',
        ),
        RestaurantCard(
          name: 'Restaurant 2',
          imageUrl: 'public/images/rest2.jpg',
        ),
        RestaurantCard(
          name: 'Restaurant 3',
          imageUrl: 'public/images/rest3.jpg',
        ),
        RestaurantCard(
          name: 'Restaurant 4',
          imageUrl: 'public/images/rest4.png',
        ),
        RestaurantCard(
          name: 'Restaurant 5',
          imageUrl: 'public/images/rest5.jpg',
        ),
      ],
    );
  }
}

class AvatarWidget extends StatelessWidget {
  final String imageUrl;
  final bool isLeft;
  final Color backgroundColor;

  const AvatarWidget({
    super.key,
    required this.imageUrl,
    required this.isLeft,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: isLeft ? 10.0 : 0,
        right: isLeft ? 0 : 10.0,
      ),
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        backgroundImage: AssetImage(imageUrl),
        radius: 20.0,
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String label;
  final String imageUrl;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.label,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 20.0,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const RestaurantCard({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 20,
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                height: 120,
                width: 327,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Text(
                name,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? _selectedCategory;
  // ignore: unused_field
  File? _image;
  File? _video;
  final ImagePicker _picker = ImagePicker();
  VideoPlayerController? _videoPlayerController;

  // Instance AudioPlayer
  final AudioPlayer _audioPlayer = AudioPlayer();
  // ignore: unused_field
  bool _isPlaying = false;
  Duration _audioDuration = Duration.zero;
  Duration _currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _audioDuration = duration;
      });
    });
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _currentPosition = position;
      });
    });
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() {
        _isPlaying = false;
        _currentPosition = Duration.zero;
      });
    });
  }

  Future<void> _playAudio(String audioPath) async {
    try {
      await _audioPlayer.play(DeviceFileSource(audioPath));
      setState(() {
        _isPlaying = true;
      });
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  Future<void> _pauseAudio() async {
    try {
      await _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    } catch (e) {
      print("Error pausing audio: $e");
    }
  }

  Future<void> _stopAudio() async {
    try {
      await _audioPlayer.stop();
      setState(() {
        _isPlaying = false;
        _currentPosition = Duration.zero;
      });
    } catch (e) {
      print("Error stopping audio: $e");
    }
  }

  // Method untuk mengambil gambar
  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  // Method untuk mengambil video
  Future<void> _pickVideo() async {
    final pickedVideo = await _picker.pickVideo(source: ImageSource.camera);
    if (pickedVideo != null) {
      setState(() {
        _video = File(pickedVideo.path);
        _initializeVideoPlayer();
      });
    }
  }

  // Method untuk inisialisasi video player
  void _initializeVideoPlayer() {
    if (_video != null) {
      _videoPlayerController = VideoPlayerController.file(_video!)
        ..initialize().then((_) {
          setState(() {}); // Refresh untuk menampilkan video
          _videoPlayerController!.play(); // Auto play setelah diambil
        });
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaController mediaController = Get.put(MediaController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFF676767),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          AvatarWidget(
            imageUrl: 'public/images/keranjang.png',
            isLeft: false,
            backgroundColor: Color(0xFF181C2E),
          ),
          SizedBox(width: 10),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 126, 124, 124),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Color(0xFF676767)),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search dishes, restaurants',
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: mediaController.pickImage,
                    child: const Icon(Icons.camera_alt, size: 30),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: mediaController.pickVideo,
                    child: const Icon(Icons.videocam, size: 30),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildCategoryList(),
              const SizedBox(height: 20),
              if (_selectedCategory != null) _buildRestaurantGrid(),
              const SizedBox(height: 20),
              _buildAudioPlayer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAudioPlayer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Audio Player',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        SliderTheme(
          data: SliderThemeData(
            thumbColor: Colors.purple,
            activeTrackColor: Colors.purple,
            inactiveTrackColor: Colors.grey[300],
            overlayColor: Colors.purple.withOpacity(0.2),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
          ),
          child: Slider(
            value: _currentPosition.inSeconds.toDouble(),
            max: _audioDuration.inSeconds.toDouble(),
            onChanged: (value) {
              _audioPlayer.seek(Duration(seconds: value.toInt()));
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.play_arrow_rounded),
              iconSize: 40,
              color: Colors.purple,
              onPressed: () =>
                  _playAudio('public/images/music/SoundHelix-Song-1.mp3'),
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.pause_rounded),
              iconSize: 40,
              color: Colors.purple,
              onPressed: _pauseAudio,
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.stop_rounded),
              iconSize: 40,
              color: Colors.purple,
              onPressed: _stopAudio,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
        height: 50,
        child: Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CategoryCard(
                label: 'Gudeg',
                imageUrl: 'public/images/gudeg.jpg', // Gudeg image
                onTap: () {
                  setState(() {
                    _selectedCategory = 'Gudeg'; // Update selected category
                  });
                  print('Gudeg button tapped');
                },
              ),
              CategoryCard(
                label: 'Hot Dog',
                imageUrl: 'public/images/hotdog.jpg', // Hot Dog image
                onTap: () {
                  setState(() {
                    _selectedCategory = 'Hot Dog'; // Update selected category
                  });
                  print('Hot Dog button tapped');
                },
              ),
              CategoryCard(
                label: 'Burger',
                imageUrl: 'public/images/burger.jpg', // Burger image
                onTap: () {
                  setState(() {
                    _selectedCategory = 'Burger'; // Update selected category
                  });
                  print('Burger button tapped');
                },
              ),
              CategoryCard(
                label: 'Pizza',
                imageUrl: 'public/images/pizza.png', // Pizza image
                onTap: () {
                  setState(() {
                    _selectedCategory = 'Pizza'; // Update selected category
                  });
                  print('Pizza button tapped');
                },
              ),
            ],
          ),
        ));
  }

  Widget _buildRestaurantGrid() {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.6, // Set a fixed height for the grid
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics:
            const AlwaysScrollableScrollPhysics(), // Enable vertical scrolling
        children: const [
          RestaurantCard(
            name: 'Burger 1',
            imageUrl: 'public/images/burger/burger.jpg',
          ),
          RestaurantCard(
            name: 'Burger 2',
            imageUrl: 'public/images/burger/burger.jpg',
          ),
          RestaurantCard(
            name: 'Burger 3',
            imageUrl: 'public/images/burger/burger.jpg',
          ),
          RestaurantCard(
            name: 'Burger 4',
            imageUrl: 'public/images/burger/burger.jpg',
          ),
          RestaurantCard(
            name: 'Burger 5',
            imageUrl: 'public/images/burger/burger.jpg',
          ),
          RestaurantCard(
            name: 'Burger 6',
            imageUrl: 'public/images/burger/burger.jpg',
          ),
          RestaurantCard(
            name: 'Burger 7',
            imageUrl: 'public/images/burger/burger.jpg',
          ),
          RestaurantCard(
            name: 'Burger 8',
            imageUrl: 'public/images/burger/burger.jpg',
          ),
        ],
      ),
    );
  }
}
