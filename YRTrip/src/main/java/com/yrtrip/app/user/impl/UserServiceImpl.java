package com.yrtrip.app.user.impl;

import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.user.EmailVO;
import com.yrtrip.app.user.UserService;
import com.yrtrip.app.user.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired UserDAOMybatis dao;
	
	public void insertUser(UserVO vo) {
		dao.insertUser(vo);
	}

	public void updateUser(UserVO vo) {
		dao.updateUser(vo);
	}

	public void deleteUser(UserVO vo) {
		dao.deleteUser(vo);
	}

	public UserVO getUser(UserVO vo) {
		return dao.getUser(vo);
	}

	public List<UserVO> getUserList(UserVO vo) {
		return dao.getUserList(vo);
	}

	public UserVO findUserPw(UserVO vo) {
		return dao.findUserPw(vo);
	}
	
	public void updateUserPw(UserVO vo) {
		dao.updateUserPw(vo);
	}
	
	public void send(EmailVO vo) {
		String to = vo.getTo();// change accordingly
		String from = vo.getFrom(); // change accordingly
		final String username = "dotjs0531@gmail.com"; // change accordingly
		final String password = "jbvknqzxshnqylqv"; // change accordingly
		
		// Assuming you are sending email through relay.jangosmtp.net
		String host = "smtp.gmail.com";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		
		// Get the Session object.
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}			
		});
		
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(vo.getSubject());
			message.setText(vo.getContent());
			Transport.send(message);
			System.out.println("Sent message successfully....");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void sendAttatch(EmailVO vo) {
		String to = vo.getTo();// change accordingly
		String from = vo.getFrom(); // change accordingly
		final String username = "dotjs0531@gmail.com"; // change accordingly
		final String password = "jbvknqzxshnqylqv"; // change accordingly
		
		// Assuming you are sending email through relay.jangosmtp.net
		String host = "smtp.gmail.com";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		
		// Get the Session object.
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}			
		});
		
		try {
	         Message message = new MimeMessage(session);
	         message.setFrom(new InternetAddress(from));
	         message.setRecipients(Message.RecipientType.TO,
	            InternetAddress.parse(to));
	         
	         // Set Subject: header field
	         message.setSubject(vo.getSubject());
	        
	         // Create the message part
	         BodyPart messageBodyPart = new MimeBodyPart();
	         messageBodyPart.setText(vo.getContent());
	         Multipart multipart = new MimeMultipart();
	         multipart.addBodyPart(messageBodyPart);
	         
	         // Part two is attachment
	         messageBodyPart = new MimeBodyPart();
	         String filename = vo.getFilename(); //  "/home/manisha/file.txt";
	         DataSource source = new FileDataSource(filename);
	         messageBodyPart.setDataHandler(new DataHandler(source));
	         messageBodyPart.setFileName(filename);
	         multipart.addBodyPart(messageBodyPart);
	         
	         message.setContent(multipart);	         
	         Transport.send(message);
	         System.out.println("Sent message successfully....");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}	
}
