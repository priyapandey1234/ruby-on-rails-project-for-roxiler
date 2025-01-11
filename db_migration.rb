# db/migrate/create_users.rb
class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 60
      t.string :email, null: false, unique: true
      t.string :address, limit: 400
      t.string :password_digest, null: false
      t.string :role, null: false

      t.timestamps
    end
  end
end

# db/migrate/create_stores.rb
class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name, null: false, limit: 60
      t.string :email, null: false, unique: true
      t.string :address, limit: 400

      t.timestamps
    end
  end
end

# db/migrate/create_ratings.rb
class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.integer :score, null: false, limit: 5

      t.timestamps
    end
  end
end
