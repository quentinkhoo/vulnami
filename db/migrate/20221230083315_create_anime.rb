# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :anime do
      primary_key :id
      column :title, :text, null: false
      column :genre, :text, null: false
      column :episodes, :int, null: false
    end
  end
end
