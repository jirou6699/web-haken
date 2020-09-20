$(function () {
  function buildHTML(comment) {
    let html =
      `<div class="Review-wrapper__list">
        <div class="Review-top">
          <div class="Review-icons">
            <div class="Review-icons__face">
              <img class="Review-icons__face--image" src = "${comment.image}">
            </div>
            <div class="Review-icons__nickname">
              ${comment.user_name}
            </div>
          </div>
          <div class="Review-time">
            ${comment.created_at}
          </div>
        </div>
        <div class="Review-infomation">
          <div class="Review-infomation__left">
            <div class="Review-infomation__left--good"></div>
              【よかった点】
            <div class="Review-infomation__left--text">
              ${comment.good}
            </div>
            <div class="Review-infomation__left--good"></div>
              【わるかった点】
            <div class="Review-infomation__left--text">
              ${comment.bad}
            </div>
          </div>
          <div class="Review-infomation__right">
            <div class="Review-infomation__right--destroy">
              <a rel="nofollow" data-method="delete" href= "/jobs/${comment.job}/reviews/${comment.review_id}"><i class="far fa-trash-alt Review-infomation__right--trash"></i></a>
            </div>
          </div>
        </div>
      </div>`
    return html;
  }

  $('#new-comment').on('submit', function(e){
    e.preventDefault();
    console.log(this)
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function (data) {
      let html = buildHTML(data);
      console.log(html)
      $('.Review-wrapper__title').append(html);
      $('#new-comment')[0].reset();
      $('.Review-button__submit').prop('disabled', false);
    })
  })

  $('.Review-wrapper__list').on('click', ".Review-infomation__right--trash", function(e) {
    e.preventDefault();
    console.log(this)
    // // stopPropagationがないとHTMLとJSONの
    // // リクエストが同時に送られてしまう
    // e.preventDefault();
    // e.stopPropagation();

    // //リンクに含まれるURLを取得する
    // var url = $(this).attr('href');

    // $.ajax({
    //   url: url,
    //   type: "DELETE",
    //   dataType: 'json',
    //   // CSRF tokenを発行する
    //   beforeSend: function (xhr) { xhr.setRequestHeader("X-CSRF-Token", $('meta[name="csrf-token"]').attr('content')) }
    // })
    //   .done(function (data) {
    //     成功した時
    //   })
    //   .fail(function () {
    //     失敗した時
    //   })
  })
});