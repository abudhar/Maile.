package com.mailer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mailer.model.Template;
import com.mailer.service.TemplateService;

@Controller
@RequestMapping("/templates")
public class TemplateController {

	@Autowired
	private TemplateService templateService;

	@GetMapping
	public String listTemplates(@RequestParam(value = "response", required = false) String response, Model model) {
		List<Template> templates = templateService.getAllTemplates();
		model.addAttribute("templateList", templates);
		return "templates";
	}
}