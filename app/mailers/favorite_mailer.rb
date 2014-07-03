class FavoriteMailer < ActionMailer::Base
  default from: "jeffsabbun@gmail.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    # New Headers
    headers["Message-ID"] = "<comments/#{@comment.id}@avengerit.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{@post.id}@avengerit.herokuapp.com>"
    headers["References"] = "<post/#{@post.id}@avengerit.herokuapp.com>"

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
