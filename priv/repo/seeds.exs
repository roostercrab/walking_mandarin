# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     WalkingMandarin.Repo.insert!(%WalkingMandarin.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias WalkingMandarin.Repo
alias WalkingMandarin.Languages.ChineseCharacter
alias WalkingMandarin.Accounts.User

  Repo.insert! %User{
    email: "user@email.com",
    hashed_password: "$2b$12$E1XAAqbIxPUutTnfDfEKWegMnhX9NAB1OPbQOfqwv.OX01LW4aE.K",
  }

  Repo.insert! %ChineseCharacter{
    final: "ou",
    hanzi_standard: "手",
    initial: "sh",
    meaning: "hand",
    mnemonic: "Shou me your hand! growled the warrior",
    part_of_speech: "noun",
    pinyin: "shǒu",
    pronounciation_helper: "show",
    tone: "3",
    translated_to: "English"
  }

    Repo.insert! %ChineseCharacter{
    final: "ou",
    hanzi_standard: "狗",
    initial: "g",
    meaning: "dog",
    mnemonic: "Gou dog gou! growled the warrior",
    part_of_speech: "noun",
    pinyin: "gǒu",
    pronounciation_helper: "go",
    tone: "3",
    translated_to: "English"
  }