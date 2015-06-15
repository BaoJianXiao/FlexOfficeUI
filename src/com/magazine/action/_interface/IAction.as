package com.magazine.action._interface
{
	import com.magazine.data.ApplicationData;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public interface IAction
	{
		function execute():void;
		function set applicationData(value:ApplicationData):void;
		function get applicationData():ApplicationData;
		function set callback(value:Function):void;
		function get callback():Function;
	}
}