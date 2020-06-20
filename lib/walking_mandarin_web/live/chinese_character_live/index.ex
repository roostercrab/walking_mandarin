defmodule WalkingMandarinWeb.ChineseCharacterLive.Index do
  use WalkingMandarinWeb, :live_view

  alias WalkingMandarin.Languages
  alias WalkingMandarin.Languages.ChineseCharacter

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :chinese_characters, list_chinese_characters())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Chinese character")
    |> assign(:chinese_character, Languages.get_chinese_character!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Chinese character")
    |> assign(:chinese_character, %ChineseCharacter{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Chinese characters")
    |> assign(:chinese_character, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    chinese_character = Languages.get_chinese_character!(id)
    {:ok, _} = Languages.delete_chinese_character(chinese_character)

    {:noreply, assign(socket, :chinese_characters, list_chinese_characters())}
  end

  defp list_chinese_characters do
    Languages.list_chinese_characters()
  end
end
