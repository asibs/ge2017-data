class StaticPagesController < ApplicationController
  def howto
    @page = :howto

    @og = {}
    @og[:title] = 'A Progressive Alliance: How To Help'
    @og[:description] = "Everyone can do something. Here's how..."
    @og[:image] = 'og-image-howto.png'
  end

  def vote
    @page = :vote

    @og = {}
    @og[:title] = 'A Progressive Allianc: How To Vote'
    @og[:description] = "Only you can decide how to vote, but we can show you some sites that might help."
    @og[:image] = nil
  end

  def reports
    @page = :reports

    @og = {}
    @og[:title] = 'The Rebel Alliance: Reports'
    @og[:description] = "Find out more about the constituencies in this election."
    @og[:image] = nil
  end

  def about
    @page = :about

    @og = {}
    @og[:title] = 'The Rebel Alliance: About'
    @og[:description] = "Find out more about The Rebel Alliance website."
    @og[:image] = nil
  end
end
