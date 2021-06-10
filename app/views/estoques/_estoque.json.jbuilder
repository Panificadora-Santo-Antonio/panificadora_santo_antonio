json.extract! estoque, :id, :quantidadeProduto, :valorTotalEstoque, :produto_id, :created_at, :updated_at
json.url estoque_url(estoque, format: :json)
