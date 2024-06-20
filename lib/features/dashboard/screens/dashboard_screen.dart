import 'package:flutter/material.dart';
import 'package:freemo_test/common/widgets/custom_regular_title.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/global.dart';
import 'package:freemo_test/constants/padding.dart';
import 'package:freemo_test/constants/utils.dart';
import 'package:freemo_test/features/dashboard/widgets/custom_card.dart';
import 'package:freemo_test/models/article.dart';

enum Auth { register, login }

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<List<Article>> articles;

  void getAllArticles() {
    articles = articleService.getAllArticles(context);
  }

  @override
  void initState() {
    getAllArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          scrolledUnderElevation: 0,
          toolbarHeight: 0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(AppPadding.appPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.menu)),
                      const Row(
                        children: [
                          CustomRegularTitle(
                            title: "Hi BSM",
                            size: AppPadding.miniSpacer + 5,
                          ),
                          SizedBox(
                            width: AppPadding.miniSpacer,
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.defaultBorder,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: AppPadding.miniSpacer,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.balanceCard,
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppPadding.miniSpacer)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(AppPadding.appPadding * 2),
                      child: Column(
                        children: [
                          CustomRegularTitle(
                            title: "Total savings",
                            color: AppColors.onPrimary,
                            size: AppPadding.miniSpacer + 10,
                          ),
                          SizedBox(
                            height: AppPadding.miniSpacer,
                          ),
                          CustomRegularTitle(
                              title: "XAF 145 000 124",
                              color: AppColors.onPrimary,
                              size: AppPadding.smallSpacer - 5),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppPadding.smallSpacer,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCard(
                          backgroundColor: AppColors.surfaceWarning,
                          title: "Deposit"),
                      CustomCard(
                          backgroundColor: AppColors.surfacePrimary,
                          title: "Payment"),
                    ],
                  ),
                  const SizedBox(
                    height: AppPadding.smallSpacer - 5,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCard(
                          backgroundColor: AppColors.surfaceSecondary,
                          title: "Withdraw"),
                      CustomCard(
                          backgroundColor: AppColors.surfaceWarning,
                          title: "Tontine"),
                    ],
                  ),
                  const SizedBox(
                    height: AppPadding.smallSpacer,
                  ),
                  CustomRegularTitle(title: "Upcoming actions"),
                  const SizedBox(
                    height: AppPadding.miniSpacer,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: AppColors.defaultBorder.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(AppPadding.miniSpacer)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.miniSpacer),
                        child: Row(
                          children: [
                            Image.asset(
                              "${assetImg}article.png",
                              height: AppPadding.spacer,
                              width: AppPadding.spacer,
                            ),
                            const SizedBox(
                              width: AppPadding.miniSpacer,
                            ),
                            Expanded(
                                child: FutureBuilder(
                                    future: articles,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                            itemBuilder: (context, i) {
                                          return const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomRegularTitle(
                                                title: "TM Soluions",
                                                size: AppPadding.miniSpacer + 5,
                                              ),
                                              const SizedBox(
                                                height: AppPadding.miniSpacer,
                                              ),
                                              CustomRegularTitle(
                                                title: "Come lets ove be ddgud",
                                                weight: FontWeight.normal,
                                                size: AppPadding.miniSpacer,
                                              ),
                                            ],
                                          );
                                        });
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    }))
                          ],
                        ),
                      )),
                ],
              )),
        )),
      ),
    );
  }
}
