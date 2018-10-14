:- style_check(-singleton).
:- dynamic profile/2.
:- dynamic engineering_course/12.
:- dynamic clearBase/1.
:- dynamic clearBase1/1.
:- dynamic play/0.
:- dynamic play/1.
:- dynamic user_likes_math/0.
:- dynamic user_likes_transports/0.
:- dynamic user_likes_buildings/0.
:- dynamic user_likes_products/0.
:- dynamic user_likes_automation/0.
:- dynamic user_likes_studies/0.
:- dynamic user_likes_nature/0.
:- dynamic user_likes_military/0.
:- dynamic user_likes_hardware/0.
:- dynamic user_likes_electronics/0.
:- dynamic user_wants_publicuniversities/0.
:- dynamic user_likes_computers/0.

%symbolic fact
profile(nothing, y_n).

clear_base(X):- clear_base1(X), fail.
  clear_base(X).

clear_base1(X):- retract(X).
  clear_base1(X).

% Name, Math, Transport, Building, Product, Automation, Studies, Nature, Military, Hardware, Electronics, PublicUniversities, Computer

engineering_course('Engenharia Aeronautica', y, y, n, y, n, y, n, y, y, n, y, n).
% engineering_course('Engenharia Ambiental', ).
% engineering_course('Engenharia Cartografica', ).
% engineering_course('Engenharia da Computação', ).
% engineering_course('Engenharia de Alimentos', ).
% engineering_course('Engenharia de Controle e Automacao', ).
% engineering_course('Engenharia de Horticultura', ).
% engineering_course('Engenharia de Minas', ).
% engineering_course('Engenharia de Petroleo e Gas', ).
% engineering_course('Engenharia de Seguranca do Trabalho', ).
% engineering_course('Engenharia Eletrica', ).
% engineering_course('Engenharia Florestal', ).
% engineering_course('Engenharia Industrial', ).
% engineering_course('Engenharia Mecatronica', ).
% engineering_course('Engenharia Naval', ).
% engineering_course('Engenharia Sanitaria', ).
% engineering_course('Engenharia em Tecnologia Textil e da Indumentaria', ).
% engineering_course('Engenharia Acustica', ).
% engineering_course('Engenharia Agricola', ).
% engineering_course('Engenharia Biomedica', ).
% engineering_course('Engenharia Civil', ).
% engineering_course('Engenharia em Agrimensura', ).
% engineering_course('Engenharia de Aquicultura', ).
% engineering_course('Engenharia de Energia', ).
% engineering_course('Engenharia de Materiais', ).
% engineering_course('Engenharia de Pesca', ).
% engineering_course('Engenharia de Producao', ).
% engineering_course('Engenharia de Telecomunicacoes', ).
% engineering_course('Engenharia Fisica', ).
% engineering_course('Engenharia Hidrica', ).
% engineering_course('Engenharia Mecanica', ).
% engineering_course('Engenharia Metalurgica', ).
% engineering_course('Engenharia Quimica', ).
% engineering_course('Engenharia Textil', ).

start_game :-
  clear_base(profile(profile, Yn)),
  nl, write('Responda as perguntas e saiba quais engenharias mais se parecem com voce!'), nl, nl,
  user_likes_math.

start_game(y) :-
  play.

start_game(n) :-
  nl, write('Boa sorte na sua escolha!'), nl, nl, !.

new_round :-
  nl, nl, write('Gostou do resultado? Voce pode tentar novamente: (y/n)? '),
	read(Desire),
	play(Desire).

user_likes_math :-
  write('Voce gosta de exatas (y/n)? '),
  read(Answer),
  asserta(profile(likesMath, Answer)),
  profile(likesMath, LikesMath),
  findall(X, engineering_course(X, LikesMath, _, _, _, _, _, _, _, _, _, _, _), L),
  length(L, N), N == 1,
  engineering_course(Z, LikesMath, _, _, _, _, _, _, _, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  user_likes_transports.

user_likes_transports :-
  profile(likesMath, n), asserta(profile(likesTransports, n)), fail;
  profile(likesMath, y),
  write('Voce gosta do ramo de transportes (y/n)? '),
  read(Answer),
  asserta(profile(likesTransports, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  findall(X, engineering_course(X, LikesMath, LikesTransports, _, _, _, _, _, _, _, _, _, _), L),
  length(L, N), N == 1,
  engineering_course(Z, LikesMath, LikesTransports, _, _, _, _, _, _, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  profile(likesMath, n), retract(profile(likesMath, n)), user_likes_math;
  user_likes_buildings.

user_likes_buildings :-
  write('Voce gosta da area de estruturas (y/n)? '),
  read(Answer),
  asserta(profile(likesBuildings, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  findall(X, engineering_course(X, LikesMath, LikesTransports, LikesBuildings, _, _, _, _, _, _, _, _, _), L),
  length(L, N), N == 1,
  engineering_course(Z, LikesMath, LikesTransports, LikesBuildings, _, _, _, _, _, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  user_likes_products.

user_likes_products :-
  write('Voce se interessa por engenharia de produtos (y/n)? '),
  read(Answer),
  asserta(profile(likesProducts, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  profile(likesProducts, LikesProducts),
  findall(X, engineering_course(X, LikesMath, LikesTransports, LikesBuildings, LikesProducts, _, _, _, _, _, _, _, _), L),
  length(L, N), N == 1,
  engineering_course(Z, LikesMath, LikesTransports, LikesBuildings, LikesProducts, _, _, _, _, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  user_likes_automation.

user_likes_automation :-
  write('Voce se interessa por robotica (y/n)? '),
  read(Answer),
  asserta(profile(likesAutomation, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  profile(likesProducts, LikesProducts),
  profile(likesAutomation, LikesAutomation),
  findall(X, engineering_course(X, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, _, _, _, _, _, _, _), L),
  length(L, N), N == 1,
  engineering_course(Z, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, _, _, _, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  user_likes_studies.

user_likes_studies :-
  write('Voce prefere realizar estudos no lugar de produtos (y/n)? '),
  read(Answer),
  asserta(profile(likesStudies, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  profile(likesProducts, LikesProducts),
  profile(likesAutomation, LikesAutomation),
  profile(likesStudies, LikesStudies),
  findall(X, engineering_course(X, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, _, _, _, _, _, _), L),
  length(L, N), N == 1,
  engineering_course(Z, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, _, _, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  user_likes_nature.

user_likes_nature :-
  write('Voce gosta de interagir com a natureza (y/n)? '),
  read(Answer),
  asserta(profile(likesNature, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  profile(likesProducts, LikesProducts),
  profile(likesAutomation, LikesAutomation),
  profile(likesStudies, LikesStudies),
  profile(likesNature, LikesNature),
  findall(X, engineering_course(X, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, _, _, _, _, _), L),
  length(L, N), N == 1,
  engineering_course(Z, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, _, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  user_likes_military.

user_likes_military :-
  write('Voce simpatiza com instituicoes militares (y/n)? '),
  read(Answer),
  asserta(profile(likesMilitary, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  profile(likesProducts, LikesProducts),
  profile(likesAutomation, LikesAutomation),
  profile(likesStudies, LikesStudies),
  profile(likesNature, LikesNature),
  profile(likesMilitary, LikesMilitary),
  findall(X, engineering_course(X, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, _, _, _, _), L),
  length(L, N), N == 1,
  engineering_course(Z, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  user_likes_hardware.

user_likes_hardware :-
  write('Voce gostaria de construir coisas concretas, nao virtuais (y/n)? '),
  read(Answer),
  asserta(profile(likesHardware, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  profile(likesProducts, LikesProducts),
  profile(likesAutomation, LikesAutomation),
  profile(likesStudies, LikesStudies),
  profile(likesNature, LikesNature),
  profile(likesMilitary, LikesMilitary),
  profile(likesHardware, LikesHardware),
  findall(X, engineering_course(X, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, _, _, _), L),
  length(L, N), N == 1,
  engineering_course(Z, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  user_likes_electronics.

user_likes_electronics :-
  write('Voce se interessa por eletronicos (y/n)? '),
  read(Answer),
  asserta(profile(likesElectronics, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  profile(likesProducts, LikesProducts),
  profile(likesAutomation, LikesAutomation),
  profile(likesStudies, LikesStudies),
  profile(likesNature, LikesNature),
  profile(likesMilitary, LikesMilitary),
  profile(likesHardware, LikesHardware),
  profile(likesElectronics, LikesElectronics),
  findall(X, engineering_course(X, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, _, _), L),
  length(L, N), N == 1,
  engineering_course(Z, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  user_wants_publicuniversities.

user_wants_publicuniversities :-
  write('Voce pretende cursar em uma instituicao publica (y/n)? '),
  read(Answer),
  asserta(profile(love, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  profile(likesProducts, LikesProducts),
  profile(likesAutomation, LikesAutomation),
  profile(likesStudies, LikesStudies),
  profile(likesNature, LikesNature),
  profile(likesMilitary, LikesMilitary),
  profile(likesHardware, LikesHardware),
  profile(likesElectronics, LikesElectronics),
  profile(love, LikesPublicUniversities),
  findall(X, engineering_course(X, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, LikesPublicUniversities, _), L),
  length(L, N), N == 1,
  engineering_course(Z, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, LikesPublicUniversities, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  user_likes_computers.

user_likes_computers :-
  write('Voce gosta de entender o funcionamento de computadores (y/n)? '),
  read(Answer),
  asserta(profile(honor, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  profile(likesProducts, LikesProducts),
  profile(likesAutomation, LikesAutomation),
  profile(likesStudies, LikesStudies),
  profile(likesNature, LikesNature),
  profile(likesMilitary, LikesMilitary),
  profile(likesHardware, LikesHardware),
  profile(likesElectronics, LikesElectronics),
  profile(love, LikesPublicUniversities),
  profile(honor, LikesComputers),
  findall(X, engineering_course(X, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, LikesPublicUniversities, LikesComputers), L),
  length(L, N), N == 1,
  engineering_course(Z, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, LikesPublicUniversities, LikesComputers),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  write('Arghhh!!! Não!!!'), new_round.