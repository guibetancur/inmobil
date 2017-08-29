class PromotersController < ApplicationController
	before_action :authenticate_user!, except: [ :index ]

	def new
		@promoter = Promoter.new
	end

	def create
		@promoter = Promoter.new(promoter_params)
	    @promoter.user = current_user

	    if @promoter.save
	      flash[:notice] = 'Ha sido creado con exito. La administración revisara su solicitud, y pronto le dará una respuesta, este atento!'
	      redirect_to root_path
	    else
	      flash[:alert] = 'Algo fallo, el promotor no ha sido creado con éxito'
	      render :new
	    end
	end

	def edit
		
	end

	def update
		
	end

	private
		def promoter_params
	      params.require(:promoter).permit(:user_id, :phone, :address, :description, :status )
	    end

end
