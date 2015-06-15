package com.magazine.ui.menu
{
	import com.magazine.data.ApplicationData;
	import com.magazine.ui.menu.event.MenuItemSelectedEvent;
	
	import mx.core.UIComponent;
	
	import spark.components.HGroup;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class Menu extends HGroup
	{
		public function Menu()
		{
			super();
			percentWidth = 100;
		}
		
		private var _dataProvider:Array;

		public function get dataProvider():Array
		{
			return _dataProvider;
		}

		public function set dataProvider(value:Array):void
		{
			_dataProvider = value;
			
			for each(var item:Object in _dataProvider){
				var menu:MenuItem = new MenuItem();
				menu.label = item.label;
				menu.selected = item.selected == null ? false : item.selected;
				menu.data = item;
				menu.addEventListener(MenuItemSelectedEvent.SelectedEvent, selectedHandler);
				addElement(menu);
			}
		}
		
		protected function selectedHandler(event:MenuItemSelectedEvent):void
		{
			var num:Number = this.numElements;
			for(var i:int = 0; i < num; i++){
				(this.getElementAt(i) as MenuItem).selected = false;
				if((this.getElementAt(i) as MenuItem).data.group){
					((this.getElementAt(i) as MenuItem).data.group as UIComponent).visible = false;
				}
			}
			(event.target as MenuItem).selected = true;
			if((event.target as MenuItem).data.group){
				((event.target as MenuItem).data.group as UIComponent).visible = true;
			}
			dispatchEvent(event.clone());
		}
		
	}
}