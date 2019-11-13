package shenbo.crud.bean;

public class Department {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_dept.id
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_dept.deptName
     *
     * @mbg.generated
     */
    private String deptname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_dept.IocAdd
     *
     * @mbg.generated
     */
    private String iocadd;

    public Department() {
    }

    public Department(Integer id, String deptname) {
        this.id = id;
        this.deptname = deptname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_dept.id
     *
     * @return the value of tbl_dept.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_dept.id
     *
     * @param id the value for tbl_dept.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_dept.deptName
     *
     * @return the value of tbl_dept.deptName
     *
     * @mbg.generated
     */
    public String getDeptname() {
        return deptname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_dept.deptName
     *
     * @param deptname the value for tbl_dept.deptName
     *
     * @mbg.generated
     */
    public void setDeptname(String deptname) {
        this.deptname = deptname == null ? null : deptname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_dept.IocAdd
     *
     * @return the value of tbl_dept.IocAdd
     *
     * @mbg.generated
     */
    public String getIocadd() {
        return iocadd;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_dept.IocAdd
     *
     * @param iocadd the value for tbl_dept.IocAdd
     *
     * @mbg.generated
     */
    public void setIocadd(String iocadd) {
        this.iocadd = iocadd == null ? null : iocadd.trim();
    }
}