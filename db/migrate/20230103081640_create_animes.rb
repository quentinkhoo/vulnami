# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table(:animes) do
      primary_key :id
      column :title, String
      column :genre, String
    end
  end
end
