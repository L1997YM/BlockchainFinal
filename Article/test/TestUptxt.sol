pragma solidity ^ 0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Uptxt.sol";

contract TestUptxt {
  Uptxt uptxt = Uptxt(DeployedAddresses.Uptxt());

  function testUserCanUpload() {
    uint returnedId = uptxt.uploadArticle("www.baidu.com");
    uint expected = 1;
    Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
  }

  function testUserCanGet() {
    string memory returnstring = uptxt.getArticle(1);
    string memory expected = "www.baidu.com";
    Assert.equal(returnstring, expected, "Adoption of pet ID 8 should be recorded.");
  }

  function testGetReadnum() {
    uptxt.getArticle(1);
    uptxt.getArticle(1);
    uint returnedReadnum = uptxt.getReadnum(1);
    uint expected = 3;
    Assert.equal(returnedReadnum, expected, "Adoption of pet ID 8 should be recorded.");
  }

  function testcheckReadPower1() {
    bool returnedbool = uptxt.checkReadPower(1);
    bool expected = true;
    Assert.equal(returnedbool, expected, "Adoption of pet ID 8 should be recorded.");
  }

  function testSetReadPower() {
    bool returnedbool = uptxt.setReadPower(1);
    bool expected = true;
    Assert.equal(returnedbool, expected, "Adoption of pet ID 8 should be recorded.");
  }

  function testcheckReadPower2() {
    bool returnedbool = uptxt.checkReadPower(1);
    bool expected = false;
    Assert.equal(returnedbool, expected, "Adoption of pet ID 8 should be recorded.");
  }

}
