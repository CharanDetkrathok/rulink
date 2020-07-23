package com.rulink.model;

import lombok.*;

@Data
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LevelStatus {

    private Integer id_level;
    private String level_Name;
    private Integer level_No;
    
}
