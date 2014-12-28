class CreateSmsloans < ActiveRecord::Migration
  def change
    create_table :smsloans do |t|
      t.string :smsloan_loancompany
      t.integer :smsloan_min_loanamount
      t.integer :smsloan_max_loanamount
      t.integer :smsloan_mobile_friendly_site
      t.string :smsloan_payment_note
      t.integer :smsloan_min_age
      t.string :smsloan_cost_free_loan
      t.string :smsloan_5K_new_borrower
      t.string :smsloan_10K_new_borrower
      t.string :smsloan_no_UC
      t.string :smsloan_SKEF_member
      t.string :smsloan_BANKID
      t.string :smsloan_open_on_saturdays
      t.string :smsloan_open_on_saturdays
      t.string :smsloan_web_link

      t.timestamps
    end
  end
end
