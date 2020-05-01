-module(test_primitives).

-ifdef(TEST).


-include_lib("eunit/include/eunit.hrl").

add_u32_test() ->
    ?assertEqual(3, rustler_test:add_u32(1,2)),
    ?assertException(error, badarg, rustler_test:add_u32(1,-2)).

add_i32_test() ->
    ?assertEqual(0, rustler_test:add_i32(2, -2)),
    ?assertException(error, badarg, rustler_test:add_i32(1, erlang:trunc(math:pow(2, 33)))).

echo_u8_test() ->
    ?assertEqual(100, rustler_test:echo_u8(100)),
    ?assertEqual(1, rustler_test:echo_u8(257)),   %% This is a bit suspect to me...
    ?assertException(error, badarg, rustler_test:echo_u8(wibble)).
    

option_inc_test() ->
    ?assertEqual(2.0, rustler_test:option_inc(1.0)),
    ?assertEqual(math:pi() + 1.0, rustler_test:option_inc(math:pi())),
    ?assertException(error, badarg, rustler_test:option_inc(wibble)).

result_to_int_test() ->
    ?assertEqual({ok, 1}, rustler_test:result_to_int({ok, true})),
    ?assertEqual({ok, 0}, rustler_test:result_to_int({ok, false})),
    ?assertEqual({error, <<"borkedborked">>}, rustler_test:result_to_int({error, <<"borked">>})),
    ?assertException(error, badarg, rustler_test:result_to_int({ok, wibble})).
    

-endif.
