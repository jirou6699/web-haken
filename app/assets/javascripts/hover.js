$(function () {
  $(".Header-right__devise").on("mouseover", function () {
    console.log(this)
    $(this).css({
      backgroundColor: "#EDEBE8",
    });
  });
    
  //マウスアウトしたときに元の色に戻る
  $(".Header-right__devise").on("mouseout", function () {
    $(this).css({
      color: "",
      backgroundColor: ""
    });
  });
});