module AccountsHelper
  include ApplicationHelper

  def popovers
    {
      account_type: {
        title: "Account Type",
        content: "This is the type of account you'll have on Bard.
          Click on each button to find out more." }
    }
  end


end
