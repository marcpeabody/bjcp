class Characteristic < ActiveRecord::Base
  def self.sample(n)
    # RANDOM() assumes postgres, otherwise, try RAND()
    self.unscoped.all(:limit => n, :order => 'RANDOM()')
  end
end
