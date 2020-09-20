json.good         @review.good
json.bad          @review.bad
json.image        @review.user.image.url
json.user_id      @review.user.id
json.user_name    @review.user.nickname
json.created_at   @review.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.job          @review.job.id
json.review_id    @review.id