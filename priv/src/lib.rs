//#[macro_use]
extern crate rustler;

extern crate rustler_codegen;

//#[macro_use]
extern crate lazy_static;

use rustler::{Env, NifResult, Term};

rustler::rustler_export_nifs!(
    "rustler_test",
    [
        ("atom_to_string", 1, atom_to_string),
    ],
    Some(on_load)
);

fn on_load<'a>(env: Env<'a>, _load_info: Term<'a>) -> bool {
    true
}

pub fn atom_to_string<'a>(_env: Env<'a>, args: &[Term<'a>]) -> NifResult<String> {
    args[0].atom_to_string()
}

