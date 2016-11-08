class ProposalsController < ApplicationController

  def create
    @proposal = Proposal.new(proposal_params)
    if @proposal.save
      notifier = Slack::Notifier.new ENV.fetch('slack_webhook_url')
      notifier.ping "#{@proposal.name} (#{@proposal.country})", icon_emoji: ':wikihouse:', username: "Pilot Project Proposals"
      render text: 'woo'
    else
      render text: 'fail'
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
    render :show, layout: false
  end

  private

    def proposal_params
      params.require(:proposal).permit!
    end
end
