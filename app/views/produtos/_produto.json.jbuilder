json.extract! produto, :id, :nome, :descrição, :preco, :validade, :created_at, :updated_at
json.url produto_url(produto, format: :json)
