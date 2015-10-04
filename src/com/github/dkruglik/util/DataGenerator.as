/**
 * Created by dkruglik on 10/3/15.
 */
package com.github.dkruglik.util {
import com.github.dkruglik.model.PersonVO;
import com.github.dkruglik.model.SexEnum;

public class DataGenerator {

    private static const FIRST_NAME:Array = ["Janek", "Peter", "Mariusz", "Miroslav", "Jack", "Diana", "Sandy"];
    private static const LAST_NAME:Array = ["Brzezinski", "Smith", "Brown", "Black", "Crni", "Travis", "Wonder"];
    private static const AGE:Array = [28, 63, 34, 21, 78, 100, 55];
    private static const CITIZEN:Array = ["RS", "RP", "US", "GB", "IT", "NL", "GR"];
    private static const SEX:Array = [SexEnum.MAN, SexEnum.WOMAN];
    private static const WEIGHT:Array = [70, 68, 51, 55, 58, 60, 63];
    private static const HEIGHT:Array = [170, 168, 151, 150, 158, 160, 163];


    public static function generatePerson():PersonVO {
        var personVO:PersonVO = new PersonVO();
        personVO.firstName = getRandomPoint(FIRST_NAME) as String;
        personVO.lastName = getRandomPoint(LAST_NAME) as String;
        personVO.age = getRandomPoint(AGE) as int;
        personVO.citizen = getRandomPoint(CITIZEN) as String;
        personVO.sex = getRandomPoint(SEX) as SexEnum;
        personVO.weight = getRandomPoint(WEIGHT) as Number;
        personVO.height = getRandomPoint(HEIGHT) as Number;

        return personVO;
    }

    private static function getRandomPoint(vector:Array):Object {
        var idx:int = Math.floor(Math.random() * vector.length);
        return vector[idx];
    }


}
}
