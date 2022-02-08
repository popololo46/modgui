function (event) {

    function to_db (value) {
        if (value < 0.000001) {
            return "-inf";
        }
        return (20 * Math.log10 (value)).toFixed(1);
    }

    function handle_event (symbol, value) {
        switch (symbol) {
            case 'level':
                event.icon.find ('[mod-role=level]').text (to_db(value));
                break;
            case 'peak':
                event.icon.find ('[mod-role=peak]').text (to_db(value));
                break;
            case 'rms':
                event.icon.find ('[mod-role=rms]').text (to_db(value));
                break;
            default:
                break;
        }
    }

    if (event.type == 'start') {
        var ports = event.ports;
        for (var p in ports) {
            handle_event (ports[p].symbol, ports[p].value);
        }
    }
    else if (event.type == 'change') {
        handle_event (event.symbol, event.value);
    }
}
