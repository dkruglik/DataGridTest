package com.github.dkruglik.view.grid {
import flash.events.Event;

import mx.controls.DataGrid;
import mx.events.CollectionEvent;
import mx.events.CollectionEventKind;

public class CustomDataGrid extends DataGrid {
    public function CustomDataGrid() {
        super();
    }

    override protected function collectionChangeHandler(event:Event):void {
        if (event is CollectionEvent &&
                CollectionEvent(event).kind != CollectionEventKind.UPDATE) {
            super.collectionChangeHandler(event);
        }
    }
}
}
