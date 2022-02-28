json.extract! journal, :id, :title, :author, :created_at, :updated_at
json.url journal_url(journal, format: :json)
