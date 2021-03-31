module QuizzesHelper
    def self.quiz_name(id)
        Quiz.by_id(id).title
    end

    def self.quiz_topic(id)
        Quiz.by_id(id).topic
    end
end
