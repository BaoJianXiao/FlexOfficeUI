package com.magazine.ui.container
{	
	import spark.components.Group;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class Windows extends Group
	{
		public function Windows()
		{
			super();
		}
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			graphics.clear();
			graphics.lineStyle(1,0x2b579a);
			graphics.drawRect(0,0,width-1, height);
			graphics.endFill();
		}
	}
}