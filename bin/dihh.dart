// wahh ini banyak yang pakee
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<String> sendRequest(String inputText) async {
  final response = await http.post(
    Uri.parse('https://api.simsimi.vn/v1/simtalk'),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: 'text=$inputText&lc=id',
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return jsonResponse['message'] ?? 'gaada respon';
  } else {
    return 'gaada respon';
  }
}

Future<void> main() async {
  while (true) {
    stdout.write('you>: ');
    final inputText = stdin.readLineSync();

    if (inputText == null || inputText.toLowerCase() == 'exit') {
      print('baybayyy...');
      break;
    }

    final responseMessage = await sendRequest(inputText);
    print('bot>: $responseMessage');
  }
}
