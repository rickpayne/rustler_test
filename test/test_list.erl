-module(test_list).

-ifdef(TEST).


-include_lib("eunit/include/eunit.hrl").

sum_list_test() ->
    ?assertEqual(15, rustler_test:sum_list([1,2,3,4,5])),
    ?assertException(error, badarg, rustler_test:sum_list([a,b,c])).

make_list_test() ->
    ?assertEqual([1,2,3], rustler_test:make_list()).
                 
    

-endif.
