package com.good.service;

import com.good.dto.EmailVO;

public interface EmailService {
	public void sendMail(EmailVO vo) throws Exception;
}
