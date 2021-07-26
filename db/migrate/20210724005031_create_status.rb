class CreateStatus < ActiveRecord::Migration[6.0]
  def change
    create_table :status do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :statu_id     , null: false
      t.timestamps
    end
  end
end
