defmodule Site.Blog.Post do
  @enforce_keys [
    :id,
    :author,
    :title,
    :body,
    :description,
    :tags,
    :date,
    :image,
    :language,
    :image_description
  ]
  defstruct [
    :id,
    :author,
    :title,
    :body,
    :description,
    :tags,
    :date,
    :image,
    :language,
    :image_description
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          author: String.t(),
          title: String.t(),
          body: String.t(),
          description: String.t(),
          tags: [String.t()],
          date: Date.t(),
          image: String.t(),
          language: String.t(),
          image_description: String.t()
        }

  def build(filename, attrs, body) do
    [year, rest] = filename |> Path.rootname() |> Path.split() |> Enum.take(-2)
    [month, day, language, id] = String.split(rest, "-", parts: 4)
    date = Date.from_iso8601!("#{year}-#{month}-#{day}")

    struct!(
      __MODULE__,
      [id: id, date: date, body: body, image: "#{id}.png", language: language] ++
        Map.to_list(attrs)
    )
  end
end
