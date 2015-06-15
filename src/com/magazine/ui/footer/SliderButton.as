package com.magazine.ui.footer
{
	import spark.components.Group;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class SliderButton extends Group
	{
		public function SliderButton()
		{
			super();
		}
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			graphics.clear();
			graphics.beginFill(0xFFFFFF,0.8);
			graphics.drawRect(0,0,width,height);
			graphics.endFill();
		}
	}
}