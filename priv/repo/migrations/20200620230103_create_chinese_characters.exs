defmodule WalkingMandarin.Repo.Migrations.CreateChineseCharacters do
  use Ecto.Migration

  def change do
    create table(:chinese_characters) do
      add :hanzi_standard, :string
      add :hanzi_traditional, :string
      add :pinyin, :string
      add :meaning, :text
      add :pronounciation_helper, :string
      add :mnemonic, :text
      add :part_of_speech, :string
      add :radical, :string
      add :phonetic, :string
      add :initial, :string
      add :final, :string
      add :tone, :string
      add :etymology, :text
      add :image, :binary
      add :sound, :binary
      add :stroke_order_simplified, :binary
      add :stroke_order_traditional, :binary
      add :translated_to, :string
      add :vote_value, :integer

      timestamps()
    end

  end
end
