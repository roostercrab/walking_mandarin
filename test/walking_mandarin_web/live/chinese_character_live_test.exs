defmodule WalkingMandarinWeb.ChineseCharacterLiveTest do
  use WalkingMandarinWeb.ConnCase

  import Phoenix.LiveViewTest

  alias WalkingMandarin.Languages

  @create_attrs %{etymology: "some etymology", final: "some final", hanzi_standard: "some hanzi_standard", hanzi_traditional: "some hanzi_traditional", image: "some image", initial: "some initial", meaning: "some meaning", mnemonic: "some mnemonic", part_of_speech: "some part_of_speech", phonetic: "some phonetic", pinyin: "some pinyin", pronounciation_helper: "some pronounciation_helper", radical: "some radical", sound: "some sound", stroke_order_simplified: "some stroke_order_simplified", stroke_order_traditional: "some stroke_order_traditional", tone: "some tone", translated_to: "some translated_to", vote_value: 42}
  @update_attrs %{etymology: "some updated etymology", final: "some updated final", hanzi_standard: "some updated hanzi_standard", hanzi_traditional: "some updated hanzi_traditional", image: "some updated image", initial: "some updated initial", meaning: "some updated meaning", mnemonic: "some updated mnemonic", part_of_speech: "some updated part_of_speech", phonetic: "some updated phonetic", pinyin: "some updated pinyin", pronounciation_helper: "some updated pronounciation_helper", radical: "some updated radical", sound: "some updated sound", stroke_order_simplified: "some updated stroke_order_simplified", stroke_order_traditional: "some updated stroke_order_traditional", tone: "some updated tone", translated_to: "some updated translated_to", vote_value: 43}
  @invalid_attrs %{etymology: nil, final: nil, hanzi_standard: nil, hanzi_traditional: nil, image: nil, initial: nil, meaning: nil, mnemonic: nil, part_of_speech: nil, phonetic: nil, pinyin: nil, pronounciation_helper: nil, radical: nil, sound: nil, stroke_order_simplified: nil, stroke_order_traditional: nil, tone: nil, translated_to: nil, vote_value: nil}

  defp fixture(:chinese_character) do
    {:ok, chinese_character} = Languages.create_chinese_character(@create_attrs)
    chinese_character
  end

  defp create_chinese_character(_) do
    chinese_character = fixture(:chinese_character)
    %{chinese_character: chinese_character}
  end

  describe "Index" do
    setup [:create_chinese_character]

    test "lists all chinese_characters", %{conn: conn, chinese_character: chinese_character} do
      {:ok, _index_live, html} = live(conn, Routes.chinese_character_index_path(conn, :index))

      assert html =~ "Listing Chinese Words"
      assert html =~ chinese_character.etymology
    end

    test "saves new chinese_character", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.chinese_character_index_path(conn, :index))

      assert index_live |> element("a", "New Chinese Word") |> render_click() =~
               "New Chinese Word"

      assert_patch(index_live, Routes.chinese_character_index_path(conn, :new))

      assert index_live
             |> form("#chinese_character-form", chinese_character: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#chinese_character-form", chinese_character: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.chinese_character_index_path(conn, :index))

      assert html =~ "Chinese Word created successfully"
      assert html =~ "some etymology"
    end

    test "updates chinese_character in listing", %{conn: conn, chinese_character: chinese_character} do
      {:ok, index_live, _html} = live(conn, Routes.chinese_character_index_path(conn, :index))

      assert index_live |> element("#chinese_character-#{chinese_character.id} a", "Edit") |> render_click() =~
               "Edit Chinese Word"

      assert_patch(index_live, Routes.chinese_character_index_path(conn, :edit, chinese_character))

      assert index_live
             |> form("#chinese_character-form", chinese_character: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#chinese_character-form", chinese_character: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.chinese_character_index_path(conn, :index))

      assert html =~ "Chinese Word updated successfully"
      assert html =~ "some updated etymology"
    end

    test "deletes chinese_character in listing", %{conn: conn, chinese_character: chinese_character} do
      {:ok, index_live, _html} = live(conn, Routes.chinese_character_index_path(conn, :index))

      assert index_live |> element("#chinese_character-#{chinese_character.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#chinese_character-#{chinese_character.id}")
    end
  end

  describe "Show" do
    setup [:create_chinese_character]

    test "displays chinese_character", %{conn: conn, chinese_character: chinese_character} do
      {:ok, _show_live, html} = live(conn, Routes.chinese_character_show_path(conn, :show, chinese_character))

      assert html =~ "Show Chinese Word"
      assert html =~ chinese_character.etymology
    end

    test "updates chinese_character within modal", %{conn: conn, chinese_character: chinese_character} do
      {:ok, show_live, _html} = live(conn, Routes.chinese_character_show_path(conn, :show, chinese_character))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Chinese Word"

      assert_patch(show_live, Routes.chinese_character_show_path(conn, :edit, chinese_character))

      assert show_live
             |> form("#chinese_character-form", chinese_character: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#chinese_character-form", chinese_character: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.chinese_character_show_path(conn, :show, chinese_character))

      assert html =~ "Chinese Word updated successfully"
      assert html =~ "some updated etymology"
    end
  end
end
