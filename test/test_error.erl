-module(test_error).

-ifdef(TEST).


-include_lib("eunit/include/eunit.hrl").

bad_arg_error_test() ->
    ?assertException(error, badarg, rustler_test:bad_arg_error()).

atom_str_error_test() ->
    ?assertEqual(should_be_a_returned_atom, rustler_test:atom_str_error()).

raise_atom_error_test() ->
    ?assertException(error, should_be_a_raised_atom, rustler_test:raise_atom_error()).

raise_term_with_string_error_test() ->
    ?assertException(error, <<"should_be_a_raised_string">>, rustler_test:raise_term_with_string_error()).

raise_term_with_atom_error_test() ->
    ?assertException(error, should_be_a_raised_term_as_atom, rustler_test:raise_term_with_atom_error()).

term_with_tuple_error_test() ->
    ?assertEqual({error, should_be_an_atom_wrapped_in_an_error_tuple},
                 rustler_test:term_with_tuple_error()).

-endif.
