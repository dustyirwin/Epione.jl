module CreateTablePatients

  import SearchLight.Migrations: create_table, column, primary_key, add_index, drop_table

  function up()
    create_table(:patients) do
      [
        primary_key()
        column(:first_name, :string)
        column(:last_name, :string)
        column(:DOB, :int)
        column(:sex, :string)
        column(:phone1, :int)
        column(:phone2, :int)
        column(:email, :string)
        column(:MRN, :int)
      ]
    end

    add_index(:patients, :first_name)
    add_index(:patients, :last_name)
    add_index(:patients, :DOB)
    add_index(:patients, :sex)
    add_index(:patients, :phone1)
    add_index(:patients, :phone2)
    add_index(:patients, :email)
    add_index(:patients, :MRN)
  end

  function down()
    drop_table(:patients)
  end

end
