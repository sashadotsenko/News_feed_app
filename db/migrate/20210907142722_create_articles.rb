class CreateArticles < ActiveRecord::Migration[6.1]
  def up
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :article_type, null: false

      t.timestamps
    end

    execute <<-SQL
      CREATE TYPE article_article_type AS ENUM ('public, pivate')
    SQL
  end

  def down
    drop_table :articles

    execute <<-SQL
      DROP TYPE article_article_type
    SQL
  end
end
