package com.magazine.ui.menu.event
{
	import flash.events.Event;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class SubMenuHiddenEvent extends Event
	{
		public static const HiddenSlideEvent:String = "hiddenSlideEvent";
		public static const FixSlideEvent:String = "fixSlideEvent";
		public function SubMenuHiddenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}