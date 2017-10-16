class TeamMembersController < ApplicationController

  def show
    @team_member = TeamMember.friendly.find(params[:id])

    @back_arrow_info = { :name => "about us", :link => flash_exec_path(:exec => 'scroll_to_about_us', :url => URI(!request.referer.nil? ? request.referer : '/home').path) }

    @meta_title = meta_title @team_member.name
    @meta_description = "Voyage team member – #{@team_member.name}"
  end

end
