class Timezone < TimezoneService
    attr_reader :zone, :time
    include ActionView::Helpers::DateHelper

    def initialize(time)
        @time = time
        @zone = "America/Sao_Paulo"
    end

    def timestamp(time)
        time.to_s
    end

    def datetime
        Time.zone = self.zone
        time = timestamp(self.time)
        Time.zone.parse(time).strftime('%D at %H:%M')
    end

    def date_threshold
      Time.zone = self.zone
      time = timestamp(self.time)
      _date = Time.zone.parse(time)
      distance_of_time_in_words(Time.current - _date)
    end

    def zone
      @zone
    end
end