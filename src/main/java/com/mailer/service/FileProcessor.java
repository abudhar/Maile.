package com.mailer.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface FileProcessor {

	List<String> extractEmails(MultipartFile file) throws IOException;

}
