class PagesController < ApplicationController
  def home
  	@posts = Blog.all
  	@skills = Skill.all
    @page_title = 'Jason Woo | Home'
  end

  def about
    @page_title = 'Jason Woo | About'
    @skills = Skill.all
  end

  def contact
    @page_title = 'Jason Woo | Contact'
  end

  def tech_news
    @tweets = SocialTool.twitter_search
    @page_title = 'Jason Woo | News'
  end
end
