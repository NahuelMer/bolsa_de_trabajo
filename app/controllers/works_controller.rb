class WorksController < ApplicationController

    before_action :set_work, only: [:show, :update, :destroy, :apply]
    before_action :set_company, only: [:create, :update, :destroy]
    before_action :check_token, only: [:create, :update, :destroy]

    def create
        @work = @company.works.build(work_params)
        # @work = work.new(work_params)
        render_response
    end
  
    def index
        @work = work.all
        render status: 200, json: { work: @work }
    end
  
    def show
        render status: 200, json: { work: @work }
    end
  
    def update
        @work.assign_attributes(work_params)
        render_response
    end
  
    def destroy
        if @work.destroy
        render status: 200
        else
        render_errors_response
        end
    end

    def apply
        @candidate_work = CandidateWork.find_or_initialize_by(work_id: @work.id, candidate_id: params[:candidate_id])

        if @candidate_work.persisted?
            render status: 200, json: { message: "El candidato ya aplico al trabajo" }
        elsif @candidate_work.save
            render status: 200, json: { candidate_work: @candidate_work }
        else
            render status: 400, json: { message: @candidate_work.errors.details }
        end
    end

    private

    def work_params
        params.require(:work).permit(:work_name, :work_description)
    end
    
    def render_response
        if @work.save
            render status: 200, json: { work: @work }
        else
            render_errors_response
        end
    end

    def render_errors_response
        render status: 400, json: { message: @work.errors.details }
    end

    def set_work
        @work = work.find_by(id: params[:id])
        return if @work.present?
        render status: 404, json: { message: "No se encuentra el trabajo #{params[:id]}" }
        false    
    end

    def set_company
        # se saca la company de work por que el update no se tiene el company id en la ruta
        @company = Company.find_by(id: params[:company_id]) || @work.company
        return if @company.present?
        render status: 404, json: { message: "No se encuentra la compañia #{params[:id]}" }
        false    
    end

    def check_token
        return if request.headers["Authorization"] == @company.token
        render status: 401, json: { message: "Invalid Token" }
        false
    end
    
end
