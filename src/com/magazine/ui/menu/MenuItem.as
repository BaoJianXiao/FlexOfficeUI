package com.magazine.ui.menu
{
	import com.magazine.ui.menu.event.MenuItemSelectedEvent;
	
	import flash.events.MouseEvent;
	
	import spark.components.Group;
	import spark.components.Label;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	[Event(name="selectedEvent", type="com.magazine.ui.menu.event.MenuItemSelectedEvent")]
	public class MenuItem extends Group
	{
		public function MenuItem()
		{
			super();
			labelText = new Label();
			labelText.setStyle("paddingLeft",20);
			labelText.setStyle("paddingRight",20);
			labelText.setStyle("paddingTop",10);
			labelText.setStyle("paddingBottom",10);
			labelText.setStyle("verticalAlign","middle");
			labelText.setStyle("textAlign","center");
			addElement(labelText);
			addEventListener(MouseEvent.CLICK, selectedHandler);
			addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
		}
		
		protected function mouseOutHandler(event:MouseEvent):void
		{
			if(selected){
				return;
			}
			labelText.setStyle("color", 0x000000);
		}
		
		protected function mouseOverHandler(event:MouseEvent):void
		{
			if(selected){
				return;
			}
			labelText.setStyle("color", 0x2b579a);
		}
		
		protected function selectedHandler(event:MouseEvent):void
		{
			dispatchEvent(new MenuItemSelectedEvent(data));
		}
		private var _label:String;

		public function get label():String
		{
			return _label;
		}

		public function set label(value:String):void
		{
			_label = value;
			labelText.text = _label;
		}

		private var _selected:Boolean;

		private var labelText:Label;
		public function get selected():Boolean
		{
			return _selected;
		}

		public function set selected(value:Boolean):void
		{
			_selected = value;
			if(_selected){
				labelText.setStyle("color", 0xFFFFFF);
			}else{
				labelText.setStyle("color", 0x000000);
			}
			invalidateDisplayList();
		}
		
		private var _data:Object;

		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}

		private var bgColor:Number = 0x2b579a;
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			graphics.clear();
			if(!selected)return;
			if(labelText) labelText.height = height;
			graphics.lineStyle(1,bgColor);
			graphics.beginFill(bgColor);
			graphics.drawRect(0,0,width-1, height);
			graphics.endFill();
			graphics.lineStyle(1,bgColor);
			graphics.moveTo(0, height);
			graphics.lineTo(width, height);
		}
		
	}
}