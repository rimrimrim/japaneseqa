class KanjisController < ApplicationController
  before_action :set_kanji, only: [:show, :edit, :update, :destroy]

  # GET /kanjis
  # GET /kanjis.json
  def index
    @kanjis = Kanji.all
  end

  def kanjirank1
    @kanjirank1 = Kanji.find_by(rank:'1')
    render 'kanji/index'
  end

  # GET /kanjis/1
  # GET /kanjis/1.json
  def show
    @kanji = Kanji.find_by(rank:'1')
  end

  # GET /kanjis/new
  def new
    @kanji = Kanji.new
  end

  # GET /kanjis/1/edit
  def edit
  end

  # POST /kanjis
  # POST /kanjis.json
  def create
    @kanji = Kanji.new(kanji_params)

    respond_to do |format|
      if @kanji.save
        format.html { redirect_to @kanji, notice: 'Kanji was successfully created.' }
        format.json { render :show, status: :created, location: @kanji }
      else
        format.html { render :new }
        format.json { render json: @kanji.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kanjis/1
  # PATCH/PUT /kanjis/1.json
  def update
    respond_to do |format|
      if @kanji.update(kanji_params)
        format.html { redirect_to @kanji, notice: 'Kanji was successfully updated.' }
        format.json { render :show, status: :ok, location: @kanji }
      else
        format.html { render :edit }
        format.json { render json: @kanji.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kanjis/1
  # DELETE /kanjis/1.json
  def destroy
    @kanji.destroy
    respond_to do |format|
      format.html { redirect_to kanjis_url, notice: 'Kanji was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle
   post_id = params[:post_id]
   user_bookmarks = current_user.bookmarks
   if user_bookmarks.exists?(post: post_id)
     user_bookmarks.where(post: post_id).destroy_all
   else
     user_bookmarks.create(user: current_user, post: Post.find(post_id))
   end
   render :nothing => true
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kanji
      @kanjis = Kanji.find_by_id(params[:id])
      @kanjirank1 = Kanji.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kanji_params
      params.require(:kanji).permit(:rank, :word, :yomi, :japanese, :english)
    end
end
