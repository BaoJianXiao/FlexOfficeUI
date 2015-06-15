package com.magazine.ui.menu.event
{
	import flash.events.Event;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class MenuItemSelectedEvent extends Event
	{
		public static const SelectedEvent:String = "selectedEvent";
		private var _data:Object;

		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}

		public function MenuItemSelectedEvent(data:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.data = data;
			super(MenuItemSelectedEvent.SelectedEvent, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var event:MenuItemSelectedEvent = new MenuItemSelectedEvent(data);
			return event ;
		}
		
		
	}
}