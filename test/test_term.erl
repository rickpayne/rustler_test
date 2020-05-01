-module(test_term).

-ifdef(TEST).


-include_lib("eunit/include/eunit.hrl").

term_debug_test() ->
    ?assertEqual(<<"1">>, rustler_test:term_debug(1)),
    ?assertEqual(<<"wibble">>, rustler_test:term_debug(wibble)),
    ?assertEqual(<<"{1,2}">>, rustler_test:term_debug({1,2})),
    ?assertEqual(<<"#{map=>12}">>, rustler_test:term_debug(#{map => 12})),
    ?assertEqual(<<"[1,2,3]">>, rustler_test:term_debug([1,2,3])).

term_eq_test() ->
    ?assertEqual(true, rustler_test:term_eq(1, 1)),
    ?assertEqual(false, rustler_test:term_eq(1, 2)),
    ?assertEqual(true, rustler_test:term_eq(wibble, wibble)),
    ?assertEqual(true, rustler_test:term_eq([1,2,3,4,5], [1,2,3,4,5])),
    ?assertEqual(true, rustler_test:term_eq(#{lhs => 1, rhs => 2}, #{rhs => 2, lhs => 1})).

term_cmp_test() ->
    ?assertEqual(equal, rustler_test:term_cmp(1, 1)),
    ?assertEqual(less, rustler_test:term_cmp(1, 2)),
    ?assertEqual(greater, rustler_test:term_cmp(2, 1)).
    

-endif.
