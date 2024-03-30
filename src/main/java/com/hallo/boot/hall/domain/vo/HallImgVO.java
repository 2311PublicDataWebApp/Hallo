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
public class HallImgVO {
		@NonNull
		private int hallImgNo;
		@NonNull
		private int hallNo;
		@NonNull
		private String hallImgName;
		@NonNull
		private String hallImgRename;
		@NonNull
		private String hallImgFilepath;
		@NonNull
		private long hallFileLength;
		@NonNull
		private String hallImgIsthumbnail;
		
}

