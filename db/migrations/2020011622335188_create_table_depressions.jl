module CreateTableDepressions

import SearchLight.Migrations: create_table, column, primary_key, add_index, drop_table

function up()
  create_table(:depressions) do
    [
      primary_key()
      column(:MRN, :int)
      column(:date, :string)
      column(:score, :float)
    ]
  end

  add_index(:depressions, :MRN)
  add_index(:depressions, :date)
  add_index(:depressions, :score)
end

function down()
  drop_table(:depressions)
end

end
