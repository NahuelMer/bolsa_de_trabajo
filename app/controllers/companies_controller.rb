class CompaniesController < ApplicationController
    
    before_action :set_company, only: [:show, :update, :destroy]
    skip_before_action :check_token, only: [:create]

    def create
        @company = Company.new(company_params)
        render_response
    end

    def index
        @company = Company.all
        render status: 200, json: { company: @company }
    end

    def show
        render status: 200, json: { company: @company }
    end

    def update
        @company.assign_attributes(company_params)
        render_response
    end

    def destroy
        if @company.destroy
        render status: 200
        else
        render_errors_response
        end
    end

    private

    def company_params
        params.require(:company).permit(:company_name, :contact_email)
    end

    def render_response
        if @company.save
        render status: 200, json: { company: @company }
        else
        render_errors_response
        end
    end

    def render_errors_response
        render status: 400, json: { message: @company.errors.details }
    end

    def set_company
        @company = Company.find_by(id: params[:id])
        return if @company.present?
        render status: 404, json: { message: "No se encuentra la compañia #{params[:id]}" }
        false    
    end

end
