import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/bloc/magazine/magazine_bloc.dart';
import 'package:movie_app/bloc/magazine/magazine_event.dart';
import 'package:movie_app/bloc/magazine/magazine_state.dart';
import 'package:movie_app/data/model/Magazine/Data.dart';

import '../../data/model/Magazine/Magazine.dart';
import '../../widgets/web_view_container.dart';

/// Flutter code sample for [Card].
class MagazineScreen extends StatefulWidget {
  const MagazineScreen({super.key});

  @override
  State<MagazineScreen> createState() => _MagazineScreenState();
}

class _MagazineScreenState extends State<MagazineScreen> {
  @override
  void initState() {
    BlocProvider.of<MagazineBloc>(context).add(MagazineInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff1F2722),
            Color(0xff131312),
          ],
        ),
      ),
      child:
          BlocBuilder<MagazineBloc, MagazineState>(builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: CustomScrollView(
              slivers: [
                if (state is MagazineLoadingState) ...{
                  const SliverToBoxAdapter(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                } else ...{
                  if (state is MagazineSuccessResponseState) ...{
                    state.getMagazine.fold(
                      (l) => Text("sth went wrong"),
                      (magazine) => SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return MagazineContainer(magazine.data![index]);
                            },
                            childCount: magazine.data!.length,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 5,
                            childAspectRatio: 2.6,
                          ),
                        ),
                      ),
                    )
                  }
                }
              ],
            ),
          ),
        );
      }),
    );
  }
}

class MagazineContainer extends StatelessWidget {
  Data magazine;
  MagazineContainer(
    this.magazine, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff9496c1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return WebViewContainer(magazine.url);
                }),
              );
            },
            leading: const Icon(
              Icons.menu_book_sharp,
              color: Colors.black,
              size: 30,
            ),
            title: Text(
              magazine.name!,
              style: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              magazine.url!,
              style: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: Text(
                  'See Magazine',
                  style: GoogleFonts.raleway(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return WebViewContainer(magazine.url);
                    }),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
