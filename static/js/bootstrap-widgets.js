$(document).ready(function() {
  var activeClass = "active";

  var currentActive = null;
  $('.navigation-widget-links li input').each(function (i, obj) {
    var linkUrl = $(obj).attr("value");
    if (window.location.pathname ==
        ("/" + linkUrl)) {
      currentActive = $(obj).parent();
      activateLink();
    }
  });

  function activateLink() {
    $(currentActive).addClass(activeClass);
  }

  function deactivateLink() {
    $(currentActive).removeClass(activeClass);
  }

  $('.navigation-widget-links li').click(function () {
    deactivateLink();
    currentActive = this;
    activateLink();
  });
});
