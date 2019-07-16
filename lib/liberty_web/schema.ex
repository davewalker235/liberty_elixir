defmodule Liberty.Schema do
  use Absinthe.Schema

  import_types Absinthe.Type.Custom
  import_types Liberty.Schema.Season

  query do

    @desc "Get all seasons"
    field :seasons, list_of(:season) do
      resolve &Liberty.Resolvers.Scoring.list_seasons/3
    end

  end

  # mutation do
  #
  #   @desc "Create a post"
  #   field :create_post, :post do
  #     arg :title, non_null(:string)
  #     arg :body, non_null(:string)
  #     arg :published_at, :naive_datetime
  #
  #     resolve &Resolvers.Content.create_post/3
  #   end
  #
  #   @desc "Create a user"
  #   field :create_user, :user do
  #     arg :name, non_null(:string)
  #     arg :contact, non_null(:contact_input)
  #     arg :password, non_null(:string)
  #
  #     resolve &Resolvers.Accounts.create_user/3
  #   end
  #
  # end

end
