package com.moyada.myblog.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminDTO {
	private int aidx;
	private String admin_id;
	private String admin_pw;
	private String admin_name;

}
