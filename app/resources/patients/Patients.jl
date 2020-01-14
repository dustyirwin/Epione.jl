module Patients

  using SearchLight

  export Patient

  mutable struct Patient <: AbstractModel
    ### INTERNALS
    _table_name::String
    _id::String

    ### FIELDS
    id::DbId
    first_name::String
    last_name::String
    DOB::Int
    sex::String
    phone1::Int
    phone2::Int
    email::String
    MRN::Int
  end

  ### constructor
  Patient(;
    ### FIELDS
    id = DbId(),
    first_name = "",
    last_name = "",
    DOB = 0,
    sex = "",
    phone1 = 0,
    phone2 = 0,
    email = "",
    MRN = 0,
  ) = Patient("patients", "id", ### INTERNALS
        first_name,
        last_name,
        DOB,
        sex,
        phone1,
        phone2,
        email,
        MRN) ### FIELDS

end
