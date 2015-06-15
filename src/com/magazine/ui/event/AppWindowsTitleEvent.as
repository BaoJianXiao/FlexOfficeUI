package com.magazine.ui.event
{
	import flash.events.Event;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class AppWindowsTitleEvent extends Event
	{
		public static const TitleCloseClick:String = "titleCloseClick";
		public static const TitleMaxClick:String = "titleMaxClick";
		public static const TitleMinClick:String = "titleMinClick";
		public function AppWindowsTitleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}