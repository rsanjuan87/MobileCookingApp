import 'package:flutter/material.dart';
import '/gen/assets.gen.dart';
import '/widgets/cook_tip_card.dart';
import '/widgets/recipe_card.dart';
import '/widgets/recipe_of_day_section.dart';
import '/widgets/update_card.dart';
import 'recipes_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  var _selectedIndex = 0;

  TabController? _tabController;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onBrowseMoreTap() async {
    await _controller.forward();
    if (mounted) {
      _selectedIndex = 1;
      _tabController?.animateTo(_selectedIndex);
      _pageController?.animateToPage(_selectedIndex,
          curve: Curves.easeIn, duration: Duration(milliseconds: 300));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SafeArea(
            child: PageView(
          onPageChanged: (value) {
            _selectedIndex = value;
            _tabController?.animateTo(_selectedIndex);
          },
          controller: _pageController ??= PageController(initialPage: 0),
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Cooksy',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          const RecipeOfDaySection(
                            title: 'Recipe',
                            subtitle: 'of the day',
                            recipeName: 'Roasted Pumpkin Soup',
                            duration: 30,
                            servings: 4,
                            imagePath: 'assets/images/pumpkin_soup.jpg',
                          ),
                          const SizedBox(height: 32),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              children: [
                                CookTipCard(),
                                const SizedBox(height: 16),
                                UpdateCard(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      'René Redzepi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      'recommends you',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: const RecipeCard(
                      imagePath: 'assets/images/curry_soup.jpg',
                      title: 'Vegan Thai Curry Soup',
                      description:
                          'Spice lovers will slurp up this soup in seconds. Featuring chili powder, smoked paprika, and cayenne pepper, every bowl brings the heat.',
                      duration: 50,
                      servings: 4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30).copyWith(top: 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: _onBrowseMoreTap,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: const Text(
                          'Browse more recipes',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RecipesListScreen(),
            Container(color: Colors.red, child: Text('asd')),
            Container(color: Colors.blue, child: Text('asd')),
          ],
        )),
      ),
      bottomNavigationBar: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: TabBar(
            controller: _tabController ??=
                TabController(length: 4, vsync: this),
            onTap: _onItemTapped,
            indicator: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontSize: 10),
            unselectedLabelStyle: const TextStyle(fontSize: 10),
            dividerHeight: 0,
            labelPadding:
                const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
            tabs: [
              Tab(
                height: 50,
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.images.idea.image(
                      color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                      width: 20,
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Lightbulb', maxLines: 1),
                    )
                  ],
                ),
              ),
              Tab(
                height: 45,
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.images.todo.image(
                      color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                      width: 20,
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('My recipes', maxLines: 1),
                    ),
                  ],
                ),
              ),
              Tab(
                height: 45,
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.images.frying.image(
                      color: _selectedIndex == 2 ? Colors.white : Colors.grey,
                      width: 20,
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Cook now!', maxLines: 1),
                    )
                  ],
                ),
              ),
              Tab(
                height: 45,
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.images.settings.image(
                      color: _selectedIndex == 3 ? Colors.white : Colors.grey,
                      width: 20,
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Settings', maxLines: 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
    _pageController?.animateToPage(index,
        curve: Curves.easeIn, duration: Duration(milliseconds: 300));
  }
}
