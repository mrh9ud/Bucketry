class User < ApplicationRecord
    has_many :user_experiences
    has_many :stories, through: :user_experiences
    has_many :activities, through: :user_experiences

    validates :name, presence: true
    validate :age_verification

    def age_calculation
        Time.now.year - self.birthdate.year - ((Time.now.month > self.birthdate.month || (Time.now.month == self.birthdate.month && Time.now.day >= self.birthdate.day)) ? 0 : 1)
    end

    def age_verification
        unless self.birthdate.year < Time.now.year && !self.birthdate.blank?
            errors.add(:birthdate, "must be in the past!")
        end
    end

    def possessive_pronoun
        if self.gender.blank?
            "their"
        elsif ['m','male','man','guy'].include?(self.gender.downcase)
            "his"
        elsif ['f','female','woman','girl'].include?(self.gender.downcase)
            "her"
        else
            "their"
        end
    end

    def set_date
        self.created_at
    end

    def alive?
        if self.alive
            "According to recent sources, yes."
        else
            "Survey says no."
        end
    end

end