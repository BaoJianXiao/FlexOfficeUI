package com.magazine.ui.footer.event
{
	import flash.events.Event;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class SliderValueChangeEvent extends Event
	{
		public static const ValueChangeEvent:String = "valueChangeEvent";
		
		private var _value:Number;

		public function get value():Number
		{
			return _value;
		}

		public function set value(value:Number):void
		{
			_value = value;
		}

		public function SliderValueChangeEvent(value:Number, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.value = value;
			super(SliderValueChangeEvent.ValueChangeEvent, bubbles, cancelable);
		}
	}
}