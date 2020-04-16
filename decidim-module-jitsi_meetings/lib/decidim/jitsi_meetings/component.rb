# frozen_string_literal: true

require_dependency "decidim/components/namer"

Decidim.register_component(:jitsi_meetings) do |component|
  component.engine = Decidim::JitsiMeetings::Engine
  component.admin_engine = Decidim::JitsiMeetings::AdminEngine
  component.icon = "decidim/jitsi_meetings/icon.svg"
  component.permissions_class_name = "Decidim::JitsiMeetings::Permissions"

  # component.query_type = "Decidim::JitsiMeetings::JitsiMeetingsType"

  component.on(:create) do |instance|
    Decidim::JitsiMeetings::CreateJitsiMeeting.call(instance) do
      on(:invalid) { raise "Can't create jitsi meeting" }
    end
  end

  component.on(:destroy) do |instance|
    Decidim::JitsiMeetings::DestroyJitsiMeeting.call(instance) do
      on(:error) { raise "Can't destroy jitsi meeting" }
    end
  end

  component.on(:copy) do |context|
    Decidim::JitsiMeetings::CopyJitsiMeeting.call(context) do
      on(:invalid) { raise "Can't duplicate jitsi meeting" }
    end
  end

  component.settings(:global) do |settings|
    settings.attribute :announcement, type: :text, translated: true, editor: true
  end

  component.settings(:step) do |settings|
    settings.attribute :announcement, type: :text, translated: true, editor: true
  end

  component.register_resource(:jitsi_meeting) do |resource|
    resource.model_class_name = "Decidim::JitsiMeetings::JitsiMeeting"
  end

  component.seeds do |participatory_space|
    component = Decidim::Component.create!(
      name: Decidim::Components::Namer.new(participatory_space.organization.available_locales, :jitsi_meetings).i18n_name,
      manifest_name: :jitsi_meetings,
      published_at: Time.current,
      participatory_space: participatory_space
    )

    Decidim::JitsiMeetings::JitsiMeeting.create!(
      component: component,
      api: "https://meet.jit.si/external_api.js",
      domain: "meet.jit.si",
      room_name: Faker::Name.unique.name,
    )
  end
end
