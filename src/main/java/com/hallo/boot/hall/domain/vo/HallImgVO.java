package com.hallo.boot.hall.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class HallImgVO {
		@NonNull
		private Integer hallImgNo;
		@NonNull
		private Integer hallNo;
		private String hallImgName;
		private String hallImgRename;
		private String hallImgFilepath;
		private long hallFileLength;
		private String hallImgIsthumbnail;
		
}

