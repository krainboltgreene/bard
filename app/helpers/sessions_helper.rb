module SessionsHelper
  include ApplicationHelper

  def popovers
    {
      email: {
        title: "Email Field",
        content: "Enter the email address you used to sign up." },
      password: {
        title: "Password Field",
        content: "Enter the password you used to sign up. It's between 8 and
          256 characters long, letters and numbers." },
      remember_me: {
        title: "Remember Me!",
        content: "Check this and you wont log out for another 7 days." }
    }
  end
end
