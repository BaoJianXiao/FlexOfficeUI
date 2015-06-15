package com.magazine.ui.footer.event
{
	import flash.events.Event;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class CatalogiesClickEvent extends Event
	{
		public static const CatalogiesClickToggleEvent:String = "catalogiesClickToggleEvent";
		public function CatalogiesClickEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(CatalogiesClickEvent.CatalogiesClickToggleEvent, bubbles, cancelable);
		}
	}
}