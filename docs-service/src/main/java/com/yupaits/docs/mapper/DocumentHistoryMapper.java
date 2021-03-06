package com.yupaits.docs.mapper;

import com.yupaits.docs.model.DocumentHistory;

import java.util.List;

public interface DocumentHistoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DocumentHistory record);

    int insertSelective(DocumentHistory record);

    DocumentHistory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DocumentHistory record);

    int updateByPrimaryKeyWithBLOBs(DocumentHistory record);

    int updateByPrimaryKey(DocumentHistory record);

    List<DocumentHistory> selectBySelective(DocumentHistory record);
}