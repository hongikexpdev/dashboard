defmodule PublicHtml.PageController do
  use PublicHtml.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
