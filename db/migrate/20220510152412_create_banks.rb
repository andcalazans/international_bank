class CreateBanks < ActiveRecord::Migration[6.1]
  def change
    create_table :banks do |t|
      t.integer :document_type
      t.string :document_number
      t.integer :bank_type
      # t.integer :account_type
      # t.string :account_number
      # t.string :complement
      t.jsonb :bank_info, null: false, default: '{}'

      t.timestamps
    end
  end
end
