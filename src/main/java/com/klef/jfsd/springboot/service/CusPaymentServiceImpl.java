package com.klef.jfsd.springboot.service;
import com.klef.jfsd.springboot.model.CusPayment;
import com.klef.jfsd.springboot.repository.CusPaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class CusPaymentServiceImpl implements CusPaymentService {
	
	@Autowired
	private CusPaymentRepository cusPaymentRepository;

	@Override
	public CusPayment savePayment(CusPayment cusPayment) {
		
		return cusPaymentRepository.save(cusPayment); // Return the saved entity
	}
}