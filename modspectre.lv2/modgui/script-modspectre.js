function (event) {

	/* constants */

	var log1k = Math.log (1000.0);
	var rate  = 48000;
	var width = 256;
	var height = 175;

	/* some helper functions */

	function freq_at_x (x, width) {
		/* log-scale 20..20K */
		return 20 * Math.pow (1000, x / width);
	}

	function x_at_freq (f, width) {
		return width * Math.log (f / 20.0) / log1k;
	}

	function y_pos (p) {
		return 175 - 175 * p;
	}

	function y_at_db (db) {
		return y_pos(1 + db / 96);
	}

	/* the actual SVG drawing function */
	function x42_draw_spectrum (sd) {
		var ds = sd.data ('xModPorts');
		var svg = sd.svg ('get');
		if (!svg) { return; }

		svg.clear ();

		/* grid */
		var g = svg.group ({stroke: 'gray', strokeWidth: 0.25, fill: 'none'});

		var glines = [0, -6, -12, -18, -24, -48, -72];
		for (var i in glines) {
			var yg = .5 + Math.round (y_at_db (glines[i]));
			svg.line (g, 0, yg, width, yg);
		}

		g = svg.group ({stroke: 'darkgray', strokeWidth: 0.25, strokeDashArray: '1, 3', fill: 'none'});
		var flines = [50, 200, 500, 2000, 5000, 15000];
		for (var i in flines) {
			var xg = Math.round (x_at_freq (flines[i], width));
			svg.line (g, xg, 0, xg, height);
		}

		var tg = svg.group ({stroke: 'gray', fontSize: '8px', textAnchor: 'end', fontFamily: 'Monospace', strokeWidth: 0.5});
		g = svg.group ({stroke: 'gray', strokeWidth: 0.25, strokeDashArray: '3, 2'});

		flines = [100, 1000, 10000];
		for (var i in flines) {
			var xg = Math.round (x_at_freq (flines[i], width));
			svg.line (g, xg, 0, xg, height + 5);
		}

		/* grid labels */

		var freqlabels = {50: "50", 100: "100", 200: "200", 1000: "1K", 2000: "2K", 5000: "5K", 10000: "10K" };
		for (var freq in freqlabels) {
			var xg = Math.round (x_at_freq (freq, width));
			var to = svg.group (tg, {transform: 'translate ('+xg+', '+(height + 3)+')'});
			var tr = svg.group (to, {transform: 'rotate (-90, 3, 0)'});
			svg.text (tr, 0, 0, freqlabels[freq]);
		}

		var gainlabels = [-6, -18, -48, -72];
		for (var i in gainlabels) {
			var yg = 3 + Math.round (y_at_db (gainlabels[i]));
			svg.text (tg, width - 5, yg, gainlabels[i] + "dBFS");
		}

		/* transfer function */
		var clp = svg.clipPath (null, 'tfClip');
		svg.rect (clp, -1, 0, width + 3, height);

		var color = 'white';
		if (1 == ds[':bypass']) {
			color = '#444444';
		}

		var bins = ds['http://gareus.org/oss/lv2/modspectre#bin_data'];

		if (bins === undefined) {
			return;
		}

		var path = [];
		g = svg.group ({stroke: color, strokeWidth: 1.0, fill: 'none'});
		for (var x = 0; x < width; x++) {
			path.push ([x, y_pos (bins[x])]);
		}
		svg.polyline (g, path, {clipPath: 'url(#tfClip)'});
		path.push ([width + 1, height]);
		path.push ([0, height]);
		g = svg.group ({stroke: 'none', fill: color, fillOpacity: '0.35'});
		svg.polyline (g, path, {clipPath: 'url(#tfClip)'});
	}

	if (event.type == 'start') {
		var sd = event.icon.find ('[mod-role=spectrum-display]');
		sd.svg ();

		var svg = sd.svg ('get');
		svg.configure ({width: '256px'}, false);
		svg.configure ({height: '205px'}, false);
		svg.clear ();
		var tg = svg.group ({stroke: '#cccccc', fontSize: '11px', textAnchor: 'middle', strokeWidth: 0.5});
		svg.text (tg, 59, 65, "Spectrum", {dy: '-1.5em'});
		svg.text (tg, 59, 65, "Display");
		svg.text (tg, 59, 65, "MOD v1.10 or later.", {dy: '1.5em'});

		var ds = {};
		var ports = event.ports;
		for (var p in ports) {
			ds[ports[p].symbol] = ports[p].value;
		}

		sd.data ('xModPorts', ds);
		x42_draw_spectrum (sd);

	} else if (event.type == 'change') {
		var sd = event.icon.find ('[mod-role=spectrum-display]');
		var ds = sd.data ('xModPorts');
		if (event.uri) {
			if (event.value.length !== 256) {
				console.log("modspectre: Invalid data")
				return
			}
			ds[event.uri] = event.value;
		} else {
			ds[event.symbol] = event.value;
		}
		sd.data ('xModPorts', ds);
		x42_draw_spectrum (sd);
	}
}
