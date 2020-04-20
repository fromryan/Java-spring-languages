package com.ryankim.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ryankim.languages.models.Language;
import com.ryankim.languages.services.LanguageService;

@Controller
@RequestMapping("")
public class LanguageController {
	private final LanguageService languageService;
	
	public LanguageController(LanguageService languageService) {
		this.languageService = languageService;
	}
	
	@RequestMapping("/languages")
	public String index(Model model) {
		List<Language> languages = languageService.allLanguages();
		model.addAttribute("languages", languages);
		model.addAttribute("language", new Language());
		return "index.jsp";
	}
	
	@RequestMapping(value="/languages/create", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("language") Language language, BindingResult result) {
		
		if(result.hasErrors()) {
			return "index.jsp";
		} else {
			languageService.createLanguage(language);
			return "redirect:/languages";
		}
	}
	
	@RequestMapping(value="/languages/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Language language = languageService.findLanguage(id);
		model.addAttribute("language", language);
		return "show.jsp";
	}
	
	@RequestMapping("/languages/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        Language language = languageService.findLanguage(id);
        model.addAttribute("language", language);
        return "edit.jsp";
    }
	
	@RequestMapping(value="/languages/edit/{id}/updating", method=RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("language") Language language, BindingResult result) {
		if (result.hasErrors()) {
			return "/languages/edit.jsp";
		} else {
			languageService.updateLanguage(language);
	        return "redirect:/languages";
	    }
	}
	
	@RequestMapping(value="/languages/{id}/delete", method=RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
        languageService.deleteLanguage(id);
        return "redirect:/languages";
    }	
}
