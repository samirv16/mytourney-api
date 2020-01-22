class TeamsController < ApplicationController

    def index
        @teams = Team.all 

        render json: @teams, status: 200
    end

    def show
        @team = Team.find(params: [:id])

        render json: @team, status: 200
    end

    def create
        @team = Team.create(team_params)

        render json: @team, status: 200
    end

    def update
        @team = Team.find(params: [:id])
        @team = Team.update(team_params)
        render json: @team, status: 200
    end

    def destroy
        @team = Team.find(params: [:id])
        @team.delete

        render json: {teamID: @team.id}
    end

    private

    def team_params
        params.require(:team).permit(:name)
    end
    
end
