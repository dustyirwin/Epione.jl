module Depressions

  using SearchLight
  using Dates: now

  export Depression

  mutable struct Depression <: AbstractModel
    ### INTERNALS
    _table_name::String
    _id::String

    ### FIELDS
    id::DbId
    MRN::Int
    date::String
    score::Float64
  end

  ### constructor
  Depression(;
    ### FIELDS
    id = DbId(),
    MRN = 0,
    date = string(now()),
    score = 99,
  ) = Depression("depressions", "id", ### INTERNALS
          id, MRN, date, score) ### FIELDS

end
