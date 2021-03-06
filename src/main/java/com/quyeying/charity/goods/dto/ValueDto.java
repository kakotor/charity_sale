package com.quyeying.charity.goods.dto;

import org.apache.commons.lang3.StringUtils;

/**
 * User: bysun
 * Date: 2014/8/3
 * Time: 19:29
 */
public class ValueDto {
    private String id;
    private Double value;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = StringUtils.trimToNull(id);
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }
}
