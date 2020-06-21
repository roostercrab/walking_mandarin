defmodule WalkingMandarin.Languages do
  @moduledoc """
  The Languages context.
  """

  import Ecto.Query, warn: false
  alias WalkingMandarin.Repo

  alias WalkingMandarin.Languages.ChineseCharacter

  @doc """
  Returns the list of chinese_characters.

  ## Examples

      iex> list_chinese_characters()
      [%ChineseCharacter{}, ...]

  """
  def list_chinese_characters do
    Repo.all(ChineseCharacter)
  end

  @doc """
  Gets a single chinese_character.

  Raises `Ecto.NoResultsError` if the Chinese Word does not exist.

  ## Examples

      iex> get_chinese_character!(123)
      %ChineseCharacter{}

      iex> get_chinese_character!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chinese_character!(id), do: Repo.get!(ChineseCharacter, id)

  @doc """
  Creates a chinese_character.

  ## Examples

      iex> create_chinese_character(%{field: value})
      {:ok, %ChineseCharacter{}}

      iex> create_chinese_character(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chinese_character(attrs \\ %{}) do
    %ChineseCharacter{}
    |> ChineseCharacter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chinese_character.

  ## Examples

      iex> update_chinese_character(chinese_character, %{field: new_value})
      {:ok, %ChineseCharacter{}}

      iex> update_chinese_character(chinese_character, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chinese_character(%ChineseCharacter{} = chinese_character, attrs) do
    chinese_character
    |> ChineseCharacter.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a chinese_character.

  ## Examples

      iex> delete_chinese_character(chinese_character)
      {:ok, %ChineseCharacter{}}

      iex> delete_chinese_character(chinese_character)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chinese_character(%ChineseCharacter{} = chinese_character) do
    Repo.delete(chinese_character)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chinese_character changes.

  ## Examples

      iex> change_chinese_character(chinese_character)
      %Ecto.Changeset{data: %ChineseCharacter{}}

  """
  def change_chinese_character(%ChineseCharacter{} = chinese_character, attrs \\ %{}) do
    ChineseCharacter.changeset(chinese_character, attrs)
  end
end
