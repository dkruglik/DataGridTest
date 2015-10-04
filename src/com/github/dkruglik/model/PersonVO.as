package com.github.dkruglik.model {
public class PersonVO {

    private var _firstName:String;
    private var _lastName:String;
    private var _age:int;
    private var _citizen:String;
    private var _sex:SexEnum;
    private var _weight:Number;
    private var _height:Number;


    public function get firstName():String {
        return _firstName;
    }

    public function set firstName(value:String):void {
        _firstName = value;
    }

    public function get lastName():String {
        return _lastName;
    }

    public function set lastName(value:String):void {
        _lastName = value;
    }

    [Bindable]
    public function get age():int {
        return _age;
    }

    public function set age(value:int):void {
        _age = value;
    }

    public function get citizen():String {
        return _citizen;
    }

    public function set citizen(value:String):void {
        _citizen = value;
    }

    public function get sex():SexEnum {
        return _sex;
    }

    public function set sex(value:SexEnum):void {
        _sex = value;
    }

    public function get weight():Number {
        return _weight;
    }

    public function set weight(value:Number):void {
        _weight = value;
    }

    public function get height():Number {
        return _height;
    }

    public function set height(value:Number):void {
        _height = value;
    }
}
}
