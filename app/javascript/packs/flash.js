window.setTimeout(function () {
    $(".alert").fadeTo(500, 0).fadeTo(300, 0, function () {
        $(this).remove();
    });
}, 3000);
