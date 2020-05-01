-module(test_codegen).

-ifdef(TEST).


-include_lib("eunit/include/eunit.hrl").

tuple_echo_test() ->
    ?assertEqual(rustler_test:tuple_echo({1,2}),
                 {1,2}),
    %% Note, NifTuple returns an exception if the conversion fails
    ?assertException(error, badarg,
                     rustler_test:tuple_echo({1,2,3})).

-record(record, {lhs, rhs}).
-record(bogus_record, {lhs}).
record_echo_test() ->
    ?assertEqual(rustler_test:record_echo(#record{lhs = 1, rhs = 2}),
                 #record{lhs = 1, rhs = 2}),
    %% Note, when using NifRecord, if the conversion fails, you get 'invalid_record'
    %% rather than an exception.
    ?assertEqual(rustler_test:record_echo(#bogus_record{lhs = 1}),
                 invalid_record).

map_echo_test() ->
    ?assertEqual(rustler_test:map_echo(#{lhs => 1, rhs => 2}),
                 #{rhs => 2, lhs => 1}),
    ?assertEqual(rustler_test:map_echo(#{lhs => 1, rhs => 2, mid => 17}),
                 #{rhs => 2, lhs => 1}),
    ?assertException(error, badarg,
                     rustler_test:map_echo(#{lhs => 1, mid => 17})).

struct_echo_test() ->
    ?assertEqual(#{'__struct__' => "AddStruct", lhs => 1, rhs => 2},
                 rustler_test:struct_echo(#{'__struct__' => "AddStruct", lhs => 1, rhs => 2})).

unit_enum_echo_test() ->
    ?assertEqual(foo_bar, rustler_test:unit_enum_echo(foo_bar)),
    ?assertEqual(baz, rustler_test:unit_enum_echo(baz)),
    ?assertEqual(invalid_variant, rustler_test:unit_enum_echo(none)).
    
untagged_enum_echo_test() ->
    ?assertEqual(32, rustler_test:untagged_enum_echo(32)),
    ?assertEqual(<<"test">>, rustler_test:untagged_enum_echo(<<"test">>)),
    %% ?assertEqual(, rustler_test:untagged_enum_echo(32)),
    ?assertEqual(true, rustler_test:untagged_enum_echo(true)),
    ?assertEqual(false, rustler_test:untagged_enum_echo(false)),
    ?assertEqual(invalid_variant, rustler_test:untagged_enum_echo(wibble)).


prefix_echo_test() ->
    ?assertEqual(rustler_test:prefix_echo({{1,2,3,0}, 24}),
                 {{{1,2,3,0}, 24}, <<"1.2.3.0/24">>}),
    ?assertEqual(rustler_test:prefix_echo({{1,2,3,0,0,0,0,0}, 24}),
                 {{{1,2,3,0,0,0,0,0}, 24}, <<49,58,50,58,51,58,58,47,50,52>>}),
    ?assertException(error, <<"Could not decode field addr on IpPrefix">>,
                     rustler_test:prefix_echo({{1,2,3,4,5}, 24})).

-endif.
