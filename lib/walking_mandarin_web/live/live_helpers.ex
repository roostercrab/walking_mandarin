defmodule WalkingMandarinWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `WalkingMandarinWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, WalkingMandarinWeb.ChineseCharacterLive.FormComponent,
        id: @chinese_character.id || :new,
        action: @live_action,
        chinese_character: @chinese_character,
        return_to: Routes.chinese_character_index_path(@socket, :index) %>
  """
  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(socket, WalkingMandarinWeb.ModalComponent, modal_opts)
  end
end
