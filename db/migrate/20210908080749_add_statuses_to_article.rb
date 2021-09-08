class AddStatusesToArticle < ActiveRecord::Migration[6.1]
  def up
    add_column :articles, :status, :string, default: 'unpublished'

    execute <<-SQL
      CREATE TYPE article_status AS ENUM ('unpublished, published', 'canceled')
    SQL
  end

  def down
    remove_column :articles, :status, :string

    execute <<-SQL
      DROP TYPE article_status
    SQL
  end
end
