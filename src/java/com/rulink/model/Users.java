/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rulink.model;

import lombok.*;


/**
 *
 * @author RU-COM9
 */
@Data
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Users {
    private Integer _id;
    private String userName;
    private String passWord;
    private String maJor;
    private String facC;
    private String peRiod;
    private String insert_Date;
    private String update_Date;
}
