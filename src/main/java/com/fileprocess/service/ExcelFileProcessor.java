package com.fileprocess.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.mailer.config.ApplicationsConstants;
import com.mailer.service.FileProcessor;

public class ExcelFileProcessor implements FileProcessor {
	@SuppressWarnings("resource")
	@Override
	public List<String> extractEmails(MultipartFile file) throws IOException {
		Sheet sheet =  new XSSFWorkbook(file.getInputStream()).getSheetAt(0);
		List<String> emailList = new ArrayList<>();
		sheet.forEach(row -> row.forEach(cell -> {
			if (cell.getCellType() == CellType.STRING) {
				String cellValue = cell.getStringCellValue();
				Matcher matcher = Pattern.compile(ApplicationsConstants.EMAIL_REGEX).matcher(cellValue);
				while (matcher.find()) {
					emailList.add(matcher.group());
				}
			}
		}));
		return emailList.stream().distinct().collect(Collectors.toList());
	}
}
