-module(test_atom).

-ifdef(TEST).


-include_lib("eunit/include/eunit.hrl").

atom_to_string_test() ->
    ?assertEqual(<<"wibble">>, rustler_test:atom_to_string(wibble)),
    ?assertNotEqual(<<"wibble">>, rustler_test:atom_to_string(fred)),
    ?assertException(error, badarg, rustler_test:atom_to_string("fred")).

atom_equals_ok_test() ->    
    ?assertEqual(true, rustler_test:atom_equals_ok(ok)),
    ?assertEqual(false, rustler_test:atom_equals_ok(bad)),
    ?assertException(error, badarg, rustler_test:atom_equals_ok("wibble1")).

binary_to_atom_test() ->
    ?assertEqual(wibble, rustler_test:binary_to_atom(<<"wibble">>)),
    ?assertNotEqual(wibble, rustler_test:binary_to_atom(<<"fred">>)),
    ?assertException(error, badarg, rustler_test:binary_to_atom("wibbble")).

binary_to_existing_atom_test() ->
    ?assertEqual(wibble, rustler_test:binary_to_existing_atom(<<"wibble">>)),
    ?assertEqual(nil, rustler_test:binary_to_existing_atom(<<"hoopyfrood">>)),
    ?assertException(error, badarg, rustler_test:binary_to_existing_atom("wibbble")).

-endif.
