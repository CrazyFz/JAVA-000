package classloaderTest;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class FzClassLoader extends ClassLoader{

	public static void main(String[] args) {
		try {
			Object object = new FzClassLoader().findClass("Hello").newInstance();
			// 反射调用实例的方法
			object.getClass().getDeclaredMethod("hello").invoke(object);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	protected Class<?> findClass(String name) throws ClassNotFoundException {
		File classFile = new File("file/Hello.xlass");
		if (classFile.exists()) {
			try (FileInputStream in = new FileInputStream(classFile);
					ByteArrayOutputStream out = new ByteArrayOutputStream()) {
				byte[] bytes = new byte[1024];
				int len;
				while ((len = in.read(bytes)) != -1) {
					for(int i = 0 ;i<bytes.length;i++) {
						bytes[i] = (byte) (255 - bytes[i]);
					}
					out.write(bytes, 0, len);
				}
				return defineClass(name, out.toByteArray(), 0, out.size());
			}catch (IOException e) {
	            e.printStackTrace();
	        }
		}
		return super.findClass(name);
	}
	
}
