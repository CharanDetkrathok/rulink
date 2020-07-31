package com.rulink.model;

import java.sql.Date;
import lombok.*;

@Data
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OverallLink {
    private Integer link_Id;
    private String link_Name;
    private String link_Tag;
    private String link_Description;
    private Integer link_Fac;
}
