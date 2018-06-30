package weixin.cms.entity;

import java.util.List;
import java.util.Map;

public class ORderListResp {
    List<Map<String, Object>> list;
    int total;

    public List<Map<String, Object>> getList() {
        return list;
    }

    public void setList(List<Map<String, Object>> list) {
        this.list = list;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
