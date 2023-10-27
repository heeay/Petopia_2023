package petopia.com.kh.jsp.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{
	
	// FileRenamePolicy 클래스의 rename 추상메소드를 오버라이딩해서 구현
	@Override
	public File rename(File originFile) {
		
		// 매개변수로 전달받은 originFile에서 원본파일명 뽑기
		String originName = originFile.getName();
		
		// 수정파일명에 넣기 위한 현재 시간 뽑기
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 수정파일명에 넣기 위한 5자리 랜덤값 뽑기
		int randomNum = (int)(Math.random() * 90000) + 10000;
		
		// 원본파일명의 마지막 .부터의 문자열을 뽑아서 확장자 뽑기
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 수정파일명
		String changeName = "PETOPIA_" + currentTime + "_" + randomNum + ext;
		
		// 기존파일을 수정된 파일명으로 적용시켜서 반환
		return new File(originFile.getParent(), changeName);
	}

}
