package com.github.dkruglik.view.renderer {
import com.github.dkruglik.model.PersonVO;
import com.github.dkruglik.model.SexEnum;

import mx.controls.listClasses.IListItemRenderer;
import mx.core.UIComponent;

public class SexItemRenderer extends UIComponent implements IListItemRenderer {
    private var _data:PersonVO;

    public function SexItemRenderer() {
        super();
    }

    public function get data():Object {
        return _data;
    }

    public function set data(value:Object):void {
        _data = value as PersonVO;
    }

    private function getBGColor():uint {
        var result:uint;
        switch (getDataValue(_data)) {
            case SexEnum.MAN.value :
                result = 0x0000FF;
                break;
            case SexEnum.WOMAN.value :
                result = 0xFF0000;
                break;
            default :
                result = 0x000000;
        }

        return result;
    }

    private function getDataValue(value:PersonVO):String {
        var result:String;

        if (value) {
            result = SexEnum(value.sex).value;
        }

        return result;
    }


    override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
        super.updateDisplayList(unscaledWidth, unscaledHeight);
        graphics.clear();
        if (_data) {
            graphics.beginFill(getBGColor(), 1);
            graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
            graphics.endFill();
        }
    }
}
}
