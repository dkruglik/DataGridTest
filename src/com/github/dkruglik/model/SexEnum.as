package com.github.dkruglik.model {
public class SexEnum {
    public static const MAN:SexEnum = new SexEnum("man");
    public static const WOMAN:SexEnum = new SexEnum("woman");

    private static var _isCreated:Boolean = false;

    {
        _isCreated = true;
    }

    private var _value:String;

    public function SexEnum(value:String) {
        if (_isCreated) {
            throw new Error("The enum is already created.");
        }

        _value = value;
    }

    public function get value():String {
        return _value;
    }

    public function toString():String {
        return _value;
    }
}
}
