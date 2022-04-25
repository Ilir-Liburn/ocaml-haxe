typedef SysBackend_ = Dynamic;

// typedef Sys = Dynamic;

typedef SysSignal_behavior  = Dynamic;

typedef SysNon_immediate  = Dynamic;

typedef SysImmediate  = Dynamic;

@:native("Sys")
extern class OCamlSys {
public static function get_config(a0:Void):Dynamic;
public static function get_executable_name(a0:Void):String;
public static var argv:OCamlArray<String>;
public static function max_wosize(a0:Void):Int;
public static function get_backend_type(a0:Void):Dynamic;
public static var executable_name:String;
public static var os_type:String;
public static var backend_type:Dynamic;
public static var big_endian:Bool;
public static var word_size:Int;
public static var int_size:Int;
public static var unix:Bool;
public static var win32:Bool;
public static var cygwin:Bool;
public static var max_array_length:Int;
public static var max_floatarray_length:Int;
public static var max_string_length:Int;
public static function runtime_variant(a0:Void):String;
public static function runtime_parameters(a0:Void):String;
public static function file_exists(a0:String):Bool;
public static function is_directory(a0:String):Bool;
public static function remove(a0:String):Void;
public static function rename(a0:String,a1:String):Void;
public static function getenv(a0:String):String;
public static function getenv_opt(a0:String):Dynamic;
public static function command(a0:String):Int;
public static function time(a0:Void):Dynamic;
public static function chdir(a0:String):Void;
public static function mkdir(a0:String,a1:Int):Void;
public static function rmdir(a0:String):Void;
public static function getcwd(a0:Void):String;
public static function readdir(a0:String):OCamlArray<String>;
public static var interactive:Dynamic;
public static function signal(a0:Int,a1:Dynamic):Dynamic;
public static function set_signal(a0:Int,a1:Dynamic):Void;
public static var sigabrt:Int;
public static var sigalrm:Int;
public static var sigfpe:Int;
public static var sighup:Int;
public static var sigill:Int;
public static var sigint:Int;
public static var sigkill:Int;
public static var sigpipe:Int;
public static var sigquit:Int;
public static var sigsegv:Int;
public static var sigterm:Int;
public static var sigusr1:Int;
public static var sigusr2:Int;
public static var sigchld:Int;
public static var sigcont:Int;
public static var sigstop:Int;
public static var sigtstp:Int;
public static var sigttin:Int;
public static var sigttou:Int;
public static var sigvtalrm:Int;
public static var sigprof:Int;
public static var sigbus:Int;
public static var sigpoll:Int;
public static var sigsys:Int;
public static var sigtrap:Int;
public static var sigurg:Int;
public static var sigxcpu:Int;
public static var sigxfsz:Int;
public static function catch_break(a0:Bool):Void;
public static function enable_runtime_warnings(a0:Bool):Void;
public static function runtime_warnings_enabled(a0:Void):Bool;
public static var ocaml_version:String;
public static function opaque_identity(a0:Dynamic):Dynamic;
public static function magic(a0:Dynamic):Dynamic;
public static var repr:Dynamic;
}