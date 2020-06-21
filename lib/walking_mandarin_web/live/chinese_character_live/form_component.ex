defmodule WalkingMandarinWeb.ChineseCharacterLive.FormComponent do
  use WalkingMandarinWeb, :live_component

  alias WalkingMandarin.Languages

  @impl true
  def update(%{chinese_character: chinese_character} = assigns, socket) do
    changeset = Languages.change_chinese_character(chinese_character)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"chinese_character" => chinese_character_params}, socket) do
    changeset =
      socket.assigns.chinese_character
      |> Languages.change_chinese_character(chinese_character_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"chinese_character" => chinese_character_params}, socket) do
    save_chinese_character(socket, socket.assigns.action, chinese_character_params)
  end

  defp save_chinese_character(socket, :edit, chinese_character_params) do
    case Languages.update_chinese_character(socket.assigns.chinese_character, chinese_character_params) do
      {:ok, _chinese_character} ->
        {:noreply,
         socket
         |> put_flash(:info, "Chinese Word updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_chinese_character(socket, :new, chinese_character_params) do
    case Languages.create_chinese_character(chinese_character_params) do
      {:ok, _chinese_character} ->
        {:noreply,
         socket
         |> put_flash(:info, "Chinese Word created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
