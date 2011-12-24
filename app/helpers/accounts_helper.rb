module AccountsHelper
  include ApplicationHelper

  def popovers
    {
      account_type: {
        title: "Account Type",
        content: "This is the type of account you'll have on Bard.
          Click on each button to find out more." },
      company_name: {
        title: "Company Name",
        content: "This is the name of your company." },
      role: {
        title: "Role Field",
        content: "The role field is further classification of your account." },
      email: {
        title: "Email Field",
        content: "We will never sell or distribute your email. Even if you
          tell us to." },
      name: {
        title: "Name Field",
        content: "This field is for your full name, for example
          'John Q. Public'." },
      password: {
        title: "Password Field",
        content: "Your password can be 8 letters, 256 alpha-numeric-symbol
          characters, or anything in between. Your choice." },
      confirmation: {
        title: "Password Confirmation",
        content: "Simply retype your password here, exactly as you did above." }
    }
  end


end
