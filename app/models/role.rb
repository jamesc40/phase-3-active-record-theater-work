class Role < ActiveRecord::Base
  has_many :auditions
  def actors
    self.auditions.each { |audition| audition.actor }
  end

  def locations
    self.auditions.map { |audition| audition.location }
  end

  def lead 
    hired = self.auditions.filter  { |audition| audition.hired }
    hired.length != 0 ? hired.first : 'no actor has been hired for this role'
  end

  def understudy
    lead.is_a?(Array) && lead.length  > 1 ? lead.second : 'no actor has been hired for understudy for this role' 
  end
end
