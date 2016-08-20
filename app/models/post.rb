# class ClickBaitValidator < ActiveModel::Validator
#   def validate(record)
#     unless record.title =~ /Won't Believe/||/Secret/||/Secret/||/Top/||/Guess/#|| ...?
#       false
#       #record.errors[:name] << 'Need a name starting with X please!'
#     end
#   end
# end

class Post < ActiveRecord::Base
  #include ActiveModel::Validations
  #validates_with ClickBaitValidator
  validates :title, presence: true
  validate :clickbait?
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { within: ["Fiction", "Non-Fiction"] }

  def clickbait?
    clickbait_words = [ "Won't Believe", "Secret", "Secret", "Top", "Guess" ]
    if self.title.nil?
      errors.add(:title, "cannot be blank")
    elsif clickbait_words.any? {|word| self.title.include?(word)}
      true
    else
      errors.add(:title, "must be clickbait")
    end
  end

  #validates :title, inclusion: { within: ["Won't Believe", "Secret", "Top [number]", "Guess"] }

# Finally, add a custom validator to Post that ensures the title is sufficiently
# clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top
# [number]", or "Guess", the validator should return false.

end



#Example:
# prefixes.include?(name) # should return true / false
#
# prefixes = [
#   /Ms\.?/i,
#   /Miss/i,
#   /Mrs\.?/i,
#   /Mr\.?/i,
#   /Master/i,
#   /Rev\.?/i,
#   /Reverend/i,
#   /Fr\.?/i,
#   /Father/i,
#   /Dr\.?/i,
#   /Doctor/i,
#   /Atty\.?/i,
#   /Attorney/i,
#   /Prof\.?/i,
#   /Professor/i,
#   /Hon\.?/i,
#   /Honorable/i,
#   /Pres\.?/i,
#   /President/i,
#   /Gov\.?/i,
#   /Governor/i,
#   /Coach/i,
#   /Ofc\.?/i,
#   /Officer/i,
#   /Msgr\.?/i,
#   /Monsignor/i,
#   /Sr\.?/i,
#   /Sister\.?/i,
#   /Br\.?/i,
#   /Brother/i,
#   /Supt\.?/i,
#   /Superintendent/i,
#   /Rep\.?/i,
#   /Representative/i,
#   /Sen\.?/i,
#   /Senator/i,
#   /Amb\.?/i,
#   /Ambassador/i,
#   /Treas\.?/i,
#   /Treasurer/i,
#   /Sec\.?/i,
#   /Secretary/i,
#   /Pvt\.?/i,
#   /Private/i,
#   /Cpl\.?/i,
#   /Corporal/i,
#   /Sgt\.?/i,
#   /Sargent/i,
#   /Adm\.?/i,
#   /Administrative/i,
#   /Maj\.?/i,
#   /Major/i,
#   /Capt\.?/i,
#   /Captain/i,
#   /Cmdr\.?/i,
#   /Commander/i,
#   /Lt\.?/i,
#   /Lieutenant/i,
#   /^Lt Col\.?$/i,
#   /^Lieutenant Col$/i,
#   /Col\.?/i,
#   /Colonel/i,
#   /Gen\.?/i,
#   /General/i
# ]
