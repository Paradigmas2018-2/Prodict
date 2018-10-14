:- dynamic profile/2.

% engineering_course(Name, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, LikesPublicUniversities, LikesComputers)

engineering_course('Engenharia Aeronautica', s, s, s, s, _, _, n, s, s, _, _, n).
engineering_course('Engenharia Ambiental', s, n, s, _, n, _, s, n, s, n, _, n).
engineering_course('Engenharia Automotiva', s, s, s, s, _, _, _, s, _, s, _, n).
engineering_course('Engenharia Cartografica', s, n, n, n, n, _, s, s, s, n, n, n).
engineering_course('Engenharia da Computação', s, n, n, n, _, s, n, n, s, _, s, s).
engineering_course('Engenharia de Alimentos', s, n, n, s, n, _, s, n, s, n, _, n).
engineering_course('Engenharia de Controle e Automacao', s, _, s, _, s, _, n, _, _, s, _, s).
engineering_course('Engenharia de Horticultura', s, n, n, s, n, s, s, n, s, _, _, n).
engineering_course('Engenharia de Minas', s, n, s, n, _, s, s, _, s, n, _, n).
engineering_course('Engenharia de Petroleo e Gas', s, n, s, n, s, s, _, s, _, n, _, n).
engineering_course('Engenharia de Seguranca do Trabalho', s, n, n, s, n, _, n, _, s, n, _, n).
engineering_course('Engenharia de Software', s, n, n, s, _, n, n, n, n, s, _, s).
engineering_course('Engenharia Eletrica', s, _, n, _, _, _, n, _, s, _, _, n).
engineering_course('Engenharia Eletronica', s, n, n, _, s, _, n, _, s, s, _, s).
engineering_course('Engenharia Florestal', s, n, n, n, n, _, s, n, s, n, _, n).
engineering_course('Engenharia Industrial', s, _, s, s, _, n, n, s, s, _, _, n).
engineering_course('Engenharia Mecatronica', s, n, n, _, s, _, n, _, s, s, _, _).
engineering_course('Engenharia Naval', s, s, s, s, _, _, s, s, s, _, _, n).
engineering_course('Engenharia Sanitaria', s, n, s, n, n, _, n, n, s, n, _, n).
engineering_course('Engenharia em Tecnologia Textil e da Indumentaria', s, n, n, s, n, _, _, n, s, _, _, n).
engineering_course('Engenharia Acustica', s, n, n, s, n, _, s, n, s, _, _, n).
engineering_course('Engenharia Agricola', s, n, _, s, n, _, s, n, s, n, _, n).
engineering_course('Engenharia Biomedica', s, n, n, s, n, _, n, n, s, n, _, n).
engineering_course('Engenharia Civil', s, n, s, n, n, n, _, s, s, n, _, n).
engineering_course('Engenharia em Agrimensura', s, n, s, n, n, s, n, n, s, n, _, n).
engineering_course('Engenharia de Aquicultura', s, n, s, _, n, s, s, n, s, n, _, n).
engineering_course('Engenharia de Energia', s, n, n, _, n, _, s, n, s, n, _, n).
engineering_course('Engenharia de Materiais', s, n, n, s, n, s, n, _, s, n, _, n).
engineering_course('Engenharia de Pesca', s, n, n, n, n, s, s, n, s, n, _, n).
engineering_course('Engenharia de Producao', s, n, n, s, _, s, n, _, _, _, _, n).
engineering_course('Engenharia de Telecomunicacoes', s, n, n, n, _, s, n, n, _, _, _, s).
engineering_course('Engenharia Fisica', s, n, n, _, _, _, n, s, s, _, _, n).
engineering_course('Engenharia Hidrica', s, n, _, _, n, s, s, n, _, n, s, n).
engineering_course('Engenharia Mecanica', s, _, s, s, s, n, n, _, s, _, s, _).
engineering_course('Engenharia Metalurgica', s, n, n, s, n, n, s, n, s, n, s, n).
engineering_course('Engenharia Quimica', s, n, n, s, n, s, _, _, n, n, s, n).
engineering_course('Engenharia Textil', s, n, s, s, s, n, n, _, s, s, s, n).

start_game :-
  nl, write('Responda as perguntas e saiba quais engenharias mais se parecem com voce!'), nl, nl,
  user_likes_math.

end_game :-
  nl, nl, write('Boa sorte na sua escolha!'), nl, nl, !, halt.

query_possibilities(LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, LikesPublicUniversities, LikesComputers):- 
  findall(Y, engineering_course(Y, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, LikesPublicUniversities, LikesComputers), L),
  length(L, N), N == 0,
  write('Não consegui encontrar uma engenharia para você =('),
  end_game;
  findall(X, engineering_course(X, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, LikesPublicUniversities, LikesComputers), L),
  length(L, N), N @=< 3,
  write('São grandes as possibilidades de você gostar de: '), nl,
  forall(engineering_course(Name, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, LikesPublicUniversities, LikesComputers), (write('- '), write(Name), nl)),
  end_game.
  
query_all_remaining_possibilities(LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, LikesPublicUniversities, LikesComputers):-
  write('Foram muitas perguntas, mas acho que você se encaixaria em uma destas engenharias: '), nl,
  forall(engineering_course(Name, LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, LikesPublicUniversities, LikesComputers), (write('- '), write(Name), nl)),
  end_game.

user_likes_math :-
  write('Voce gosta de exatas (s/n)? '),
  read(Answer),
  asserta(profile(likesMath, Answer)),
  profile(likesMath, LikesMath),
  query_possibilities(LikesMath, _, _, _, _, _, _, _, _, _, _, _);
  user_likes_transports.

user_likes_transports :-
  write('Voce gosta do ramo de transportes (s/n)? '),
  read(Answer),
  asserta(profile(likesTransports, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  query_possibilities(LikesMath, LikesTransports, _, _, _, _, _, _, _, _, _, _);
  user_likes_buildings.

user_likes_buildings :-
  write('Voce gosta da area de estruturas (s/n)? '),
  read(Answer),
  asserta(profile(likesBuildings, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  query_possibilities(LikesMath, LikesTransports, LikesBuildings, _, _, _, _, _, _, _, _, _);
  user_likes_products.

user_likes_products :-
  write('Voce se interessa por engenharia de produtos (s/n)? '),
  read(Answer),
  asserta(profile(likesProducts, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  profile(likesProducts, LikesProducts),
  query_possibilities(LikesMath, LikesTransports, LikesBuildings, LikesProducts, _, _, _, _, _, _, _, _);
  user_likes_automation.

user_likes_automation :-
  write('Voce se interessa por robotica (s/n)? '),
  read(Answer),
  asserta(profile(likesAutomation, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  profile(likesProducts, LikesProducts),
  profile(likesAutomation, LikesAutomation),
  query_possibilities(LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, _, _, _, _, _, _, _);
  user_likes_studies.

user_likes_studies :-
  write('Voce prefere realizar estudos no lugar de produtos (s/n)? '),
  read(Answer),
  asserta(profile(likesStudies, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  profile(likesProducts, LikesProducts),
  profile(likesAutomation, LikesAutomation),
  profile(likesStudies, LikesStudies),
  query_possibilities(LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, _, _, _, _, _, _);
  user_likes_nature.

user_likes_nature :-
  write('Voce gosta de interagir com a natureza (s/n)? '),
  read(Answer),
  asserta(profile(likesNature, Answer)),
  profile(likesMath, LikesMath),
  profile(likesTransports, LikesTransports),
  profile(likesBuildings, LikesBuildings),
  profile(likesProducts, LikesProducts),
  profile(likesAutomation, LikesAutomation),
  profile(likesStudies, LikesStudies),
  profile(likesNature, LikesNature),
  query_possibilities(LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, _, _, _, _, _);
  user_likes_military.

user_likes_military :-
  write('Voce simpatiza com instituicoes militares (s/n)? '),
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
  query_possibilities(LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, _, _, _, _);
  user_likes_hardware.

user_likes_hardware :-
  write('Voce gostaria de construir coisas concretas, nao virtuais (s/n)? '),
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
  query_possibilities(LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, _, _, _);
  user_likes_electronics.

user_likes_electronics :-
  write('Voce se interessa por eletronicos (s/n)? '),
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
  query_possibilities(LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, _, _);
  user_wants_publicuniversities.

user_wants_publicuniversities :-
  write('Voce pretende cursar em uma instituicao publica (s/n)? '),
  read(Answer),
  asserta(profile(likesPublicUniversities, Answer)),
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
  profile(likesPublicUniversities, LikesPublicUniversities),
  query_possibilities(LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, LikesPublicUniversities, _);
  user_likes_computers.

user_likes_computers :-
  write('Voce gosta de entender o funcionamento de computadores (s/n)? '),
  read(Answer),
  asserta(profile(likesComputers, Answer)),
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
  profile(likesPublicUniversities, LikesPublicUniversities),
  profile(likesComputers, LikesComputers),
  query_possibilities(LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, LikesPublicUniversities, LikesComputers);
  user_likes_many_engineerings.

user_likes_many_engineerings :- 
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
  profile(likesPublicUniversities, LikesPublicUniversities),
  profile(likesComputers, LikesComputers),
  query_all_remaining_possibilities(LikesMath, LikesTransports, LikesBuildings, LikesProducts, LikesAutomation, LikesStudies, LikesNature, LikesMilitary, LikesHardware, LikesElectronics, LikesPublicUniversities, LikesComputers).

?- start_game.