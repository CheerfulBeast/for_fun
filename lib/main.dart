import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricky_and_morty_simple_project/bloc/data_bloc.dart';
import 'package:ricky_and_morty_simple_project/bloc/data_event.dart';
import 'package:ricky_and_morty_simple_project/bloc/data_state.dart';
import 'package:ricky_and_morty_simple_project/data/model/data_model.dart';
import 'package:ricky_and_morty_simple_project/data/provider/data_provider.dart';
import 'package:ricky_and_morty_simple_project/data/repository/data_repository.dart';
import 'package:ricky_and_morty_simple_project/widgets/gridTile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => DataRepository(DataProvider()),
        child: BlocProvider(
          create: (context) => DataBloc(context.read<DataRepository>()),
          child: MyHomePage(title: 'Rick and Morty API'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  late DataModel dataModel;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<DataBloc>(context)
                    .add(LoadNewDataEvent(widget.dataModel));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<DataBloc, DataState>(builder: (context, state) {
        if (state is DataLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DataErrorState) {
          return const Text('Error in Loading Data from Rick and Morty API');
        }
        if (state is DataSuccessState) {
          List<Result> data = state.dataModel.results;

          return data.isEmpty
              ? const Center(
                  child: Text('No Data Available'),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200, childAspectRatio: 2),
                  itemBuilder: (context, index) {
                    // Provide a valid implementation for the itemBuilder function
                    widget.dataModel = state.dataModel;
                    return GridTileWidget(
                      data: data[index],
                    );
                  },
                  itemCount: data.length,
                );
        }

        return const SizedBox();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<DataBloc>().add(LoadDataEvent());
        },
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}
