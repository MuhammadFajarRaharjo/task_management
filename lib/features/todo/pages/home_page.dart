import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/constants/box_size.dart';
import 'package:task_management/common/styles/app_colors.dart';
import 'package:task_management/common/styles/font_styles.dart';
import 'package:task_management/common/widgets/custom_text_form_field.dart';
import 'package:task_management/common/widgets/height.spacer.dart';
import 'package:task_management/common/widgets/width.spacer.dart';
import 'package:task_management/features/todo/widgets/custom_expansion_tile.dart';
import 'package:task_management/features/todo/widgets/todo_tile.dart';

import '../widgets/add_button.dart';
import '../widgets/todo_tab_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TextEditingController searchController;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    searchController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _todoAppBar(),
      body: ListView(
        children: [
          HeightSpacer.from20(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: BoxSize.padding20FW),
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.listCheck,
                  color: Colors.white,
                  size: 20,
                ),
                WidthSpacer.from10(),
                Text(
                  'Today\'s Task',
                  style: FontStyles.poppinsBold(size: 18, color: Colors.white),
                ),
              ],
            ),
          ),

          //* TAB BAR
          HeightSpacer.from20(),
          TodoTabBar(tabController: tabController),

          //* TAB BAR VIEW
          HeightSpacer.from20(),
          Container(
            height: BoxSize.proportionalScreenHeight(30),
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: BoxSize.padding20FW),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(BoxSize.radius12),
              color: AppColors.bkLight,
            ),
            child: TabBarView(
              controller: tabController,
              children: [
                //* CONTAIN 1
                Column(
                  children: [
                    TodoTile(
                      title: 'Today\'s task',
                      subtitle: 'Task untuk belajar',
                      timeStart: '13.00',
                      timeEnd: '13.01',
                      switchValue: false,
                      onDelete: () {},
                      onSwitchChanged: (value) {},
                    ),
                  ],
                ),
                //* CONTAIN 2
                Text(
                  'Contain 2',
                  style:
                      FontStyles.poppinsMedium(size: 20, color: Colors.white),
                ),
              ],
            ),
          ),

          //* LIST TASK
          HeightSpacer.from20(),
          CustomExpansionTile(
            margin: EdgeInsets.symmetric(horizontal: BoxSize.padding20FW),
            title: 'Task Today\'s',
            subtitle: 'Hari ini adalah task yang banyakbanyakbanyak',
          ),
          HeightSpacer.from20(),
          CustomExpansionTile(
            margin: EdgeInsets.symmetric(horizontal: BoxSize.padding20FW),
            title: 'Task Tomorrow\'s',
            subtitle: 'Hari ini adalah task yang banyakbanyakbanyak',
          ),
        ],
      ),
    );
  }

  ///* CUSTOM APP BAR
  AppBar _todoAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: BoxSize.padding20FW),
          child: Column(
            children: [
              //* TEXT DASHBOARD AND BUTTON ADD TASK
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dashboard',
                    style: FontStyles.poppinsBold(
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  AddButton(
                    onTap: () {},
                  ),
                ],
              ),
              HeightSpacer.from20(),

              //* SEARCH TASK
              CustomTextFormField(
                controller: searchController,
                hintText: 'Search',
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.greyLight,
                ),
                suffixIcon: const Icon(
                  FontAwesomeIcons.sliders,
                  color: AppColors.greyLight,
                  size: 20,
                ),
              ),
              HeightSpacer(size: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
