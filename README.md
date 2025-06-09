# Sistema de Controle de Estoque

Uma aplicação web desenvolvida em Ruby on Rails para gerenciamento de produtos e controle de estoque, permitindo cadastro de produtos e registro de movimentações de entrada e saída.

## 📋 Funcionalidades

- ✅ **Cadastro de Produtos**: Nome, descrição, quantidade inicial e preço
- ✅ **Listagem de Produtos**: Visualização de todos os produtos com estoque atual
- ✅ **Controle de Estoque**: Registro de entradas e saídas com atualização automática
- ✅ **Histórico de Movimentações**: Acompanhamento completo de todas as movimentações
- ✅ **Validações**: Impedimento de estoque negativo e validação de dados
- ✅ **CRUD Completo**: Criação, leitura, atualização e exclusão de produtos

## 🚀 Tecnologias Utilizadas

- **Ruby** 3.0+
- **Ruby on Rails** 7.0+
- **SQLite3** (banco de dados)
- **HTML/CSS** (interface responsiva)
- **Bootstrap** (estilização básica via CSS inline)

## 📦 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- Ruby 3.0.0 ou superior
- Rails 7.0 ou superior
- SQLite3
- Git

### Verificando as instalações:

```bash
ruby -v
rails -v
sqlite3 --version
```

## 🔧 Instalação

1. **Clone o repositório:**
```bash
git clone https://github.com/HierroPagotto/estoque_app.git
cd estoque_app
```

2. **Instale as dependências:**
```bash
bundle install
```

3. **Configure o banco de dados:**
```bash
rails db:create
rails db:migrate
```

4. **Popule o banco com dados de exemplo (opcional):**
```bash
rails db:seed
```

5. **Execute o servidor:**
```bash
rails server
```

6. **Acesse a aplicação:**
```
http://localhost:3000
```

## 🗄️ Estrutura do Banco de Dados

### Tabela `produtos`
| Campo | Tipo | Descrição |
|-------|------|-----------|
| id | Integer (PK) | Identificador único |
| nome | String | Nome do produto (obrigatório) |
| descricao | Text | Descrição detalhada (opcional) |
| quantidade_estoque | Integer | Quantidade atual em estoque |
| preco | Decimal(10,2) | Preço unitário (opcional) |
| created_at | DateTime | Data de criação |
| updated_at | DateTime | Data da última atualização |

### Tabela `movimentacoes`
| Campo | Tipo | Descrição |
|-------|------|-----------|
| id | Integer (PK) | Identificador único |
| produto_id | Integer (FK) | Referência ao produto |
| tipo | String | Tipo: 'entrada' ou 'saida' |
| quantidade | Integer | Quantidade movimentada |
| data_movimentacao | Date | Data da movimentação |
| created_at | DateTime | Data de criação |
| updated_at | DateTime | Data da última atualização |

## 🎯 Como Usar

### 1. Cadastrando um Produto
- Acesse "Novo Produto"
- Preencha nome (obrigatório) e quantidade inicial
- Descrição e preço são opcionais
- Clique em "Cadastrar Produto"

### 2. Registrando Movimentações
- Na página do produto, clique em "Nova Movimentação"
- Escolha o tipo: Entrada (aumenta estoque) ou Saída (diminui estoque)
- Informe a quantidade
- A data é registrada automaticamente

### 3. Visualizando Histórico
- Na página do produto: últimas 10 movimentações
- "Ver Histórico Completo": todas as movimentações do produto
- "Todas as Movimentações": histórico geral de todos os produtos

## 🔒 Regras de Negócio

### Validações Implementadas:

**Produtos:**
- Nome é obrigatório
- Quantidade de estoque não pode ser negativa
- Preço deve ser positivo (quando informado)

**Movimentações:**
- Tipo deve ser 'entrada' ou 'saida'
- Quantidade deve ser maior que zero
- Data é obrigatória
- **Não permite estoque negativo**: saídas que resultariam em estoque negativo são bloqueadas

### Comportamento do Sistema:
- **Entrada**: Adiciona quantidade ao estoque atual
- **Saída**: Subtrai quantidade do estoque atual (com validação)
- **Exclusão de produto**: Remove também todas as movimentações relacionadas
- **Atualização automática**: O estoque é recalculado a cada movimentação

## 📁 Estrutura de Arquivos Principais

```
app/
├── controllers/
│   ├── application_controller.rb
│   ├── produtos_controller.rb
│   └── movimentacoes_controller.rb
├── models/
│   ├── produto.rb
│   └── movimentacao.rb
└── views/
    ├── layouts/
    │   └── application.html.erb
    ├── produtos/
    │   ├── index.html.erb
    │   ├── show.html.erb
    │   ├── new.html.erb
    │   └── edit.html.erb
    └── movimentacoes/
        ├── index.html.erb
        └── new.html.erb

config/
└── routes.rb

db/
├── migrate/
│   ├── 001_create_produtos.rb
│   └── 002_create_movimentacoes.rb
└── seeds.rb
```

## 🛣️ Rotas da Aplicação

| Método | Rota | Ação | Descrição |
|--------|------|------|-----------|
| GET | `/` | produtos#index | Página inicial (lista produtos) |
| GET | `/produtos` | produtos#index | Lista todos os produtos |
| GET | `/produtos/new` | produtos#new | Formulário novo produto |
| POST | `/produtos` | produtos#create | Criar produto |
| GET | `/produtos/:id` | produtos#show | Detalhes do produto |
| GET | `/produtos/:id/edit` | produtos#edit | Formulário editar produto |
| PATCH/PUT | `/produtos/:id` | produtos#update | Atualizar produto |
| DELETE | `/produtos/:id` | produtos#destroy | Excluir produto |
| GET | `/produtos/:id/movimentacoes` | movimentacoes#index | Histórico do produto |
| GET | `/produtos/:id/movimentacoes/new` | movimentacoes#new | Nova movimentação |
| POST | `/produtos/:id/movimentacoes` | movimentacoes#create | Criar movimentação |
| GET | `/movimentacoes` | movimentacoes#index | Todas as movimentações |

## 🧪 Testando a Aplicação

### Dados de Exemplo
Execute `rails db:seed` para criar:
- 5 produtos de exemplo (notebooks, periféricos, etc.)
- Movimentações aleatórias para cada produto

### Comandos Úteis:

```bash
rails routes

rails console

rails db:drop db:create db:migrate db:seed

rails db:schema:dump
```

### Testando Funcionalidades:

1. **Teste de Validação**: Tente criar produto sem nome
2. **Teste de Estoque**: Tente fazer saída maior que estoque disponível
3. **Teste de Navegação**: Acesse todas as páginas e links
4. **Teste CRUD**: Crie, edite e exclua produtos

## 🚦 Possíveis Melhorias

- [ ] Autenticação de usuários
- [ ] Relatórios e gráficos de estoque
- [ ] Alertas de estoque baixo
- [ ] Categorias de produtos
- [ ] Fornecedores
- [ ] API REST
- [ ] Testes automatizados
- [ ] Deploy em produção
- [ ] Interface mobile otimizada

## 🐛 Solução de Problemas

### Erro de Dependências:
```bash
bundle install
```

### Erro de Banco:
```bash
rails db:drop db:create db:migrate
```

### Porta Ocupada:
```bash
rails server -p 3001
```

### Limpar Cache:
```bash
rails tmp:clear
```

## 📄 Licença

Este projeto está sob licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## ✨ Autor

Desenvolvido com ❤️ usando Ruby on Rails

---

⭐ Se este projeto foi útil para você, considere dar uma estrela no repositório!