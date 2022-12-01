part of '../viewmodel/tab_controller_viewmodel.dart';

class TabControllerView extends StatefulWidget {
  const TabControllerView({Key? key}) : super(key: key);

  @override
  State<TabControllerView> createState() => _TabControllerViewState();
}

class _TabControllerViewState extends TabControllerViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: _appBar(context),
      body: pages[currentIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppPaddings.padding15.padding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.radius40.radius),
          child: _bottomNavAppBar(),
        ),
      ),
    );
  }

  BottomNavigationBar _bottomNavAppBar() {
    return BottomNavigationBar(
      items: navBarItems,
      currentIndex: currentIndex,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(AppConstants.getInstance.appTitle),
      actions: [
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(LocaleKeys.drawer_language).tr(),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          onTap: () => context.setLocale(
                              LocalizationManager.getInstance.trLocale),
                          title: const Text('TR-tr'),
                        ),
                        ListTile(
                          onTap: () => context.setLocale(
                              LocalizationManager.getInstance.enLocale),
                          title: const Text('EN-us'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.translate))
      ],
    );
  }
}
