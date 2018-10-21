:-use_module(library(lists)).
:-dynamic pieces/2.

%dados de peças
pieces(w1, [[x,x,x,x,x],
			[x,x,x,x,x],
			[x,x,e,x,x],
			[x,x,e,x,x],
			[x,x,x,x,x]]).
pieces(w2, [[x,x,x,x,x],
			[x,x,x,x,x],
			[x,x,e,x,x],
			[x,x,e,x,x],
			[x,x,x,x,x]]).
pieces(w3, [[x,x,x,x,x],
			[x,x,x,x,x],
			[x,x,e,x,x],
			[x,x,e,x,x],
			[x,x,x,x,x]]).
pieces(w4, [[x,x,x,x,x],
			[x,x,x,x,x],
			[x,x,e,x,x],
			[x,x,e,x,x],
			[x,x,x,x,x]]).
pieces(w5, [[x,x,x,x,x],
			[x,x,x,x,x],
			[x,x,e,x,x],
			[x,x,e,x,x],
			[x,x,x,x,x]]).
pieces(w6, [[x,x,x,x,x],
			[x,x,x,x,x],
			[x,x,e,x,x],
			[x,x,e,x,x],
			[x,x,x,x,x]]).

pieces(b1, [[x,x,x,x,x],
			[x,x,e,x,x],
			[x,x,e,x,x],
			[x,x,x,x,x],
			[x,x,x,x,x]]).
pieces(b2, [[x,x,x,x,x],
			[x,x,e,x,x],
			[x,x,e,x,x],
			[x,x,x,x,x],
			[x,x,x,x,x]]).
pieces(b3, [[x,x,x,x,x],
			[x,x,e,x,x],
			[x,x,e,x,x],
			[x,x,x,x,x],
			[x,x,x,x,x]]).
pieces(b4, [[x,x,x,x,x],
			[x,x,e,x,x],
			[x,x,e,x,x],
			[x,x,x,x,x],
			[x,x,x,x,x]]).
pieces(b5, [x,x,x,x,x],
			[x,x,e,x,x],
			[x,x,e,x,x],
			[x,x,x,x,x],
			[x,x,x,x,x]]).
pieces(b6, [[x,x,x,x,x],
			[x,x,e,x,x],
			[x,x,e,x,x],
			[x,x,x,x,x],
			[x,x,x,x,x]]).

%organizacao do tabuleiro

initial_board([[w1,w2,w3,w4,w5,w6],
		[x,x,x,x,x,x],
		[x,x,x,x,x,x],
		[x,x,x,x,x,x],
		[x,x,x,x,x,x],
		[b1,b2,b3,b4,b5,b6]]).

intermediate_board([[x,x,x,x,x,x],
		[w1,x,x,x,x,x],
		[x,x,b4,b6,x,w6],
		[x,b1,x,x,b3,x],
		[x,x,w3,x,x,x],
		[x,x,x,x,x,x]]).

final_board([[x,x,x,x,x,x],
		[x,x,x,x,x,x],
		[b1,x,x,x,x,x],
		[x,x,w1,x,x,x],
		[x,x,x,x,x,w3],
		[x,x,x,x,x,x]]).

final_board2([[x,x,x,x,x,x],
		[x,x,x,x,x,x],
		[b1,x,x,x,x,x],
		[x,x,w1,x,x,x],
		[x,x,x,x,x,w3],
		[x,b5,x,x,x,x]]).

%representação do tabuleiro
display_limite_sup :-
	write(' __ __ __ __ __ __ '),nl.

display_limite :-
	write('|__|__|__|__|__|__|'),nl.


display_game(Board, Player) :-
	display_limite_sup,
	display_line(Board).

display_line([]).
display_line([X|Sobras]) :-
	write('|'),
	display_ele(X),
	nl,
	display_limite,
	display_line(Sobras).

write_piece(x) :- write('  ').
write_piece(X) :- write(X).

display_ele([]).
display_ele([Ele|Resto]) :-
	write_piece(Ele),
	write('|'),
	display_ele(Resto).

%Representacao de peças
piece_display_header(X) :-
	write(' _ _ _ _ _ '),nl,
	write('| Piece '), write(X), write('|'),nl,
	write('|_ _ _ _ _|'),nl.

piece_display(P) :-
	pieces(P, Board),
	piece_display_header(P),
	piece_display_line(Board).

piece_display_line([]).
piece_display_line([X|Xs]) :-
	piece_display_eigenstate(X),
	write('|'),nl,
	write('|_|_|_|_|_|'),nl,
	piece_display_line(Xs).

piece_display_eigenstate([]).
piece_display_eigenstate([X|Xs]) :-
	write('|'),
	write(X),
	piece_display_eigenstate(Xs).


%exemplificação de jogo (tentativa)

%verificacao do input
check_code([119,49],w1).
check_code([119,50],w2).
check_code([119,51],w3).
check_code([119,52],w4).
check_code([119,53],w5).
check_code([119,54],w6).
check_code([98,49],b1).
check_code([98,50],b2).
check_code([98,51],b3).
check_code([98,52],b4).
check_code([98,53],b5).
check_code([98,54],b6).

%loops main
eigenstate :-
	initial_board(_Board),
	game_play(_Board).

game_play(_Board) :-
	display_game(_Board,_Player),
	write('Choose one piece to see eigenstates.'),nl,
	read_line(_X),
	check_code(_X,_P),
	piece_display(_P),nl.