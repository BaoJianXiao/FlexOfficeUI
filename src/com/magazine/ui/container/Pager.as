package com.magazine.ui.container
{
	import spark.components.Group;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class Pager extends Group
	{
		public function Pager()
		{
			super();
		}
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			graphics.clear();
			graphics.lineStyle(1,0xd7d7d7);
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0,0,width, height);
			graphics.endFill();
		}
	}
}