json.extract! history, :id, :user_id, :e_doc_id, :type, :created_at, :updated_at
json.url history_url(history, format: :json)
