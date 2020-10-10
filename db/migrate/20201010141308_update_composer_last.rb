class UpdateComposerLast < ActiveRecord::Migration[5.2]
  def change
    add_column :scores, :composer_last, :string
  end
end
