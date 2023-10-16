package com.example.demo.users;

public class PageMaker {
    private int startPage;
    private int endPage;
    private boolean prev, next;
    private int total;
    private Page p;

    public PageMaker(Page p, int total ) {
        this.total = total;
        this.p = p;

        this.endPage = (int)(Math.ceil(p.getPageNum()/10.0))*10;
        this.startPage = this.endPage - 9;

        int realEnd = (int)(Math.ceil(total * 1.0/p.getAmount()));

        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }

        this.prev = this.startPage > 1;

        this.next = this.endPage < realEnd;

    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public void setPrev(boolean prev) {
        this.prev = prev;
    }

    public boolean isNext() {
        return next;
    }

    public void setNext(boolean next) {
        this.next = next;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Page getP() {
        return p;
    }

    public void setP(Page p) {
        this.p = p;
    }

    @Override
    public String toString() {
        return "PageMaker{" +
                "startPage=" + startPage +
                ", endPage=" + endPage +
                ", prev=" + prev +
                ", next=" + next +
                ", total=" + total +
                ", p=" + p +
                '}';
    }
}
