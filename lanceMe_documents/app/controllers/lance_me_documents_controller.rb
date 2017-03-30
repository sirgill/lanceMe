class LanceMeDocumentsController < ApplicationController
  before_action :set_lance_me_document, only: [:show, :edit, :update, :destroy]

  # GET /lance_me_documents
  # GET /lance_me_documents.json
  def index
    @lance_me_documents = LanceMeDocument.all

    render json: @lance_me_documents
  end

  # GET /lance_me_documents/1
  # GET /lance_me_documents/1.json
  def show
    render json: @lance_me_documents
  end

  # GET /lance_me_documents/new
  def new
    @lance_me_document = LanceMeDocument.new
  end

  # GET /lance_me_documents/1/edit
  def edit
  end

  # POST /lance_me_documents
  # POST /lance_me_documents.json
  def create
    @lance_me_document = LanceMeDocument.new(lance_me_document_params)

    respond_to do |format|
      if @lance_me_document.save
        format.html { redirect_to @lance_me_document, notice: 'Lance me document was successfully created.' }
        format.json { render :show, status: :created, location: @lance_me_document }
      else
        format.html { render :new }
        format.json { render json: @lance_me_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lance_me_documents/1
  # PATCH/PUT /lance_me_documents/1.json
  def update
    respond_to do |format|
      if @lance_me_document.update(lance_me_document_params)
        format.html { redirect_to @lance_me_document, notice: 'Lance me document was successfully updated.' }
        format.json { render :show, status: :ok, location: @lance_me_document }
      else
        format.html { render :edit }
        format.json { render json: @lance_me_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lance_me_documents/1
  # DELETE /lance_me_documents/1.json
  def destroy
    @lance_me_document.destroy
    respond_to do |format|
      format.html { redirect_to lance_me_documents_url, notice: 'Lance me document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lance_me_document
      @lance_me_document = LanceMeDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lance_me_document_params
      params.require(:lance_me_document).permit(:title, :description, :file_url, :image_url)
    end
end
