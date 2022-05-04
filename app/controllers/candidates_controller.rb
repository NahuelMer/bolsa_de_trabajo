class CandidatesController < ApplicationController

    before_action :set_candidate, only: [:show, :update, :destroy]
    skip_before_action :check_token, only: [:create]

    def create
        @candidate = candidate.new(candidate_params)
        render_response
    end

    def index
        @candidate = candidate.all
        render status: 200, json: { candidate: @candidate }
    end

    def show
        render status: 200, json: { candidate: @candidate }
    end

    def update
        @candidate.assign_attributes(candidate_params)
        render_response
    end

    def destroy
        if @candidate.destroy
        render status: 200
        else
        render_errors_response
        end
    end

    private

    def candidate_params
        params.require(:candidate).permit(:candidate_name, :candidate_email)
    end

    def render_response
        if @candidate.save
        render status: 200, json: { candidate: @candidate }
        else
        render_errors_response
        end
    end

    def render_errors_response
        render status: 400, json: { message: @candidate.errors.details }
    end

    def set_candidate
        @candidate = candidate.find_by(id: params[:id])
        return if @candidate.present?
        render status: 404, json: { message: "No se encuentra el candidato #{params[:id]}" }
        false    
    end

end
