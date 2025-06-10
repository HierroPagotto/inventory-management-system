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

### Comportamento do Sistema:
- **Entrada**: Adiciona quantidade ao estoque atual
- **Saída**: Subtrai quantidade do estoque atual (com validação)
- **Exclusão de produto**: Remove também todas as movimentações relacionadas
- **Atualização automática**: O estoque é recalculado a cada movimentação

## 🧪 Testando a Aplicação

### Dados de Exemplo
Execute `rails db:seed` para criar:
- 5 produtos de exemplo (notebooks, periféricos, etc.)
- Movimentações aleatórias para cada produto

## 📚 O que eu aprendi

- **Sintaxe do ruby on rails**
- Estrutura de um projeto Rails (MVC - Model, View, Controller)
- Criação de **CRUDs completos** com controllers personalizados
- Uso de **migrations** para estruturar o banco de dados
- Implementação de **validações de dados** nos modelos para garantir a integridade das informações

### 🚧 Principais desafios

- Lidar com a lógica de movimentação de estoque
- Entender o fluxo entre controllers, models e views no Rails, principalmente no início do projeto
- Eliminar bugs como o relacionamento entre produtos e suas movimentações