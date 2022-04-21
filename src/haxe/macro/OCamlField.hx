package haxe.macro;

import haxe.macro.TypeTools;
import haxe.macro.ExprTools;
import haxe.macro.Expr;
import haxe.macro.Context;

class OCamlField {
	public static function toString(e:Expr, field:String):String {
		var type = try Context.getType(ExprTools.toString(e)) catch (_) null;
		if (type != null)
			switch (type) {
				case TInst(t, params):
					// 兼容@:native实现
					var classField = TypeTools.findField(t.get(), field, true);
					if (classField != null) {
						var mate = classField.meta.get().filter(data -> data.name.indexOf(":native") != -1);
						if (mate.length > 0) {
							field = ExprTools.getValue(mate[0].params[0]);
						}
					}
					var mate = t.get().meta.get().filter((data) -> data.name.indexOf(":native") != -1);
					if (mate.length > 0) {
						return ExprTools.getValue(mate[0].params[0]) + "." + field;
					}
					var mate = t.get().meta.get().filter(data -> data.name.indexOf(":build") != -1);
					if (mate.length > 0) {
						for (param in mate[0].params) {
							switch (param.expr) {
								case ECall(e, params):
									// 类型引用
									if (ExprTools.toString(e) == "OCamlMacro.build") {
										var moudle = StringTools.replace(t.toString(), ".", "_").toLowerCase();
										moudle = moudle.charAt(0).toUpperCase() + moudle.substr(1);
										return '${moudle}.${field}';
									}
								default:
							}
						}
					}
				default:
					return "(* TODO type " + type.getName() + " *)";
			}
		else {
			if (field == "length") {
				if (OCamlRef.isType(e, LIST))
					return "List.length " + OCamlTools.toString(e);
				return "Array.length " + OCamlTools.toString(e);
			}
		}
		return toOCamlClassName(OCamlTools.toString(e)) + "." + field;
	}

	public static function toOCamlClassName(name:String):String {
		switch (name) {
			case "Math":
				return "Stdlib";
		}

		return name;
	}
}
