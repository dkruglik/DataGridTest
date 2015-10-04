package com.github.dkruglik.view.renderer {
import flash.events.IEventDispatcher;

import mx.controls.Label;
import mx.controls.dataGridClasses.DataGridListData;
import mx.controls.listClasses.BaseListData;
import mx.controls.listClasses.IDropInListItemRenderer;
import mx.controls.listClasses.IListItemRenderer;
import mx.core.UIComponent;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;

public class AgeItemRenderer extends UIComponent implements IDropInListItemRenderer, IListItemRenderer {

    private var _data:Object;
    private var _listData:BaseListData;
    private var _invalidateAge:Boolean;
    private var _label:Label;

    private var _isChildrenCreated:Boolean;

    public function AgeItemRenderer() {
        super();
    }

    override protected function commitProperties():void {
        super.commitProperties();
        if (_invalidateAge) {
            _label.text = _data.age;
            _invalidateAge = false;
        }
    }

    override protected function createChildren():void {
        super.createChildren();
        if (!_isChildrenCreated) {
            _label = new Label();
            _label.truncateToFit = true;
            _label.width = 25;
            _label.height = 20;
            _label.y = 5;
            _label.x = 5;
            addChild(_label);

            _isChildrenCreated = true;
        }
    }

    [Bindable("dataChange")]
    public function get listData():BaseListData {
        return _listData;
    }

    public function set listData(value:BaseListData):void {
        _listData = value;
    }

    public function get data():Object {
        return _data;
    }

    public function set data(value:Object):void {
        if (_data != value) {
            removeChangeListener();

            _data = value;
            removeChangeListener();
            addChangeListener();

            _invalidateAge = true;
            invalidateProperties();
            dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
        }
    }

    private function addChangeListener():void {
        var dispatcher:IEventDispatcher = _data as IEventDispatcher;
        if (dispatcher) {
            dispatcher.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, onPropertyChangeHandler, false, 0, true);
        }
    }

    private function removeChangeListener():void {
        var dispatcher:IEventDispatcher = _data as IEventDispatcher;
        if (dispatcher && dispatcher.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE)) {
            dispatcher.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, onPropertyChangeHandler)
        }
    }

    private function onPropertyChangeHandler(event:PropertyChangeEvent):void {
        if (event.property == DataGridListData(_listData).dataField) {
            _invalidateAge = true;
            invalidateProperties();
        }
    }

    override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
        super.updateDisplayList(unscaledWidth, unscaledHeight);
    }
}
}
