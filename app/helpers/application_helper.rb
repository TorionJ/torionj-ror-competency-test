module ApplicationHelper
    def user?(user)
        return if !current_user
        current_user.role == user
    end
    
    def editor?(article)
        return if !current_user
        article = Article.where(id: article.id).first
        article.user == current_user
    end

    def article_showing?(id)
        return if !current_user
        request.env['PATH_INFO'] == "/articles/#{id}"
    end
end
