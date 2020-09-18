$(function () {
  function buildHTML(comment) {
    let html =
      `<div class="Review-wrapper__list">
        <div class="Review-top">
          <div class="Review-icons">
            <div class="Reiview-icons__face">
              <img class="Review-icons__face--image" src="/uploads/user/image/2/staff3.jpg">
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
              <a rel="nofollow" data-method="delete" href="/jobs/2/reviews/1"><i class="far fa-trash-alt Review-infomation__right--trash"></i></a>
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
      $('.Review-wrapper').append(html);
      $('#new-comment')[0].reset();
      $('.Review-button__submit').prop('disabled', false);
    })
  })
});