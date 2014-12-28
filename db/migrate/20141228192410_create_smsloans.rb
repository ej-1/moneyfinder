class CreateSmsloans < ActiveRecord::Migration
  def change
    create_table :smsloans do |t|
      t.string :bank
      t.integer :min_loanamoun
      t.integer :max_loanamoun
      t.string :mobile_friendly_site
      t.string :smsloan_payment_note
      t.integer :smsloan_min_age
      t.string :cost_free_loan
      t.string :new_borrower_5K
      t.string :new_borrower_10K
      t.string :no_uc
      t.string :skef_member
      t.string :bankid
      t.string :open_on_saturdays
      t.string :weblink

      t.timestamps
    end
  end
end
