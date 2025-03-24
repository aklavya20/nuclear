import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const NuclearApp());
}

class NuclearApp extends StatelessWidget {
  const NuclearApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Nuclear()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/nuclear.png', height: 150),
      ),
    );
  }
}

class Nuclear extends StatefulWidget {
  const Nuclear({super.key});

  @override
  State<StatefulWidget> createState() {
    return NuclearState();
  }
}

class NuclearState extends State<Nuclear> {
  final TextEditingController commandController = TextEditingController();
  final TextEditingController targetController = TextEditingController();
  final TextEditingController serverController = TextEditingController();
  String? selectedTarget;
  String? selectedTargetFormat;
  String? selectedTemplates;
  String? selectedFiltering;
  String? selectedOutput;
  String? selectedConfigurations;
  String? selectedInteractsh;
  String? selectedFuzzing;
  String? selectedUncover;
  String? selectedRateLimit;
  String? selectedOptimizations;
  String? selectedHeadless;
  String? selectedDebug;
  String? selectedUpdate;
  String? selectedStatistics;
  String? selectedCloud;
  String? selectedAuthentication;
  String? selectedAll;
  String serverAddress = '';
  bool isScanning = false;
  final List<String> targetSelectionOptions = [
    '-u',
    '-l',
    '-eh',
    '-resume',
    '-sa',
    '-iv'
  ];
  final List<String> targetFormatOptions = ['-im', '-ro', '-sfv'];
  final List<String> templatesOptions = [
    '-nt',
    '-ntv',
    '-as',
    '-t',
    '-turl',
    '-w',
    '-wurl',
    '-validate',
    '-nss',
    '-td',
    '-tl',
    '-tgl',
    '-sign',
    '-code',
    '-dut'
  ];
  final List<String> filteringOptions = [
    '-a',
    '-tags',
    '-etags',
    '-itags',
    '-id',
    '-eid',
    '-it',
    '-et',
    '-em',
    '-s',
    '-es',
    '-pt',
    '-ept',
    '-tc'
  ];
  final List<String> outputOptions = [
    '-o',
    '-sresp',
    '-srd',
    '-silent',
    '-nc',
    '-j',
    '-irr',
    '-or',
    '-ot',
    '-nm',
    '-ts',
    '-rdb',
    '-ms',
    '-me',
    '-se',
    '-je',
    '-jle'
  ];
  final List<String> configurationsOptions = [
    '-config',
    '-tp',
    '-tpl',
    '-fr',
    '-fhr',
    '-mr',
    '-dr',
    '-rc',
    '-H',
    '-V',
    '-r',
    '-sr',
    '-dc',
    '-passive',
    '-fh2',
    '-ev',
    '-cc',
    '-ck',
    '-ca',
    '-sml',
    '-ztls',
    '-sni',
    '-dt',
    '-dka',
    '-lfa',
    '-lna',
    '-i',
    '-at',
    '-sip',
    '-rsr',
    '-rss',
    '-rrt',
    '-reset',
    '-tlsi',
    '-hae'
  ];
  final List<String> interactshOptions = [
    '-iserver',
    '-itoken',
    '-interactions-cache- size',
    '-interactions-eviction',
    '-interactions-poll- duration',
    '-interactions-cooldown- period',
    '-ni'
  ];
  final List<String> fuzzingOptions = [
    '-ft',
    '-fm',
    '-fuzz',
    '-dast',
    '-dfp',
    '-fuzz-param-frequency',
    '-fa'
  ];
  final List<String> uncoverOptions = [
    '-uc',
    '-uq',
    '-ue',
    '-uf',
    '-ul',
    '-ur'
  ];
  final List<String> ratelimitOptions = [
    '-rl',
    '-rld',
    '-rlm',
    '-bs',
    '-c',
    '-hbs',
    '-headc',
    '-jsc',
    '-pc',
    '-prc'
  ];
  final List<String> optimizationsOptions = [
    '-timeout',
    '-retries',
    '-ldp',
    '-mhe',
    '-te',
    '-nmhe',
    '-project',
    '-project-path',
    '-spm',
    '-stream',
    '-ss',
    '-irt',
    '-nh',
    '-no-stdin'
  ];
  final List<String> headlessOptions = [
    '-headless',
    '-page-timeout',
    '-sb',
    '-ho',
    '-sc',
    '-lha'
  ];
  final List<String> debugOptions = [
    '-debug',
    '-dreq',
    '-dresp',
    '-p',
    '-pi',
    '-ldf',
    '-tlog',
    '-elog',
    '-version',
    '-hm',
    '-v',
    '-profile-mem',
    '-vv',
    '-svd',
    '-ep',
    '-tv',
    '-hc'
  ];
  final List<String> updateOptions = ['-ut', '-ud', '-duc'];
  final List<String> statisticsOptions = ['-stats', '-sj', '-si', '-mp'];
  final List<String> cloudOptions = ['-auth', '-cup', '-sid', '-sname'];
  final List<String> authenticationsOptions = ['-sf', '-ps'];
  final List<String> allOptions = [
    '-u',
    '-l',
    '-eh',
    '-resume',
    '-sa',
    '-iv',
    '-nt',
    '-ntv',
    '-as',
    '-t',
    '-turl',
    '-w',
    '-wurl',
    '-validate',
    '-nss',
    '-td',
    '-tl',
    '-tgl',
    '-sign',
    '-code',
    '-dut',
    '-a',
    '-tags',
    '-etags',
    '-itags',
    '-id',
    '-eid',
    '-it',
    '-et',
    '-em',
    '-s',
    '-es',
    '-pt',
    '-ept',
    '-tc',
    '-o',
    '-sresp',
    '-srd',
    '-silent',
    '-nc',
    '-j',
    '-irr',
    '-or',
    '-ot',
    '-nm',
    '-ts',
    '-rdb',
    '-ms',
    '-me',
    '-se',
    '-je',
    '-jle',
    '-config',
    '-tp',
    '-tpl',
    '-fr',
    '-fhr',
    '-mr',
    '-dr',
    '-rc',
    '-H',
    '-V',
    '-r',
    '-sr',
    '-dc',
    '-passive',
    '-fh2',
    '-ev',
    '-cc',
    '-ck',
    '-ca',
    '-sml',
    '-ztls',
    '-sni',
    '-dt',
    '-dka',
    '-lfa',
    '-lna',
    '-i',
    '-at',
    '-sip',
    '-rsr',
    '-rss',
    '-rrt',
    '-reset',
    '-tlsi',
    '-hae',
    '-iserver',
    '-itoken',
    '-interactions-cache- size',
    '-interactions-eviction',
    '-interactions-poll- duration',
    '-interactions-cooldown- period',
    '-ni',
    '-ft',
    '-fm',
    '-fuzz',
    '-dast',
    '-dfp',
    '-fuzz-param-frequency',
    '-fa',
    '-uc',
    '-uq',
    '-ue',
    '-uf',
    '-ul',
    '-ur',
    '-rl',
    '-rld',
    '-rlm',
    '-bs',
    '-c',
    '-hbs',
    '-headc',
    '-jsc',
    '-pc',
    '-prc',
    '-timeout',
    '-retries',
    '-ldp',
    '-mhe',
    '-te',
    '-nmhe',
    '-project',
    '-project-path',
    '-spm',
    '-stream',
    '-ss',
    '-irt',
    '-nh',
    '-no-stdin',
    '-headless',
    '-page-timeout',
    '-sb',
    '-ho',
    '-sc',
    '-lha',
    '-debug',
    '-dreq',
    '-dresp',
    '-p',
    '-pi',
    '-ldf',
    '-tlog',
    '-elog',
    '-version',
    '-hm',
    '-v',
    '-profile-mem',
    '-vv',
    '-svd',
    '-ep',
    '-tv',
    '-hc',
    '-ut',
    '-ud',
    '-duc',
    '-stats',
    '-sj',
    '-si',
    '-mp',
    '-auth',
    '-cup',
    '-sid',
    '-sname',
    '-sf',
    '-ps',
  ];

  void updateCommand() {
    String command = 'sudo nuclei';
    if (selectedTarget != null) command += ' $selectedTarget';
    if (selectedTargetFormat != null) command += ' $selectedTargetFormat';
    if (selectedTemplates != null) command += ' $selectedTemplates';
    if (selectedFiltering != null) command += ' $selectedFiltering';
    if (selectedOutput != null) command += ' $selectedOutput';
    if (selectedConfigurations != null) command += ' $selectedConfigurations';
    if (selectedInteractsh != null) command += ' $selectedInteractsh';
    if (selectedFuzzing != null) command += ' $selectedFuzzing';
    if (selectedUncover != null) command += ' $selectedUncover';
    if (selectedRateLimit != null) command += '$selectedRateLimit';
    if (selectedOptimizations != null) command += ' $selectedOptimizations';
    if (selectedHeadless != null) command += '$selectedHeadless';
    if (selectedDebug != null) command += ' $selectedDebug';
    if (selectedUpdate != null) command += '$selectedUpdate';
    if (selectedStatistics != null) command += '$selectedStatistics';
    if (selectedCloud != null) command += '$selectedCloud';
    if (selectedAuthentication != null) command += '$selectedAuthentication';
    if (selectedAll != null) command += '$selectedAll';
    commandController.text = command;
  }

  Future<String> sendCommandtoServer(String command) async {
    final url = Uri.parse(serverAddress);
    final request = await http.post(url, body: {
      'command': command,
    });
    if (request.statusCode == 200) {
      return request.body;
    } else {
      showToast("Error:${request.statusCode}");
      throw Exception("Failed to execute nuclei Scan");
    }
  }

  Future<void> startScan() async {
    String command = commandController.text;
    String target = targetController.text;
    if (target.isEmpty) {
      showToast("Please enter a target.");
      return;
    }
    command += ' $target';
    commandController.text = command;
    try {
      showToast("Scan Started on $target");
      final nucleiOutput = await sendCommandtoServer(command);
      saveScan(nucleiOutput);
    } catch (e) {
      showToast("Error executing scan: $e");
    }
  }

  Future<void> saveScan(String nucleiOutput) async {
    String output = selectedOutput ?? 'txt';
    String fileExtension = '.txt';
    final outputFolder = await getApplicationDocumentsDirectory();
    final String outputFolderPath = outputFolder.path;
    switch (output) {
      case 'txt':
        fileExtension = '.txt';
        break;
      case 'xml':
        fileExtension = '.xml';
        break;
      case 'json':
        fileExtension = '.json';
        break;
      case 'htm':
        fileExtension = '.html';
        break;
      case 'csv':
        fileExtension = '.csv';
        break;
      case 'sql':
        fileExtension = '.sql';
        break;
      case 'nbe':
        fileExtension = '.nbe';
        break;
      case 'sarif':
        fileExtension = '.sarif';
        break;
    }
    final now = DateTime.now();
    final fileName = 'scan_result_${now.millisecondsSinceEpoch}$fileExtension';
    final filePath = '${outputFolder.path}/$fileName';
    final file = File(filePath);
    try {
      await file.create(recursive: true);
      await file.writeAsString(nucleiOutput);
      showToast('File Saved to $outputFolderPath');
    } catch (e) {
      showToast("Scan Failed");
    }
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuclear"),
        actions: [
          IconButton(
            icon: const Icon(Icons.terminal_outlined),
            onPressed: () async {
              final newServer = await showDialog<String>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Server Address'),
                  content: TextField(
                    controller: serverController,
                    decoration: InputDecoration(
                        hintText: "Enter server address",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(11),
                        )),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                        child: const Text('Save'),
                        onPressed: () {
                          setState(() {
                            serverAddress = serverController.text;
                          });
                          Navigator.pop(context);
                        }),
                  ],
                ),
              );
              if (newServer != null) {
                setState(() {
                  serverAddress = newServer;
                });
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 6.0,
                left: 6.0,
                right: 6.0,
                bottom: 0.0,
              ),
              child: TextField(
                controller: commandController,
                decoration: InputDecoration(
                  labelText: 'Command',
                  contentPadding: const EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextField(
                controller: targetController,
                decoration: InputDecoration(
                  hintText: 'ip.of.the.target or domain name',
                  labelText: 'Target',
                  contentPadding: const EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
              ),
            ),
            buildDropdownRow('Target Selction', targetSelectionOptions,
                'Target Format', targetFormatOptions, (value) {
              setState(() {
                selectedTarget = value;
                updateCommand();
              });
            }, (value) {
              setState(() {
                selectedTargetFormat = value;
                updateCommand();
              });
            }),
            buildDropdownRow(
                'Templates', templatesOptions, 'Filtering', filteringOptions,
                (value) {
              setState(() {
                selectedTemplates = value;
                updateCommand();
              });
            }, (value) {
              setState(() {
                selectedFiltering = value;
                updateCommand();
              });
            }),
            buildDropdownRow('Output', outputOptions, 'Configurations',
                configurationsOptions, (value) {
              setState(() {
                selectedOutput = value;
                updateCommand();
              });
            }, (value) {
              setState(() {
                selectedConfigurations = value;
                updateCommand();
              });
            }),
            buildDropdownRow(
                'Interactsh', interactshOptions, 'Fuzzing', fuzzingOptions,
                (value) {
              setState(() {
                selectedInteractsh = value;
                updateCommand();
              });
            }, (value) {
              setState(() {
                selectedFuzzing = value;
                updateCommand();
              });
            }),
            buildDropdownRow(
                'Uncover', uncoverOptions, 'Rate Limit', ratelimitOptions,
                (value) {
              setState(() {
                selectedUncover = value;
                updateCommand();
              });
            }, (value) {
              setState(() {
                selectedRateLimit = value;
                updateCommand();
              });
            }),
            buildDropdownRow('Optimizations', optimizationsOptions, 'Headless',
                headlessOptions, (value) {
              setState(() {
                selectedOptimizations = value;
                updateCommand();
              });
            }, (value) {
              setState(() {
                selectedHeadless = value;
                updateCommand();
              });
            }),
            buildDropdownRow('Debug', debugOptions, 'Update', updateOptions,
                (value) {
              setState(() {
                selectedDebug = value;
                updateCommand();
              });
            }, (value) {
              setState(() {
                selectedUpdate = value;
                updateCommand();
              });
            }),
            buildDropdownRow(
                'Statistics', statisticsOptions, 'Cloud', cloudOptions,
                (value) {
              setState(() {
                selectedStatistics = value;
                updateCommand();
              });
            }, (value) {
              setState(() {
                selectedCloud = value;
                updateCommand();
              });
            }),
            buildDropdownRow('Authentication', authenticationsOptions,
                'All Options', allOptions, (value) {
              setState(() {
                selectedStatistics = value;
                updateCommand();
              });
            }, (value) {
              setState(() {
                selectedCloud = value;
                updateCommand();
              });
            }),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: ElevatedButton(
                onPressed: () {
                  startScan();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 60),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: isScanning
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Scan',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.atom,
              color: Colors.grey,
            ),
            label: "NUCLEAR",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: "SCAN RESULT",
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Nuclear()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ScanResult()),
            );
          }
        },
      ),
    );
  }

  Widget buildDropdownRow(
      String label1,
      List<String> options1,
      String label2,
      List<String> options2,
      ValueChanged<String?> onChanged1,
      ValueChanged<String?> onChanged2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label1),
                  DropdownButtonFormField2<String>(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    isExpanded: true,
                    hint: const Text('Select'),
                    items: options1
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: onChanged1,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label2),
                  DropdownButtonFormField2<String>(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    isExpanded: true,
                    hint: const Text('Select'),
                    items: options2
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: onChanged2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScanResult extends StatefulWidget {
  const ScanResult({super.key});

  @override
  State<StatefulWidget> createState() {
    return ScanResultState();
  }
}

class ScanResultState extends State<ScanResult> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Nuclear"),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.code_off),
                text: "XML",
              ),
              Tab(
                icon: Icon(Icons.list_alt),
                text: "TEXT",
              ),
              Tab(
                icon: Icon(Icons.html_outlined),
                text: "HTML",
              ),
              Tab(
                icon: Icon(Icons.javascript),
                text: "JSON",
              ),
              Tab(
                icon: Icon(Icons.storage),
                text: "SQL",
              ),
              Tab(
                icon: Icon(Icons.drive_file_move),
                text: "CSV",
              ),
              Tab(
                icon: Icon(Icons.security_outlined),
                text: "NBE",
              ),
              Tab(
                icon: Icon(Icons.text_format),
                text: "SARIF",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ScanFileList(extension: 'xml'),
            ScanFileList(extension: 'txt'),
            ScanFileList(extension: 'html'),
            ScanFileList(extension: 'json'),
            ScanFileList(extension: 'sql'),
            ScanFileList(extension: 'csv'),
            ScanFileList(extension: 'nbe'),
            ScanFileList(extension: 'sarif'),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.atom, color: Colors.grey),
              label: "NUCLEAR",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              label: "SCAN RESULT",
            ),
          ],
          currentIndex: 0,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Nuclear()),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ScanResult()),
              );
            }
          },
        ),
      ),
    );
  }
}

class ScanFileList extends StatelessWidget {
  final String extension;
  const ScanFileList({required this.extension, Key? key}) : super(key: key);

  Future<List<File>> getScanFiles(String extension) async {
    final directory = await getApplicationDocumentsDirectory();
    final files = directory
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith(extension))
        .toList();
    return files;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<File>>(
      future: getScanFiles(extension),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final files = snapshot.data!;
        return ListView.builder(
          itemCount: files.length,
          itemBuilder: (context, index) {
            final file = files[index];
            return ListTile(
              title: Text(file.path.split('/').last),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScanDetailPage(file: file),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class ScanDetailPage extends StatelessWidget {
  final File file;
  const ScanDetailPage({required this.file, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final extension = file.path.split('.').last;
    return Scaffold(
      appBar: AppBar(
        title: Text(file.path.split('/').last),
      ),
      body: FutureBuilder<String>(
        future: file.readAsString(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final content = snapshot.data!;
          if (extension == 'xml') {
            return SingleChildScrollView(child: Text(content));
          } else if (extension == 'txt' || extension == 'grepable') {
            return SingleChildScrollView(child: Text(content));
          } else if (extension == 'html') {
            return SingleChildScrollView(child: Text(content));
          } else if (extension == 'csv' ||
              extension == 'json' ||
              extension == 'sql' ||
              extension == 'nbe' ||
              extension == 'sarif') {
            return SingleChildScrollView(child: Text(content));
          } else {
            return const Center(child: Text("Unsupported format"));
          }
        },
      ),
    );
  }
}
