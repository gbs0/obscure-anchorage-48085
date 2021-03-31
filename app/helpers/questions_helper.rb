module QuestionsHelper
    def self.title(id)
        Question.by_id(id).title
    end

    def self.author(question_id)
        user_id = Question.by_id(question_id).user_id
        UsersHelper::user_name(user_id)
    end

    def self.timestamp(id)
        timestamp = Question.by_id(id).created_at.to_s
        Timezone.date_threshold(timestamp)
    end

    def self.count(relation)
        relation.count
    end
end
