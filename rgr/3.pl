:- dynamic product/3.

load_database(File) :-
    exists_file(File), !, 
    consult(File).
load_database(_).

save_database(File) :-
    tell(File),
    listing(product/3),
    told.

view_database :-
    forall(product(Name, Packaging, Price),
           writeln([Name, Packaging, Price])).

add_records :-
    writeln("Введите записи. Введите 'stop.' для завершения."),
    read_record.

read_record :-
    read(Product),
    (   Product == stop
    ->  true
    ;   assertz(Product),
        read_record
    ).

delete_records :-
    writeln("Введите записи для удаления. Введите 'stop.' для завершения."),
    read_deletion.

read_deletion :-
    read(Product),
    (   Product == stop
    ->  true
    ;   retract(Product),
        read_deletion
    ).

find_min_price :-
    findall(Price, product(_, _, Price), Prices),
    min_list(Prices, MinPrice),
    findall([Name, Packaging, MinPrice], product(Name, Packaging, MinPrice), Results),
    writeln("Товары с минимальной стоимостью:"),
    forall(member(Result, Results), writeln(Result)).

menu :-
    writeln("Меню:"),
    writeln("1. Просмотр содержимого базы данных"),
    writeln("2. Добавление записей"),
    writeln("3. Удаление записей"),
    writeln("4. Запрос: Найти товары с минимальной стоимостью"),
    writeln("5. Выход"),
    read(Choice),
    handle_choice(Choice).

handle_choice(1) :- view_database, menu.
handle_choice(2) :- add_records, menu.
handle_choice(3) :- delete_records, menu.
handle_choice(4) :- find_min_price, menu.
handle_choice(5) :- save_database('database.pl'), writeln("Данные сохранены. Выход."), !.
handle_choice(_) :- writeln("Неверный выбор, попробуйте снова."), menu.

start :-
    load_database('database.pl'),
    menu.
