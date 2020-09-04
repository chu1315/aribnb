package com.project.aircnc.common;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

public class MyUtils {
	public static String saveFile(String path, MultipartFile file) {
		String fileNm = null;
		UUID uuid = UUID.randomUUID();
		
		// 확장자
		String ext = FilenameUtils.getExtension(file.getOriginalFilename());
		System.out.println("ext : " + ext);
		
		fileNm = String.format("%s.%s", uuid, ext);
		String saveFileNm = String.format("%s/%s", path, fileNm);
		
		System.out.println("saveFileNm : " + saveFileNm);
		File saveFile = new File(saveFileNm);
		saveFile.mkdirs();
		
		try {			
			file.transferTo(saveFile); // 업로드 파일에 saveFile로 위치로 저장했다.
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

		return fileNm;
	}
}
