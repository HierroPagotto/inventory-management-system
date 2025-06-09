class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  
  def index
    @produtos = Produto.all.order(:nome)
  end
  
  def show
    @movimentacoes = @produto.movimentacoes.por_data.limit(10)
  end
  
  def new
    @produto = Produto.new
  end
  
  def create
    @produto = Produto.new(produto_params)
    
    if @produto.save
      redirect_to produtos_path, notice: 'Produto cadastrado com sucesso!'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @produto.update(produto_params)
      redirect_to @produto, notice: 'Produto atualizado com sucesso!'
    else
      render :edit
    end
  end
  
  def destroy
    @produto.destroy
    redirect_to produtos_path, notice: 'Produto excluído com sucesso!'
  end
  
  private
  
  def set_produto
    @produto = Produto.find(params[:id])
  end
  
  def produto_params
    params.require(:produto).permit(:nome, :descricao, :quantidade_estoque, :preco)
  end
end