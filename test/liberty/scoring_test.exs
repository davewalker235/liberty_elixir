defmodule Liberty.ScoringTest do
  use Liberty.DataCase

  alias Liberty.Scoring

  describe "seasons" do
    alias Liberty.Scoring.Season

    @valid_attrs %{dates: [], title: "some title"}
    @update_attrs %{dates: [], title: "some updated title"}
    @invalid_attrs %{dates: nil, title: nil}

    def season_fixture(attrs \\ %{}) do
      {:ok, season} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Scoring.create_season()

      season
    end

    test "list_seasons/0 returns all seasons" do
      season = season_fixture()
      assert Scoring.list_seasons() == [season]
    end

    test "get_season!/1 returns the season with given id" do
      season = season_fixture()
      assert Scoring.get_season!(season.id) == season
    end

    test "create_season/1 with valid data creates a season" do
      assert {:ok, %Season{} = season} = Scoring.create_season(@valid_attrs)
      assert season.dates == []
      assert season.title == "some title"
    end

    test "create_season/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scoring.create_season(@invalid_attrs)
    end

    test "update_season/2 with valid data updates the season" do
      season = season_fixture()
      assert {:ok, %Season{} = season} = Scoring.update_season(season, @update_attrs)
      assert season.dates == []
      assert season.title == "some updated title"
    end

    test "update_season/2 with invalid data returns error changeset" do
      season = season_fixture()
      assert {:error, %Ecto.Changeset{}} = Scoring.update_season(season, @invalid_attrs)
      assert season == Scoring.get_season!(season.id)
    end

    test "delete_season/1 deletes the season" do
      season = season_fixture()
      assert {:ok, %Season{}} = Scoring.delete_season(season)
      assert_raise Ecto.NoResultsError, fn -> Scoring.get_season!(season.id) end
    end

    test "change_season/1 returns a season changeset" do
      season = season_fixture()
      assert %Ecto.Changeset{} = Scoring.change_season(season)
    end
  end
end
