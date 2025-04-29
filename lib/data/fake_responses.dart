Future<String> sendToChatGPT(String prompt) async {
  await Future.delayed(Duration(seconds: 1));
  final lower = prompt.toLowerCase();

  if (lower.contains('quem joga') || lower.contains('quem são os jogadores') || lower.contains('quem está no time') || lower.contains('jogadores da furia')) {
    return '👥 Elenco atual da FURIA: \n- KSCERATO (entry) \n- yuurih (rifler) \n- arT (IGL) \n- FalleN (AWPer) \n- chelo (support)';
  } else if (lower.contains('quando é o próximo jogo') || lower.contains('quando a furia joga') || lower.contains('qual o próximo jogo')) {
    return '📅 Próximos confrontos: \n🆚 NAVI – 25/04 às 18h \n🆚 FaZe – 27/04 às 20h';
  } else if (lower.contains('como começou') || lower.contains('quando foi criada') || lower.contains('história da furia')) {
    return '🔥 A FURIA Esports foi fundada em 2017 e ficou conhecida pelo estilo agressivo e estratégico no CS:GO. Desde então, vem ganhando destaque internacional.';
  } else if (lower.contains('quantos títulos') || lower.contains('o que a furia ganhou') || lower.contains('conquistas da furia')) {
    return '🏆 Principais conquistas: \n- CBCS Elite League \n- ESL Challenger Anaheim \n- Top 4 na IEM Rio Major 2022';
  } else if (lower.contains('curiosidade') || lower.contains('fato interessante')) {
    return '🎯 Curiosidade: A FURIA foi o primeiro time brasileiro a investir em um projeto de desenvolvimento de talentos nos EUA, com gaming house própria.';
  } else {
    return '🤖 Pergunte algo como: \n- Quem são os jogadores da FURIA? \n- Quando é o próximo jogo? \n- Qual a história da FURIA? \n- Quantos títulos eles têm? \n- Me conta uma curiosidade sobre o time!';
}
}