package kr.co.alto.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class memImgDownloadController {
	//파일 저장 위치 지정
	private static final String MEM_IMG_PATH = "C:\\workspace-spring\\alto\\member";
	
	@RequestMapping("/memImgDown.do")
	public void download(@RequestParam("imageFileName") String imageFileName, HttpServletResponse response) 
			throws Exception {
		
		OutputStream out = response.getOutputStream();
		String downFile = "";
		if (imageFileName != null) {
			downFile = MEM_IMG_PATH+"\\"+imageFileName;
		}
		
		//다운로드될 파일 객체 생성
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		//헤더에 파일이름 설정
		response.addHeader("Content-disposition", "attachment; fileName="+imageFileName);
		
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8]; 	//버퍼 이용, 8kbyte씩 전송
		while(true) {
			int count = in.read(buffer);
			if(count == -1) break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
}
