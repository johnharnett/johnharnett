
window.onpopstate = function (event) {
    if (event.state) {
        content = event.state.plate;
        console.log(content);
    }

    document.location.reload();
}