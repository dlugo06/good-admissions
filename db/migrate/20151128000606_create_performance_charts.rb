class CreatePerformanceCharts < ActiveRecord::Migration
  def change
    create_table :performance_charts do |t|

      t.timestamps null: false
    end
  end
end
