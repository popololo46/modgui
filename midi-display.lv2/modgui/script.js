function (event) {

	function create_result(
			midi_type,
			field1_type, field1_data,
			field2_type, field2_data,
			field3_type, field3_data) {
		return Array(
			midi_type,
			field1_type, field1_data,
			field2_type, field2_data,
			field3_type, field3_data);
	}

	function decode_midi (data1, data2, data3) {
		var code = data1 & 0xF0;
		switch (code) {
		case 0x80:
			var channel = data1 & 0x0F;
			return create_result("note-off",
								 "channel", channel,
								 "note", data2,
								 "velocity", data3);
		case 0x90:
			var channel = data1 & 0x0F;
			return create_result("note-on",
								 "channel", channel,
								 "note", data2,
								 "velocity", data3);
		case 0xA0:
			var channel = data1 & 0x0F;
			return create_result("poly-aftertouch",
								 "channel", channel,
								 "note", data2,
								 "pressure", data3);
		case 0xB0:
			var channel = data1 & 0x0F;
			return create_result("control-change",
								 "channel", channel,
								 "controller", data2,
								 "data", data3);
		case 0xC0:
			var channel = data1 & 0x0F;
			return create_result("program-change",
								 "channel", channel,
								 "", -1,
								 "data", data2);
		case 0xD0:
			var channel = data1 & 0x0F;
			return create_result("channel-aftertouch",
								 "channel", channel,
								 "", -1,
								 "pressure", data2);
		case 0xE0:
			var channel = data1 & 0x0F;
			var pitch = (data3 << 7) + data2
			return create_result("pitch-bend",
								 "channel", channel,
								 "", -1,
								 "pitch", pitch);
		case 0xF0:
			var data = data1.toString(16).toUpperCase();
			return create_result("system", "system", data, "", -1, "", -1);
		}
	}

	function get_bundle_data(icon) {
		html = event.icon;
		if (html.context != undefined) {
			html = html.context;
		}
		bundle_data = html["bundle_data"];
		if (bundle_data == undefined) {
			bundle_data = {};
			html["bundle_data"] = bundle_data;

			bundle_data["midi_msg_1"] = -1;
			bundle_data["midi_msg_2"] = -1;
			bundle_data["midi_msg_3"] = -1;

			// reach dom nodes
			bundle_data.node_type = icon.find('[mod-role=midi-type]');
			bundle_data.node_data1 = icon.find('[mod-role=midi-data1]');
			bundle_data.node_data_type1 = icon.find('[mod-role=midi-data-type1]');
			bundle_data.node_data2 = icon.find('[mod-role=midi-data2]');
			bundle_data.node_data_type2 = icon.find('[mod-role=midi-data-type2]');
			bundle_data.node_data3 = icon.find('[mod-role=midi-data3]');
			bundle_data.node_data_type3 = icon.find('[mod-role=midi-data-type3]');
			bundle_data.node_received = icon.find('[mod-role=midi-received]');
		}
		return bundle_data;
	}

	function handle_event (symbol, value) {
		// console.info("handle_event", symbol, value);
		if (symbol.includes("midi_msg_")) {
			bundle_data = get_bundle_data(event.icon);

			// update the symbol
			bundle_data[symbol] = Math.round(value);

			// reach the state
			data1 = bundle_data["midi_msg_1"];
			data2 = bundle_data["midi_msg_2"];
			data3 = bundle_data["midi_msg_3"];

			midi_presentation = decode_midi(data1, data2, data3);
			// console.info(midi_presentation);

			function set_value(node, value, padding) {
				if (value < 0) {
					value = "";
				} else {
					value = value.toString();
					value = value.padStart(padding, ' ');
				}
				node.text(value);
			}

			function set_type(node, base, value) {
				value = base + " " + value
				node.attr('class', value);
			}

			set_type(bundle_data.node_type, 'midi-type', midi_presentation[0]);
			set_type(bundle_data.node_data_type1, 'midi-data-type1', midi_presentation[1]);
			set_value(bundle_data.node_data1, midi_presentation[2], 2);
			set_type(bundle_data.node_data_type2, 'midi-data-type2', midi_presentation[3]);
			set_value(bundle_data.node_data2, midi_presentation[4], 3);
			set_type(bundle_data.node_data_type3, 'midi-data-type3', midi_presentation[5]);
			set_value(bundle_data.node_data3, midi_presentation[6], 5);
		} else if (symbol == "midi_received") {
			bundle_data = get_bundle_data(event.icon);
			var class_names = 'midi-received';
			if (value >= 1) {
				class_names += ' received';
			}
			bundle_data.node_received.attr('class', class_names);
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
