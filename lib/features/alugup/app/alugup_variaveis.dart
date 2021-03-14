import 'package:alugup/features/alugup/models/usuario.dart';
import 'package:flutter/material.dart';

// ! VARIAVEIS GLOBAIS
int INDICEATUAL = 0; // ? INDICE DO BOTTOM NAVIGATION BAR
User usuario = User(); // ? DADOS DO USUARIO LOGADO
Map dados2 = {};
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// ! CONSTANTES APIS
const String URL_BASE = "venver.app/";
const String URL_BASE_WEB_APP = "venver.app/";
const int API_FORA_DO_AR = 0;
const int CODE_USUARIO_NAO_ENCONTRADO = 9001;
const int CODE_TOTAL_INVALIDO = 9024;
const int CODE_HORARIO_AGENDAMENTO_INDISPONIVEL = 9025;
const int CODE_SENHA_ANTIGA_INVALIDA = 9027;
const Map<String, dynamic> MAP_ERRO_VAZIO = {"erro": "vazio"};
const Map<String, dynamic> MAP_ERRO_API = {
  "code": API_FORA_DO_AR,
  "erro": "Houve um erro",
};

List alugueisRealizados = [
  {
    "preco": "R\$ 68,00",
    "title": "Macaco hidráulico",
    "quantidade": 1,
    "imagem":
        "https://media.discordapp.net/attachments/723953996645138463/783794445803585546/macaco.png",
    "dataAluguel": "12/11/2020",
    "periodoAlugado": "48",
  },
  {
    "preco": "R\$ 25,75",
    "title": "Bola",
    "quantidade": 2,
    "imagem":
        "https://media.discordapp.net/attachments/723953996645138463/783794045443899412/football-20180823085945694.png",
    "dataAluguel": "29/11/2020",
    "periodoAlugado": "24",
  },
];
