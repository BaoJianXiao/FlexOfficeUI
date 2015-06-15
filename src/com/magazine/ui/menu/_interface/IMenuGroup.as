package com.magazine.ui.menu._interface
{
	import com.magazine.data.ApplicationData;
	/**
	 * 
	 * @author 鲍建宵
	 * @site: http://www.cloudmessager.com/blog
	 */
	public interface IMenuGroup
	{
		function set applicationData(value:ApplicationData):void;
		function get applicationData():ApplicationData;
	}
}