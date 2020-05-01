use rustler::types::truthy::Truthy;
use rustler::{Decoder, Encoder};
use rustler::{NifMap, NifRecord, NifStruct, NifTuple, NifUnitEnum, NifUntaggedEnum};
use std::net::{IpAddr, Ipv4Addr, Ipv6Addr};

#[derive(Copy, Clone)]
pub struct IpAddress {
    addr: IpAddr
}

#[derive(NifTuple)]
pub struct IpPrefix {
    addr: IpAddress,
    mask: u8,
}

    
impl<'a> Decoder<'a> for IpAddress {
    fn decode(term: ::rustler::Term<'a>) -> Result<Self, ::rustler::Error> {
        let terms = ::rustler::types::tuple::get_tuple(term)?;
        if terms.len() == 4usize {
            let mut a: [u8; 4] = [0; 4];
            for i in  0..=3 {
                match u8::decode(terms[i as usize]) {
                    Err(_) => {
                        return Err(::rustler::Error::RaiseTerm(Box::new(
                            "Could not decode field for IpAddress",
                        )))
                    }
                    Ok(value) => a[i] = value
                }
            } 
            Ok(IpAddress{addr: IpAddr::V4(Ipv4Addr::from(a))})
        } else if terms.len() == 8usize {
            let mut a: [u16; 8] = [0; 8];
            for i in  0..=7 {
                match u16::decode(terms[i as usize]) {
                    Err(_) => {
                        return Err(::rustler::Error::RaiseTerm(Box::new(
                            "Could not decode field for IpAddress",
                        )))
                    }
                    Ok(value) => a[i] = value
                }
            } 
            Ok(IpAddress{addr: IpAddr::V6(Ipv6Addr::from(a))})
        } else {
            return Err(::rustler::Error::BadArg);
        }
    }
}

impl<'b> Encoder for IpAddress {
    fn encode<'a>(&self, env: ::rustler::Env<'a>) -> ::rustler::Term<'a> {
        match self.addr {
            IpAddr::V4(a) => {
                let v: Vec<rustler::Term> = a.octets().iter().map(|x| x.encode(env)).collect();
                ::rustler::types::tuple::make_tuple(env, &[v[0], v[1], v[2], v[3]])
            }
            IpAddr::V6(a) => {
                let arr = a.octets();
                ::rustler::types::tuple::make_tuple(env,
                                                    &[  ((arr[0] as u16) << 8 | arr[1] as u16).encode(env)
                                                      , ((arr[2] as u16) << 8 | arr[3] as u16).encode(env)
                                                      , ((arr[4] as u16) << 8 | arr[5] as u16).encode(env)
                                                      , ((arr[6] as u16) << 8 | arr[7] as u16).encode(env)
                                                      , ((arr[8] as u16) << 8 | arr[9] as u16).encode(env)
                                                      , ((arr[10] as u16) << 8 | arr[11] as u16).encode(env)
                                                      , ((arr[12] as u16) << 8 | arr[13] as u16).encode(env)
                                                      , ((arr[14] as u16) << 8 | arr[15] as u16).encode(env)])
            }
        }
    }
}



#[rustler::nif]
pub fn prefix_echo(prefix: IpPrefix) -> (IpPrefix, String) {
    let s = format!("{}/{}", prefix.addr.addr.to_string(), prefix.mask);
    (prefix, s)
}

#[derive(NifTuple)]
pub struct AddTuple {
    lhs: i32,
    rhs: i32,
}

#[rustler::nif]
pub fn tuple_echo(tuple: AddTuple) -> AddTuple {
    tuple
}

#[derive(NifRecord)]
#[rustler(encode, decode)] // Added to check encode/decode attribute, #180
#[must_use] // Added to check attribute order (see similar issue #152)
#[tag = "record"]
pub struct AddRecord {
    lhs: i32,
    rhs: i32,
}

#[rustler::nif]
pub fn record_echo(record: AddRecord) -> AddRecord {
    record
}

#[derive(NifMap)]
pub struct AddMap {
    lhs: i32,
    rhs: i32,
}

#[rustler::nif]
pub fn map_echo(map: AddMap) -> AddMap {
    map
}

#[derive(Debug, NifStruct)]
#[must_use] // Added to test Issue #152
#[module = "AddStruct"]
pub struct AddStruct {
    lhs: i32,
    rhs: i32,
}

#[rustler::nif]
pub fn struct_echo(add_struct: AddStruct) -> AddStruct {
    add_struct
}

#[derive(NifUnitEnum)]
pub enum UnitEnum {
    FooBar,
    Baz,
}

#[rustler::nif]
pub fn unit_enum_echo(unit_enum: UnitEnum) -> UnitEnum {
    unit_enum
}

#[derive(NifUntaggedEnum)]
pub enum UntaggedEnum {
    Foo(u32),
    Bar(String),
    Baz(AddStruct),
    Bool(bool),
}

#[rustler::nif]
pub fn untagged_enum_echo(untagged_enum: UntaggedEnum) -> UntaggedEnum {
    untagged_enum
}

#[derive(NifUntaggedEnum)]
pub enum UntaggedEnumWithTruthy {
    Baz(AddStruct),
    Truthy(Truthy),
}

#[rustler::nif]
pub fn untagged_enum_with_truthy(untagged_enum: UntaggedEnumWithTruthy) -> UntaggedEnumWithTruthy {
    untagged_enum
}

#[derive(NifTuple)]
pub struct Newtype(i64);

#[rustler::nif]
pub fn newtype_echo(newtype: Newtype) -> Newtype {
    newtype
}

#[derive(NifTuple)]
pub struct TupleStruct(i64, i64, i64);

#[rustler::nif]
pub fn tuplestruct_echo(tuplestruct: TupleStruct) -> TupleStruct {
    tuplestruct
}

#[derive(NifRecord)]
#[tag = "newtype"]
pub struct NewtypeRecord(i64);

#[rustler::nif]
pub fn newtype_record_echo(newtype: NewtypeRecord) -> NewtypeRecord {
    newtype
}

#[derive(NifRecord)]
#[tag = "tuplestruct"]
pub struct TupleStructRecord(i64, i64, i64);

#[rustler::nif]
pub fn tuplestruct_record_echo(tuplestruct: TupleStructRecord) -> TupleStructRecord {
    tuplestruct
}
