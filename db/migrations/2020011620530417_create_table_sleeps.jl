module CreateTableSleeps

  import SearchLight.Migrations: create_table, column, primary_key, add_index, drop_table

  function up()
    create_table(:sleeps) do
      [
        primary_key()
        column(:MRN, :int)
        column(:date, :string)
        column(:hours, :float)
      ]
    end

    add_index(:sleeps, :MRN)
    add_index(:sleeps, :date)
    add_index(:sleeps, :hours)
  end

  function down()
    drop_table(:sleeps)
  end

end
