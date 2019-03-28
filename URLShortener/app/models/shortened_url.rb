class ShortenedUrl < ApplicationRecord

    belongs_to :submitter,
        class_name: :User,
        primary_key: :id,
        foreign_key: :submitter_id

    def self.random_code
        rand_code = SecureRandom::urlsafe_base64
        until !ShortenedUrl.exists?(:short_url=>rand_code)
            rand_code = SecureRandom::urlsafe_base64
        end
        rand_code
    end

    def self.create_shortened_url!(user, long_url)
        rand_code = self.random_code
        self.create!({'long_url' => long_url, 'short_url'=> rand_code, 'submitter_id'=> user.id})
    end
    
    def num_clicks
        self.visits.count
    end

    def num_uniques
        self.unique_visitors.count
    end

    def num_recent_uniques
        self.recent_unique_visitors.count
    end
     
    has_many :visits,
        class_name: :Visit,
        primary_key: :id,
        foreign_key: :shortened_url_id
        
    has_many :unique_visitors,
        Proc.new { distinct }, 
        through: :visits,
        source: :user
        
    has_many :recent_unique_visitors,
        Proc.new { where("visits.created_at > ?", 10.minutes.ago)}, 
        through: :visits,
        source: :user



    has_many :visitors,
        through: :visits,
        source: :user

end
