# frozen_string_literal: true

module Decidim
  module JitsiMeetings
    PageType = GraphQL::ObjectType.define do
      name "JitsiMeeting"
      description "A jitsi meeting"

      field :id, !types.ID
      field :api, !Decidim::Core::TranslatedFieldType, "The api of this jitsi meeting (same as the component name)."
      field :domain, !Decidim::Core::TranslatedFieldType, "The domain of this jitsi meeting (same as the component name)."
      field :room_name, !Decidim::Core::TranslatedFieldType, "The room name of this jitsi meeting (same as the component name)."
      field :createdAt, !Decidim::Core::DateTimeType, "The time this jitsi meeting was created", property: :created_at
      field :updatedAt, !Decidim::Core::DateTimeType, "The time this jitsi meeting was updated", property: :updated_at
    end
  end
end