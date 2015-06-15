package com.magazine.ui.container
{	
	import spark.components.Group;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class MaskContainer extends Group
	{
		public function MaskContainer()
		{
			super();
		}
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			graphics.clear();
			graphics.beginFill(0xFF0000);
			graphics.drawRect(1,0,width-2, height + 1);
			graphics.endFill();
		}
	}
}