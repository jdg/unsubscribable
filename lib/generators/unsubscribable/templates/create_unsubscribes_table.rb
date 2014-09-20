class CreateUnsubscribesTable < ActiveRecord::Migration
  def change
    create_table :unsubscribes do |t|
      t.references :unsubscribable, polymorphic: true, null: false
      t.integer    :subscriber_id, index: true, null: false
      t.string     :tag, null: false

      t.timestamps
    end

    add_index :unsubscribes, [:unsubscribable_id]
    add_index :unsubscribes, [:unsubscribable_id, :tag]
    add_index :unsubscribes, [:unsubscribable_id, :unsubscribable_type], name: "unsubscribables_index_id_type"
  end
end