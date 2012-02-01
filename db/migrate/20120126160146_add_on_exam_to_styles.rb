class AddOnExamToStyles < ActiveRecord::Migration
  def up
    add_column :styles, :on_exam, :boolean, :default => true
    styles_not_on_exam = %w{20A 21A 21B 22A 22B 22C 23A}
    ActiveRecord::Base.connection.execute("UPDATE styles SET on_exam=false WHERE style_number in (#{styles_not_on_exam.map{|s| "'#{s}'" }.join(',')})")
    add_index :styles, :on_exam
  end

  def down
    remove_index :styles, :on_exam
    remove_column :styles, :on_exam
  end
end
