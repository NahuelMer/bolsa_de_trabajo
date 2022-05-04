class WorksController < ApplicationController

    before_action :set_work, only: [:show, :update, :destroy]
    skip_before_action :check_token, only: [:create]

    def create
        company = Company.find_by(id: params[:company_id])
        @work = company.works.build(work_params)
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
    
end
