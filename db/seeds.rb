produtos = [
  {
    nome: "Notebook Dell",
    descricao: "Notebook Dell Inspiron 15 - Intel i5, 8GB RAM, 256GB SSD",
    quantidade_estoque: 10,
    preco: 2499.99
  },
  {
    nome: "Mouse Logitech",
    descricao: "Mouse óptico sem fio Logitech M280",
    quantidade_estoque: 25,
    preco: 89.90
  },
  {
    nome: "Teclado Mecânico",
    descricao: "Teclado mecânico RGB com switches blue",
    quantidade_estoque: 15,
    preco: 299.00
  },
  {
    nome: "Monitor LED 24\"",
    descricao: "Monitor LED Full HD 24 polegadas",
    quantidade_estoque: 8,
    preco: 599.00
  },
  {
    nome: "Cabo HDMI",
    descricao: "Cabo HDMI 2.0 - 2 metros",
    quantidade_estoque: 50,
    preco: 25.00
  }
]

produtos.each do |produto_attrs|
  produto = Produto.create!(produto_attrs)
  puts "Produto criado: #{produto.nome}"
  
  rand(1..3).times do
    tipo = ['entrada', 'saida'].sample
    quantidade = rand(1..5)
    
    if tipo == 'saida' && produto.quantidade_estoque < quantidade
      quantidade = [produto.quantidade_estoque, 1].max
    end
    
    if quantidade > 0
      movimentacao = produto.movimentacoes.create!(
        tipo: tipo,
        quantidade: quantidade,
        data_movimentacao: rand(30.days).seconds.ago
      )
      puts "  Movimentação criada: #{tipo} de #{quantidade} unidades"
    end
  end
end

puts "Seed concluído! #{Produto.count} produtos e #{Movimentacao.count} movimentações criadas."