package com.fileprocess.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.web.multipart.MultipartFile;

import com.mailer.service.FileProcessor;

public class ImageFileProcessor implements FileProcessor {
	@Override
	public List<String> extractEmails(MultipartFile file) throws IOException {
//		ITesseract instance = new Tesseract();
//		File tessDataFolder = LoadLibs.extractTessResources("tessdata");
//		instance.setDatapath(tessDataFolder.getAbsolutePath());

		List<String> emailList = new ArrayList<>();
		String emailRegex = "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}\\b";

//		File imageFile = convertMultipartFileToFile(file);
//		String result = instance.doOCR(imageFile);
//		Matcher matcher = Pattern.compile(emailRegex).matcher(result);
//		while (matcher.find()) {
//			emailList.add(matcher.group());
//		}

		return emailList;
	}

	private static File convertMultipartFileToFile(MultipartFile file) throws IOException {
		File convertedFile = new File(file.getOriginalFilename());
		file.transferTo(convertedFile);
		return convertedFile;
	}
}