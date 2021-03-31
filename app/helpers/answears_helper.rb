module AnswearsHelper
    def self.timestamp(id)
        timestamp = Answear.by_id(id).created_at.to_s
        Timezone.date_threshold(timestamp)
    end

    def self.author(id)

    end

    def self.coordinates(lat, lng)
    end
end
