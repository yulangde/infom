package cn.yulangde.infom.test;

import java.util.Arrays;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringTest {

	@Test
	public void  test(){
		try {
			String path = "mvc.xml";
			ClassPathXmlApplicationContext ioc = new ClassPathXmlApplicationContext(path);
			String[] names = ioc.getBeanDefinitionNames();
			System.err.println(Arrays.toString(names));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
/*IArticleServiceImpl, ICategoryServiceImpl, articleController,
categoryMapper, IArticleDao*/