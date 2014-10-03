class Docs < Middleman::Extension

  def manipulate_resource_list resources
    @docs = []
    app.set :docs, @docs

    resources.map do |resource|
      if doc_file?(resource)
        @docs << resource
        resource = nil
      end
      resource
    end.compact
  end

  private

    def doc_file?(resource)
      resource.destination_path =~ /docs\/(.*)/ &&
      (resource.source_file =~ /\.(md|markdown|erb)$/)
    end

  module Helpers

    def docs_as_hash
      json = []
      docs.each do |d|
        json << { title:   d.data.title,
                  content: d.render(layout: false) }
      end

      return json
    end

  end

  helpers do
    include Helpers
  end

end
::Middleman::Extensions.register(:docs, Docs)