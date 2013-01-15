require 'spec_helper'

describe GamesController do
  #def destroy
  #  @movie = Movie.find(params[:id])
  #  @movie.destroy
  #  flash[:notice] = "Movie '#{@movie.title}' deleted."
  #  redirect_to movies_path
  #end
  # def mock_movie(stubs={})
  #     @mock_movie ||= mock_model(Movie, stubs).as_null_object
  # end


  describe 'creating game' do
    fixtures :games
    it 'creates game' do
      Game.create!(:place => 'Zopa', :price => 1155)
      zopa = Game.find_by_place('Zopa')
      assert zopa.place=="Zopa"
      assert zopa.price==1155
      #post 'create' , :game => {:place => 'Torpedo', :price => 1155}
    end
  end

  describe 'deleting game' do
    fixtures :games
    it 'deletes game' do
      torpedo = Game.find_by_place('Torpedo')
      assert torpedo.place=="Torpedo"
      torpedo.delete
      assert Game.find_by_place('Torpedo').nil?
    end
  end




end