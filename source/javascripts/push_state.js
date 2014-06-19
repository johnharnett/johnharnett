function burger() {
    // URL will change to /plate/burger
    history.pushState( {
        plate_id: 1,
        plate: "Burger"
    }, null, "/plate/burger");

    showPlate("Burger");
}

function sandwich() {
    // URL will change to /plate/sandwich
    history.pushState( {
        plate_id: 2,
        plate: "main"
    }, null, "/page/main.html");

    showPlate("main");
}

function fries() {
    // URL will change to /plate/fries
    history.pushState( {
        plate_id: 3,
        plate: "team"
    }, null, "/page/team.html");

    showPlate("team");
}

function showPlate(name) {
    $("#chosen-plate").html(name);
}

window.onpopstate = function (event) {
    var content = "";
    if(event.state) {
        content = event.state.plate;
    }
    showPlate(content);
}