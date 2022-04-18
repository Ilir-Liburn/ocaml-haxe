package haxe.ocaml;

import haxe.ocaml.OCamlRef.OCamlClassType;
import haxe.macro.Context;
import haxe.macro.Printer;
import haxe.macro.ExprTools;
import haxe.macro.Expr;

class OCamlTools {
	public static function toString(expr:Expr):String {
		switch (expr.expr) {
			case EParenthesis(e):
				return '(${toString(e)})';
			case EArrayDecl(values):
				var array:Array<String> = [];
				for (item in values) {
					var value = toString(item);
					array.push(value);
				}
				return '[${array.join(";")}]';
			case EObjectDecl(fields):
				var code = new OCaml();
				code.write("{");
				for (item in fields) {
					code.write(item.field + "=" + toString(item.expr) + ";");
				}
				code.write("}");
				return code.code;
			case EField(e, field):
				return OCamlField.toString(e, field);
			case EBinop(op, e1, e2):
				return OCamlBinop.toString(op, e1, e2);
			case ECall(e, params):
				return OCamlFunction.toString(e, params);
			case EArray(e1, e2):
				return toString(e1) + '.(${toString(e2)})';
			case EConst(c):
				switch (c) {
					case CIdent(s):
						// 存在不需要!的情况，如for(s in array)
						var name = ExprTools.toString(expr);
						return (OCamlRef.ref.exists(name) ? "!" : "") + name;
					default:
						return ExprTools.toString(expr);
				}
			case EBlock(exprs):
				var code = ["("];
				for (item in exprs) {
					code.push(toString(item));
				}
				code.push(")");
				return code.join("\n");
			case EIf(econd, eif, eelse):
				return "(* EIf *)\n" + 'if (${toString(econd)}) then ${toString(eif)} ${eelse != null ? "else " + toString(eelse) : ""}';
			case EFor(it, expr):
				return "(* For *)\n" + OCamlFor.toString(it, expr);
			default:
				return '(* OCamlTools.TODO ${expr.expr.getName();} *)';
		}
		return null;
	}

	public static function toT(index:Int):String {
		var code = "\t";
		for (i in 0...index) {
			code += "\t";
		}
		return code;
	}
}
