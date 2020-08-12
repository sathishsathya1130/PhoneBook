package com.sathish.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sathish.model.Contact;
import com.sathish.service.ContactService;

@Controller
public class ViewContactsController {

	@Autowired
	private ContactService contactService;

	@RequestMapping("/editContact")
	public String editContact(@RequestParam("cid") Integer contactId, Model model) {
		Contact c = contactService.getContactById(contactId);
		model.addAttribute("contact", c);
		/* model.addAttribute("msg", "updated sucessfully"); */
		return "addContact";

	}

	public String updateContact(Contact c, Model model) {
		return null;

	}

	@RequestMapping(value = "/deleteContact")
	public String deleteContact(@RequestParam("cid") Integer contactId) {
		contactService.deleteContact(contactId);

		return "redirect:/viewContacts";

	}
}