class SubscriptionsController < ApplicationController
  before_filter :find_subscription, :except => :index

  def index
    respond_to do |format|
      format.html do
        if user.subscriptions.length == 1
          redirect_to(subscription_url(user.subscriptions.first))
          return
        end
      end

      format.xml { render :xml => user.subscriptions.to_xml(:root => "subscriptions") }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml { render :xml => subscription }
    end
  end
end
