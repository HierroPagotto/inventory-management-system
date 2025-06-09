class MovimentacoesController < ApplicationController
  before_action :set_produto, only: [:index, :new, :create]
  
  def index
    if @produto
      @movimentacoes = @produto.movimentacoes.por_data
    else
      @movimentacoes = Movimentacao.includes(:produto).por_data
    end
  end
  
  def new
    @movimentacao = @produto.movimentacoes.build
    @movimentacao.data_movimentacao = Date.current
  end
  
  def create
    @movimentacao = @produto.movimentacoes.build(movimentacao_params)
    @movimentacao.data_movimentacao = Date.current
    
    begin
      if @movimentacao.save
        redirect_to @produto, notice: 'Movimentação registrada com sucesso!'
      else
        render :new
      end
    rescue => e
      @movimentacao.errors.add(:base, e.message)
      render :new
    end
  end
  
  private
  
  def set_produto
    @produto = Produto.find(params[:produto_id]) if params[:produto_id]
  end
  
  def movimentacao_params
    params.require(:movimentacao).permit(:tipo, :quantidade)
  end
end