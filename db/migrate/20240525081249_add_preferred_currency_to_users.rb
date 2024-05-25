class AddPreferredCurrencyToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :currency, :string, default: 'USD'
    add_column :teachers, :currency, :string, default: 'USD'
  end
end
