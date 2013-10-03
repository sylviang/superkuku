class SearchSuggestionsController < ApplicationController
  def index
    render json: SearchSuggestion.terms_for(params[:term])
    #render json: %w[foo bar]
  end

 	# Never trust parameters from the scary internet, only allow the white list through.
  #def post_params
  #  params.require(:search_suggestion).permit(:popularity, :item)
  #end
end