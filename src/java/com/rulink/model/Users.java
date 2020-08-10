package com.rulink.model;

import java.sql.Date;
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
    private Integer facC;
    private Integer level_Status;
    private Date insert_Date;
    private Date update_Date;
}
