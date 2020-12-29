function (event) {

	function hideshowbytes (bytes) {
		var b2 = event.icon.find ('[mod-gui-role=byte2]');
		var b3 = event.icon.find ('[mod-gui-role=byte3]');
		if (bytes == 1) {
			b2.css('display', 'none');
			b3.css('display', 'none');
		} else if (bytes == 2) {
			b2.css('display', 'inline-block');
			b3.css('display', 'none');
		} else {
			b2.css('display', 'inline-block');
			b3.css('display', 'inline-block');
		}
	}

	if (event.type == 'start') {
		var ports = event.ports;
		for (var p in ports) {
			if (ports[p].symbol == 'bytes') {
				hideshowbytes (event.value);
			}
		}
	}
	else if (event.type == 'change') {
		if (event.symbol == 'bytes') {
			hideshowbytes (event.value);
		}
	}
}
