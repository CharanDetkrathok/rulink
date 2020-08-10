package com.rulink.model;

import lombok.*;

@Data
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Faculty {

    private Integer id_Fac;
    private String fac_Name;
    private Integer fac_No;
}
