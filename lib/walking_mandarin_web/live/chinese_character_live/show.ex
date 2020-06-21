defmodule WalkingMandarinWeb.ChineseCharacterLive.Show do
  use WalkingMandarinWeb, :live_view

  alias WalkingMandarin.Languages

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:chinese_character, Languages.get_chinese_character!(id))}
  end

  defp page_title(:show), do: "Show Chinese Word"
  defp page_title(:edit), do: "Edit Chinese Word"
end
