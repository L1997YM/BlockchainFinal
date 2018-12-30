pragma solidity ^ 0.4 .17;

contract Uptxt {

    struct Article {
        //作者的以太坊地址
        address author_adr;
        //文章地址
        string article_adr;
        //文章id
        uint id;
        //阅读次数
        uint read_num;
        //设置是否对他人可见
        bool can_read;
    }

    //存储文章信息的结构数组
    //Article[] public arting;
    mapping (uint => Article) arting;
    //文章的序列号
    uint numArticle;

    //上传文章
    function uploadArticle(string article_adr) returns (uint) {
        numArticle++;
        arting[numArticle] = Article(msg.sender,article_adr,numArticle,0,true);
        return numArticle;
    }

    //获取文章
    function getArticle(uint id) public returns (string article_adr) {
        if(id > numArticle || id < 0)
            article_adr = "error id!";
        else {
            Article c = arting[id];
            if(c.author_adr != msg.sender && c.can_read != true)
                article_adr = "You don't have power to read!";
            else {
                article_adr = c.article_adr;
                arting[id].read_num++;
            }
        }
    }

    //获得阅读次数
    function getReadnum(uint id) public returns (uint ReadNum) {
        if(id > numArticle || id < 0)
            ReadNum = 0;
        else {
            Article c = arting[id];
            ReadNum = c.read_num;
        }
    }

    //设置自己的文章访问权限
    function setReadPower(uint id) public returns (bool is_success) {
        if(id > numArticle || id < 0)
            is_success = false;
        else {
            Article c = arting[id];
            if(c.author_adr != msg.sender)
                is_success = false;
            else {
                is_success = true;
                if(c.can_read == true)
                    arting[id].can_read = false;
                else
                    arting[id].can_read = true;
            }
        }
    }

    //查看文章阅读权限
    function checkReadPower(uint id) public returns (bool ReadPower) {
        Article c = arting[id];
        ReadPower = c.can_read;
    }
}
