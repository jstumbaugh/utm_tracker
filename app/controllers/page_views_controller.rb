class PageViewsController < ApiController
  before_action :set_page_view, only: [:show, :update, :destroy]

  # GET /page_views
  def index
    @page_views = PageView.all
    json_response(@page_views)
  end

  # POST /page_views
  def create
    @page_view = PageView.create!(page_view_params)
    json_response(@page_view, :created)
  end

  # GET /page_views/:id
  def show
    json_response(@page_view)
  end

  # PUT /page_views/:id
  def update
    @page_view.update(page_view_params)
    head :no_content
  end

  # DELETE /page_views/:id
  def destroy
    @page_view.destroy
  end

  private

    # Whitelist params
    def page_view_params
      params.permit(:viewed_at, :utm_source, :utm_campaign, :utm_medium)
    end

    def set_page_view
      @page_view = PageView.find(params[:id])
    end
end
