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



List enderecos = [
  {
    "cep": "29306-380",
    "logradouro": "Praça República do Líbano",
    "complemento": "",
    "bairro": "Independência",
    "localidade": "Cachoeiro de Itapemirim",
    "uf": "ES",
    "ibge": "3201209",
    "gia": "",
    "ddd": "28",
    "siafi": "5623",
  },
  {
    "cep": "29300-100",
    "logradouro": "Rua 25 de Março",
    "complemento": "",
    "bairro": "Centro",
    "localidade": "Cachoeiro de Itapemirim",
    "uf": "ES",
    "ibge": "3201209",
    "gia": "",
    "ddd": "28",
    "siafi": "5623"
  },
];

List cartoes = [
  {
    "numero": "1234 1234 1234 1234",
    "validade": "12/2028",
    "cvv": "123",
    "nome": "João Henrique Cardozo",
    "cpf": "111.222.333-00",
  },
  {
    "numero": "1234 1234 1234 4321",
    "validade": "12/2028",
    "cvv": "123",
    "nome": "Lucas Carvalho de Almeida",
    "cpf": "111.222.333-00",
  },
];

List notificacoes = [
  {
    "titulo": "Conheça o alugUP",
    "descricao": "Venha conhecer nosso incrível app"
  },
  {
    "titulo": "Item disponível para aluguel",
    "descricao": "O item solicitado estã disponível para ser alugado"
  }
];




// ! Chat

final agora = DateTime.now();

List<Map<String, dynamic>> chatRenata = [
  {
    "msg": "Olá",
    "user": 1,
    "envio": DateTime(agora.year, agora.month, 2, 14, 35),
  },
  {
    "msg": "Oi, boa tarde",
    "user": 0,
    "envio": DateTime(agora.year, agora.month, 2, 14, 36),
  },
  {
    "msg": "Gostaria de alugar este item que você disponibilizou",
    "user": 1,
    "envio": DateTime(agora.year, agora.month, 2, 14, 37),
  },
  {
    "msg": "Tudo bem, este item seria a furadeira?",
    "user": 0,
    "envio": DateTime(agora.year, agora.month, 2, 14, 37),
  },
  {
    "msg": "Sim, isso mesmo",
    "user": 1,
    "envio": DateTime(agora.year, agora.month, 2, 14, 38),
  },
  {
    "msg": "Como que funciona essa furadeira?",
    "user": 1,
    "envio": DateTime(agora.year, agora.month, 2, 14, 38),
  },
];

List<Map<String, dynamic>> chatRonaldo = [
  {
    "msg": "Bom dia",
    "user": 0,
    "envio": DateTime(agora.year, agora.month, 5, 10, 11),
  },
  {
    "msg": "Olá, bom dia",
    "user": 1,
    "envio": DateTime(agora.year, agora.month, 5, 10, 11),
  },
  {
    "msg": "É sobre aquele item que combinamos",
    "user": 0,
    "envio": DateTime(agora.year, agora.month, 5, 10, 12),
  },
  {
    "msg": "Gostaria de saber onde acha melhor para a devolução",
    "user": 1,
    "envio": DateTime(agora.year, agora.month, 5, 10, 15),
  },
  {
    "msg": "Consegue me entragar no centro?",
    "user": 0,
    "envio": DateTime(agora.year, agora.month, 5, 10, 15),
  },
];

List<Map<String, dynamic>> chatArnaldo = [
  {
    "msg": "Olá, Arnaldo",
    "user": 0,
    "envio": DateTime(agora.year, agora.month, 5, 10, 11),
  },
  {
    "msg": "Olá",
    "user": 1,
    "envio": DateTime(agora.year, agora.month, 5, 10, 11),
  },
  {
    "msg": "Eu estava vendo alguns de seus itens disponíveis para aluguel",
    "user": 0,
    "envio": DateTime(agora.year, agora.month, 5, 10, 12),
  },
  {
    "msg": "Ah, sim, e o que achou?",
    "user": 1,
    "envio": DateTime(agora.year, agora.month, 5, 10, 15),
  },
  {
    "msg": "Gostei do produto",
    "user": 0,
    "envio": DateTime(agora.year, agora.month, 5, 10, 15),
  },
];