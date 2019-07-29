package com.good.service;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.good.dto.EmailVO;

@Service
public class EmailServiceImpl implements EmailService {
	@Inject
	JavaMailSender mailSender;

	@Override
	public void sendMail(EmailVO vo) throws Exception {
		try {
			MimeMessage msg=mailSender.createMimeMessage();
			msg.addRecipient(RecipientType.TO,
					new InternetAddress(vo.getReceiveMail()));
			msg.addFrom(new InternetAddress[] {
		new InternetAddress(vo.getSenderMail(),vo.getSenderName())
			});
			msg.setSubject(vo.getSubject(),"utf-8");
			
			msg.setText(vo.getMessage(),"utf-8");
			mailSender.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
}
