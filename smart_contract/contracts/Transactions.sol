// SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.0;

contract Transactions {
    uint256 transactionCounter;

    /**
     * @dev 송금 이벤트
     * @param from 송금자 주소
     * @param receiver 수신자 주소
     * @param amount 송금 금액
     * @param message 송금 메시지
     * @param timestamp 송금 시간
     * @param keyword 키워드
     */
    event Transfer(address from, address receiver, uint amount, string message, uint256 timestamp, string keyword);

    struct TransferStruct {
        address from;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TransferStruct[] transactions;

    /**
     * @dev 블록체인에 거래 추가
     * @param receiver 수신자 주소
     * @param amount 송금 금액
     * @param message 송금 메시지
     * @param keyword 키워드
     */
    function addToBlockchain(address payable receiver, uint amount, string memory message, string memory keyword) public {
        transactionCounter += 1;
        transactions.push(TransferStruct(msg.sender, receiver, amount, message, block.timestamp, keyword));

        emit Transfer(msg.sender, receiver, amount, message, block.timestamp, keyword);
    }

    /**
     * @dev 모든 거래 내역 가져오기
     * @return 모든 거래 내역 배열
     */
    function getAllTransactions() public view returns (TransferStruct[] memory) {
        return transactions;
    }

    /**
     * @dev 거래 횟수 가져오기
     * @return 거래 횟수
     */
    function getTransactionCount() public view returns (uint256) {
        return transactionCounter;
    }
}