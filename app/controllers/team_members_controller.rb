class TeamMembersController < ApplicationController

  def show
    @team_member = TeamMember.find(params[:id])

    @back_arrow_info = { :name => "about us", :link => flash_exec_path(:exec => 'scroll_to_about_us', :url => URI(!request.referer.nil? ? request.referer : '/home').path) }
  end

end
