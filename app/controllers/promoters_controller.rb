class PromotersController < ApplicationController
	before_action :authenticate_user!, except: [ :index ]
	before_action :is_promoter?, except: [ :index, :new, :create, :update ]
  	before_filter :validate_user, only: [ :profile, :edit, :destroy ]
	

	def new
		@promoter = Promoter.new
	end

	def create
		@promoter = Promoter.new(promoter_params)
	    @promoter.user = current_user

	    if @promoter.save
	      flash[:notice] = 'Ha sido creado con exito. La administración revisara su solicitud, y pronto le dará una respuesta, este atento!'
	      redirect_to promoter_path(@promoter)
	    else
	      flash[:alert] = 'Algo fallo, el promotor no ha sido creado con éxito'
	      render :new
	      
	    end
	end

	def edit
	    @promoter = Promoter.find(params[:id])
	end

	def update
	    @promoter = Promoter.find(params[:id])

	    if @promoter.update(promoter_params)
	      flash[:notice] = 'El promotor ha sido actualizado con éxito'
	      redirect_to promoter_path(@promoter)
	    else
	      flash[:alert] = 'Algo fallo, el promoter no ha sido actualizado con éxito'
	      render :edit
	    end
	end

	def show
		@promoter = Promoter.find(params[:id])
	end

	def profile
		@promoter = Promoter.find(params[:id])
	end

	private
		def promoter_params
	      params.require(:promoter).permit(:user_id, :phone, :address, :description, :status, :photo, :city_id )
	    end

	    def is_promoter?
	      unless current_user.promoter?
	       flash[:alert] = 'No tienes permisos para acceder a esta ruta, debes estar registrado como promotor'
	       redirect_to new_promoter_path
	      end
	    end

	    def validate_user
	      @promoter = Promoter.find(params[:id])
	      if current_user.id.to_s != @promoter.user_id.to_s
	        redirect_to root_path
	        flash[:alert] = 'No tienes permisos para acceder a esta ruta'
	      end
	    end



end
