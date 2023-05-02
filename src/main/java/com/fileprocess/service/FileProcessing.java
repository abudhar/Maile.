package com.fileprocess.service;

import org.springframework.web.multipart.MultipartFile;

import com.mailer.service.FileProcessor;

public class FileProcessing {
	public static FileProcessor createFileProcessor(MultipartFile file) {
		if (file.getContentType().equals("application/vnd.ms-excel")
				|| file.getContentType().equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")) {
			return new ExcelFileProcessor();
		} else if (file.getContentType().startsWith("image/")) {
			return new ImageFileProcessor();
		} else {
			throw new IllegalArgumentException("Unsupported file type: " + file.getContentType());
		}
	}
}
