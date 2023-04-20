package com.untils;

import org.apache.commons.io.FilenameUtils;

public class RenameFileAddLibrary {
	public static String renameFile(String fileName, String id) {
		return FilenameUtils.getBaseName(id) + ".png";
	}
}
