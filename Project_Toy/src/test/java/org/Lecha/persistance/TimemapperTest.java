package org.Lecha.persistance;

import org.Lecha.mapper.TimeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class TimemapperTest {
	private static final Logger logger = LoggerFactory.getLogger(TimemapperTest.class);
	@Autowired //<<< TimeMapper timeMapper = new TimeMapper;
	private TimeMapper timeMapper;
	
	@Test
	public void testGetTime() {
		
			logger.info("TimeMapper Ŭ����="+timeMapper.getClass().getName());
			logger.info("TimeMapper Ŭ������ getTime �޼ҵ� ȣ��="+timeMapper.getTime2());
		
	}
}