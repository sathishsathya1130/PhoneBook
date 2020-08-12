 package com.sathish.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sathish.exception.PhoneBookException;
import com.sathish.model.Contact;
import com.sathish.service.ContactService;

@Controller
public class ContactInfoController {

	@Autowired
	private ContactService contactService;

	@GetMapping(value = { "/", "/ContactForm" })
	public String loadForm(Model model) {
		Contact c = new Contact();
		model.addAttribute("contact", c);

		/* return "addContact"; */
		return "addContact";

	}

	/* @PostMapping(value = "/addContact") */
	@PostMapping(value = "/addContact")
	public String handleSubmitBtn(@ModelAttribute("contact") Contact contact, RedirectAttributes attributes) {

		boolean isSaved = contactService.saveContact(contact);

		if (isSaved) {

			attributes.addFlashAttribute("succmsg", "Contact Added Sucessfully");

		} else {

			attributes.addFlashAttribute("Errmsg", "failed to add Contact");
		}

		return "redirect:/ContactForm";

	}

	@GetMapping("/viewContacts")
	public String handleViewContactsLink(Model model) {
		List<Contact> contactList = contactService.getAllContacts();
		model.addAttribute("contacts", contactList);
		return "viewContacts";
	}

	@ExceptionHandler(value = NullPointerException.class)
	public String handleNullPointerException(Model model) {
		model.addAttribute("msg", "please contact the service team");
		return "error";

	}

	@ExceptionHandler(value = PhoneBookException.class)
	public String handlePhoneBookException() {
		return "error";

	}
	@GetMapping("/validateEmail")
	   @ResponseBody
	   public String validateEmail(@RequestParam("contactEmail") String contactEmail ){

	     String emailStatus =  contactService.findByEmail(contactEmail);

		return emailStatus;

	   }
	}


	
	

