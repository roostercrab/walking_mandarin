defmodule WalkingMandarin.LanguagesTest do
  use WalkingMandarin.DataCase

  alias WalkingMandarin.Languages

  describe "chinese_characters" do
    alias WalkingMandarin.Languages.ChineseCharacter

    @valid_attrs %{etymology: "some etymology", final: "some final", hanzi_standard: "some hanzi_standard", hanzi_traditional: "some hanzi_traditional", image: "some image", initial: "some initial", meaning: "some meaning", mnemonic: "some mnemonic", part_of_speech: "some part_of_speech", phonetic: "some phonetic", pinyin: "some pinyin", pronounciation_helper: "some pronounciation_helper", radical: "some radical", sound: "some sound", stroke_order_simplified: "some stroke_order_simplified", stroke_order_traditional: "some stroke_order_traditional", tone: "some tone", translated_to: "some translated_to", vote_value: 42}
    @update_attrs %{etymology: "some updated etymology", final: "some updated final", hanzi_standard: "some updated hanzi_standard", hanzi_traditional: "some updated hanzi_traditional", image: "some updated image", initial: "some updated initial", meaning: "some updated meaning", mnemonic: "some updated mnemonic", part_of_speech: "some updated part_of_speech", phonetic: "some updated phonetic", pinyin: "some updated pinyin", pronounciation_helper: "some updated pronounciation_helper", radical: "some updated radical", sound: "some updated sound", stroke_order_simplified: "some updated stroke_order_simplified", stroke_order_traditional: "some updated stroke_order_traditional", tone: "some updated tone", translated_to: "some updated translated_to", vote_value: 43}
    @invalid_attrs %{etymology: nil, final: nil, hanzi_standard: nil, hanzi_traditional: nil, image: nil, initial: nil, meaning: nil, mnemonic: nil, part_of_speech: nil, phonetic: nil, pinyin: nil, pronounciation_helper: nil, radical: nil, sound: nil, stroke_order_simplified: nil, stroke_order_traditional: nil, tone: nil, translated_to: nil, vote_value: nil}

    def chinese_character_fixture(attrs \\ %{}) do
      {:ok, chinese_character} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Languages.create_chinese_character()

      chinese_character
    end

    test "list_chinese_characters/0 returns all chinese_characters" do
      chinese_character = chinese_character_fixture()
      assert Languages.list_chinese_characters() == [chinese_character]
    end

    test "get_chinese_character!/1 returns the chinese_character with given id" do
      chinese_character = chinese_character_fixture()
      assert Languages.get_chinese_character!(chinese_character.id) == chinese_character
    end

    test "create_chinese_character/1 with valid data creates a chinese_character" do
      assert {:ok, %ChineseCharacter{} = chinese_character} = Languages.create_chinese_character(@valid_attrs)
      assert chinese_character.etymology == "some etymology"
      assert chinese_character.final == "some final"
      assert chinese_character.hanzi_standard == "some hanzi_standard"
      assert chinese_character.hanzi_traditional == "some hanzi_traditional"
      assert chinese_character.image == "some image"
      assert chinese_character.initial == "some initial"
      assert chinese_character.meaning == "some meaning"
      assert chinese_character.mnemonic == "some mnemonic"
      assert chinese_character.part_of_speech == "some part_of_speech"
      assert chinese_character.phonetic == "some phonetic"
      assert chinese_character.pinyin == "some pinyin"
      assert chinese_character.pronounciation_helper == "some pronounciation_helper"
      assert chinese_character.radical == "some radical"
      assert chinese_character.sound == "some sound"
      assert chinese_character.stroke_order_simplified == "some stroke_order_simplified"
      assert chinese_character.stroke_order_traditional == "some stroke_order_traditional"
      assert chinese_character.tone == "some tone"
      assert chinese_character.translated_to == "some translated_to"
      assert chinese_character.vote_value == 42
    end

    test "create_chinese_character/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Languages.create_chinese_character(@invalid_attrs)
    end

    test "update_chinese_character/2 with valid data updates the chinese_character" do
      chinese_character = chinese_character_fixture()
      assert {:ok, %ChineseCharacter{} = chinese_character} = Languages.update_chinese_character(chinese_character, @update_attrs)
      assert chinese_character.etymology == "some updated etymology"
      assert chinese_character.final == "some updated final"
      assert chinese_character.hanzi_standard == "some updated hanzi_standard"
      assert chinese_character.hanzi_traditional == "some updated hanzi_traditional"
      assert chinese_character.image == "some updated image"
      assert chinese_character.initial == "some updated initial"
      assert chinese_character.meaning == "some updated meaning"
      assert chinese_character.mnemonic == "some updated mnemonic"
      assert chinese_character.part_of_speech == "some updated part_of_speech"
      assert chinese_character.phonetic == "some updated phonetic"
      assert chinese_character.pinyin == "some updated pinyin"
      assert chinese_character.pronounciation_helper == "some updated pronounciation_helper"
      assert chinese_character.radical == "some updated radical"
      assert chinese_character.sound == "some updated sound"
      assert chinese_character.stroke_order_simplified == "some updated stroke_order_simplified"
      assert chinese_character.stroke_order_traditional == "some updated stroke_order_traditional"
      assert chinese_character.tone == "some updated tone"
      assert chinese_character.translated_to == "some updated translated_to"
      assert chinese_character.vote_value == 43
    end

    test "update_chinese_character/2 with invalid data returns error changeset" do
      chinese_character = chinese_character_fixture()
      assert {:error, %Ecto.Changeset{}} = Languages.update_chinese_character(chinese_character, @invalid_attrs)
      assert chinese_character == Languages.get_chinese_character!(chinese_character.id)
    end

    test "delete_chinese_character/1 deletes the chinese_character" do
      chinese_character = chinese_character_fixture()
      assert {:ok, %ChineseCharacter{}} = Languages.delete_chinese_character(chinese_character)
      assert_raise Ecto.NoResultsError, fn -> Languages.get_chinese_character!(chinese_character.id) end
    end

    test "change_chinese_character/1 returns a chinese_character changeset" do
      chinese_character = chinese_character_fixture()
      assert %Ecto.Changeset{} = Languages.change_chinese_character(chinese_character)
    end
  end
end
