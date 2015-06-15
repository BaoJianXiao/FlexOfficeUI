package com.magazine.action
{
	import com.magazine.action._interface.IAction;
	import com.magazine.data.ApplicationData;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public class BaseAction implements IAction
	{
		public function BaseAction()
		{
		}
		
		public function execute():void
		{
		}
		
		private var _applicationData:ApplicationData;
		public function set applicationData(value:ApplicationData):void
		{
			_applicationData = value;
		}
		
		public function get applicationData():ApplicationData
		{
			return _applicationData;
		}
		
		private var _callback:Function;
		public function set callback(value:Function):void
		{
			_callback = value;
		}
		
		public function get callback():Function
		{
			return _callback;
		}
	}
}