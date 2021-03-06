# frozen_string_literal: true

require './app/models/developer/onboarding'
require './app/operations/ops/developer/invite_to_github'

module Developer
  class Onboarding
    # Runs onboarding step in asyncronous manner.
    # Allows to retry if the step failure is caused by
    # bad HTTP call to 3rd party API endpoint.
    class GithubJob < ApplicationJob
      queue_as :default

      def perform(user_id)
        user = User.find(user_id)
        ::Ops::Developer::InviteToGithub.call(user: user)
      end
    end
  end
end
