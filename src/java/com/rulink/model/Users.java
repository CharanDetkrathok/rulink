package com.rulink.model;

import lombok.*;

@Data
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Users {
    private Integer _id;
    private String userName;
    private String passWord;
    private Integer maJor;
    private Integer facC;
    private Integer level_Status;
    private String insert_Date;
    private String update_Date;
}
