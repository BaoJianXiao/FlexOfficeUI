package com.magazine.ui.container
{
	import flash.display.GradientType;
	import flash.geom.Matrix;
	
	import spark.components.Group;
	import spark.components.Scroller;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class Workspace extends Group
	{
		private var matrix:Matrix = new Matrix();
		private var _positionMax:Number;

		public function get positionMax():Number
		{
			return _positionMax;
		}

		public function set positionMax(value:Number):void
		{
			_positionMax = value;
		}

		private var _positionMin:Number;

		private var _pager:Pager;

		private var scroller:Scroller;

		public function get pager():Pager
		{
			return _pager;
		}

		public function set pager(value:Pager):void
		{
			_pager = value;
		}


		public function get positionMin():Number
		{
			return _positionMin;
		}

		public function set positionMin(value:Number):void
		{
			_positionMin = value;
		}


		public function Workspace()
		{
			super();
			/*scroller = new Scroller();
			_pager = new Pager();
			_pager.width = 300;
			_pager.height = 600;
			scroller.viewport = _pager;
			addElement(scroller);*/
		}
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			matrix.createGradientBox(width,height,Math.PI/2);
			graphics.clear();
			graphics.beginGradientFill(GradientType.LINEAR, [0xFFFFFF,0xf0f0f0],[1,1],[0,255],matrix);
			graphics.drawRect(0,0,width-1, height-1);
			graphics.endFill();
		}
	}
}