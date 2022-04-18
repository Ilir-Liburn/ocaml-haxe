package haxe.ocaml;

class OCamlBuild {
	/**
	 * 生成OCaml代码
	 * @param mainOCaml 
	 * @return String
	 */
	public static function build(mainOCaml:OCaml):String {
		var buildOCaml = new OCaml();
		for (key => value in OCamlType.types) {
			buildOCaml.write(value.code.code + "\n");
		}
		buildOCaml.write(mainOCaml.code + "\n");
		return buildOCaml.code;
	}
}
