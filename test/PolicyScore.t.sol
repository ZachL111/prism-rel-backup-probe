// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../src/PolicyScore.sol";

contract PolicyScoreTest {
    function test_case_1() public {
        PolicyScore scorer = new PolicyScore();
        PolicyScore.Signal memory signal = PolicyScore.Signal(93, 92, 12, 10, 4);
        require(scorer.score(signal) == 196, "score mismatch");
        require(scorer.accepted(signal) == true, "decision mismatch");
    }
    function test_case_2() public {
        PolicyScore scorer = new PolicyScore();
        PolicyScore.Signal memory signal = PolicyScore.Signal(70, 97, 13, 19, 10);
        require(scorer.score(signal) == 108, "score mismatch");
        require(scorer.accepted(signal) == false, "decision mismatch");
    }
    function test_case_3() public {
        PolicyScore scorer = new PolicyScore();
        PolicyScore.Signal memory signal = PolicyScore.Signal(90, 76, 24, 12, 13);
        require(scorer.score(signal) == 163, "score mismatch");
        require(scorer.accepted(signal) == true, "decision mismatch");
    }
}
