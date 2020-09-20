$(function () {
  $('.Review-wrapper__list').on('click', ".Review-infomation__right--trash", function (e) {
    e.preventDefault();  // デフォルトのイベント（リンクURLへの遷移処理など）を無効にする
    e.stopPropagation();  // 現在のイベントのさらなる伝播（DELETEメソッドの実行）を止める
    let url = $(this).attr("href");
    $.ajax({
      url: url,
      type: "POST",  // 原則に従って"DELETE"メソッドを使用しない
      data: {
        _method: "delete",  // ここで"DELETE"メソッドを使用することを指定
      },
      dataType: "json"
    })
    .done(function(data) {
      $(".Review-wrapper__list" + data.id + data.job_id).remove();  // レスポンスデータのIDを元に投稿を削除
    })
  })
});