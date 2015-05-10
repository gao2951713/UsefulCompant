package com.standardframe.core.service;

import org.springframework.web.multipart.MultipartFile;

public interface UploadFileService {
	
	/**
	 * 上传文件到指定路�?
	 * destinationDir 目标路径
	 * @user 王勇
	 * 2014�?�?0�?
	 */
	public boolean uploadFile(String destinationDir, MultipartFile file, String filename) throws Exception;
	/**
	 * 上传讲义图片到指定路�?
	 * @param widthTarget 想把图片宽度变成多宽
	 * 高度会等比例缩放
	 * @user 王勇
	 * 2014�?�?4�?
	 */
	public boolean uploadHandoutImg(String destinationDir, MultipartFile file, String filename, int widthTarget) throws Exception;

}
