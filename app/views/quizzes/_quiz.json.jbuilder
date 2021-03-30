json.extract! quiz, :id, :title, :topic, :user_id, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
