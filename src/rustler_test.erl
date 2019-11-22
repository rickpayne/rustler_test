-module(rustler_test).

-export([atom_to_string/1]).
-on_load(init/0).

init() ->
    ok = erlang:load_nif("priv/librustler_test", 0).

atom_to_string(_X) ->
    exit(nif_library_not_loaded).
