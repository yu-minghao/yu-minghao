package com.zcib.dto;

import java.util.List;

/**
 * @author
 * @date 2021年05月30日 13:45
 */
public class PageDTO<T> {

    private int pageNumber;//当前页码
    private int pageSize;//每页显示的记录数
    private int totalRecord;//总条数
    private int totalPage;//总页数
    private List<T> list;//数据集合

    /**
     * 计算总页数
     * @param pageNumber
     * @param pageSize
     * @param totalRecord
     */
    public PageDTO(int pageNumber, int pageSize, int totalRecord){

        this.pageNumber = pageNumber;
        this.pageSize = pageSize;

        this.totalRecord = totalRecord;
        if( totalRecord % pageSize == 0){

            totalPage = totalRecord/pageSize;

        }else {
            totalPage = totalRecord/pageSize + 1;
        }

    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageDTO{" +
                "pageNumber=" + pageNumber +
                ", pageSize=" + pageSize +
                ", totalRecord=" + totalRecord +
                ", totalPage=" + totalPage +
                ", list=" + list +
                '}';
    }
}
