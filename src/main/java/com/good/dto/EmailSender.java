package com.good.dto;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
   
    public class EmailSender  {
         
        @Inject
        protected JavaMailSender  mailSender;
        
        public void SendEmail(EmailVO email) throws Exception {
             
            MimeMessage msg = mailSender.createMimeMessage();
            try {
                msg.setSubject(email.getSubject());
                msg.setText(email.getMessage());
                msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiveMail()));
               
            }catch(MessagingException e) {
                System.out.println("MessagingException");
                e.printStackTrace();
            }
            try {
                mailSender.send(msg);
            }catch(MailException e) {
                System.out.println("MailException발생");
                e.printStackTrace();
            }
        }
 
        
}
