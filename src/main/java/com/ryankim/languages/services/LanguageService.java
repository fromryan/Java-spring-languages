package com.ryankim.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ryankim.languages.models.Language;
import com.ryankim.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository languageRepository;
	
	public LanguageService(LanguageRepository languageRepository) {
		this.languageRepository = languageRepository;
	}
	
	
    public List<Language> allLanguages() {
        return languageRepository.findAll();
    }

    public Language createLanguage(Language language) {
        return languageRepository.save(language);
    }

    public Language findLanguage(Long id) {
        Optional<Language> language = languageRepository.findById(id);
        if(language.isPresent()) {
            return language.get();
        } else {
            return null;
        }
    }
    
    public Language updateLanguage(Language language) {
    	return languageRepository.save(language);
    }
    
    public Language updateLanguage(Long id, String name, String creator, float version) {
    	Optional <Language> language = languageRepository.findById(id); 
    	if(language.isPresent()) { 
    		language.get().setName(name);
    		language.get().setCreator(creator);
    		language.get().setVersion(version);
    		
    		return languageRepository.save(language.get());
    	} else {
    		return null;
    	}
    }

    
    public void deleteLanguage(Long id) {
    	languageRepository.deleteById(id);
    }	
}
