module Sleeps

  using SearchLight
  using Dates

  export Sleep

  mutable struct Sleep <: AbstractModel
    ### INTERNALS
    _table_name::String
    _id::String

    ### FIELDS
    id::DbId
    MRN::Int
    date::String
    hours::Float64
  end

  ### constructor
  Sleep(;
    ### FIELDS
    id = DbId(),
    MRN = 0,
    date = string(now()),
    hours = 0,
    ) = Sleep("sleeps", "id",  ### INTERNALS
      id, MRN, date, hours)  ### FIELDS

end
