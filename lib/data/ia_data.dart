import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> sendToChatGPT(String message) async {
  const apiKey = 'CHAVE API VEM AQUI';
  const url = 'https://api.openai.com/v1/chat/completions';

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'model': 'gpt-3.5-turbo',
      'messages': [
        {'role': 'system', 'content': 'Você é o bot oficial da torcida FURIA, responda como se fosse um torcedor fanático, mas com informação.'},
        {'role': 'user', 'content': message},
      ],
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(utf8.decode(response.bodyBytes));
    return data['choices'][0]['message']['content'].toString().trim();
  } else {
    print('Erro: ${response.statusCode} ${response.body}');
    return '❌ Erro ao se conectar com a IA.';
  }
}
