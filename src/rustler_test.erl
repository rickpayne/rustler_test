-module(rustler_test).

-export([add_u32/2, add_i32/2, echo_u8/1, option_inc/1, result_to_int/1]).
-export([sum_list/1, make_list/0]).
-export([term_debug/1, term_eq/2, term_cmp/2]).
-export([sum_map_values/1, map_entries_sorted/1, map_from_arrays/2]).
-export([resource_make/0, resource_set_integer_field/2
        , resource_get_integer_field/1, resource_make_immutable/1
        , resource_immutable_count/0]).
-export([atom_to_string/1, atom_equals_ok/1, binary_to_atom/1
        , binary_to_existing_atom/1]).
-export([make_shorter_subbinary/1, parse_integer/1, binary_new/0
        , owned_binary_new/0, unowned_to_owned/1, realloc_shrink/0
        , realloc_grow/0, encode_string/0, decode_iolist/1]).
-export([threaded_fac/1, threaded_sleep/1]).
-export([send_all/2, sublists/1]).
-export([tuple_echo/1, record_echo/1, map_echo/1, struct_echo/1
        , unit_enum_echo/1, untagged_enum_echo/1
        , untagged_enum_with_truthy/1
        , newtype_echo/1, tuplestruct_echo/1
        , newtype_record_echo/1
        , tuplestruct_record_echo/1]).
-export([dirty_cpu/0, dirty_io/0]).
-export([sum_range/1]).
-export([bad_arg_error/0, atom_str_error/0
        , raise_atom_error/0, raise_term_with_string_error/0
        , raise_term_with_atom_error/0, term_with_tuple_error/0]).
-export([nif_attrs_can_rename/0]).

-on_load(init/0).

init() ->
    ok = erlang:load_nif("priv/librustler_test", 0).

%% test_primatives.rs
add_u32(_,_) -> exit(nif_library_not_loaded).
add_i32(_,_) -> exit(nif_library_not_loaded).
echo_u8(_) -> exit(nif_library_not_loaded).
option_inc(1) -> exit(nif_library_not_loaded).
result_to_int(_) -> exit(nif_library_not_loaded).

%% test_list.rs
sum_list(_) -> exit(nif_library_not_loaded).
make_list() -> exit(nif_library_not_loaded).

%% test_term.rs
term_debug(_) -> exit(nif_library_not_loaded).
term_eq(_,_) ->  exit(nif_library_not_loaded).
term_cmp(_, _) -> exit(nif_library_not_loaded).

%% test_map.rs
sum_map_values(_) -> exit(nif_library_not_loaded).
map_entries_sorted(_) -> exit(nif_library_not_loaded).
map_from_arrays(_, _) -> exit(nif_library_not_loaded).

%% test_resource.rs
resource_make() -> exit(nif_library_not_loaded).
resource_set_integer_field(_, _) -> exit(nif_library_not_loaded).
resource_get_integer_field(_) -> exit(nif_library_not_loaded).
resource_make_immutable(_) -> exit(nif_library_not_loaded).
resource_immutable_count() -> exit(nif_library_not_loaded).

%% test_atom.rs
atom_to_string(_X) -> exit(nif_library_not_loaded).
atom_equals_ok(_) -> exit(nif_library_not_loaded).
binary_to_atom(_) -> exit(nif_library_not_loaded).
binary_to_existing_atom(_) -> exit(nif_library_not_loaded).

%% test_binary.rs
make_shorter_subbinary(_X) -> exit(nif_library_not_loaded).
parse_integer(_X) -> exit(nif_library_not_loaded).
binary_new() -> exit(nif_library_not_loaded).
owned_binary_new() -> exit(nif_library_not_loaded).
unowned_to_owned(_X) -> exit(nif_library_not_loaded).
realloc_shrink() -> exit(nif_library_not_loaded).
realloc_grow() -> exit(nif_library_not_loaded).
encode_string() -> exit(nif_library_not_loaded).
decode_iolist(_) -> exit(nif_library_not_loaded).

%% test_thread.rs
threaded_fac(_X) -> exit(nif_library_not_loaded).
threaded_sleep(_X) -> exit(nif_library_not_loaded).

%% test_codegen.rs
send_all(_,_) -> exit(nif_library_not_loaded).
sublists(_) -> exit(nif_library_not_loaded).

tuple_echo(_) -> exit(nif_library_not_loaded).
record_echo(_) -> exit(nif_library_not_loaded).
map_echo(_) -> exit(nif_library_not_loaded).
struct_echo(_) -> exit(nif_library_not_loaded).
unit_enum_echo(_) -> exit(nif_library_not_loaded).
untagged_enum_echo(_) -> exit(nif_library_not_loaded).
untagged_enum_with_truthy(_) -> exit(nif_library_not_loaded).
newtype_echo(_) -> exit(nif_library_not_loaded).
tuplestruct_echo(_) -> exit(nif_library_not_loaded).
newtype_record_echo(_) -> exit(nif_library_not_loaded).
tuplestruct_record_echo(_) -> exit(nif_library_not_loaded).

%% dirty.rs
dirty_cpu() -> exit(nif_library_not_loaded).
dirty_io() -> exit(nif_library_not_loaded).

sum_range(_) -> exit(nif_library_not_loaded).

bad_arg_error() -> exit(nif_library_not_loaded).
atom_str_error() -> exit(nif_library_not_loaded).
raise_atom_error() -> exit(nif_library_not_loaded).
raise_term_with_string_error() -> exit(nif_library_not_loaded).
raise_term_with_atom_error() -> exit(nif_library_not_loaded).
term_with_tuple_error() -> exit(nif_library_not_loaded).

nif_attrs_can_rename() -> exit(nif_library_not_loaded).
    
