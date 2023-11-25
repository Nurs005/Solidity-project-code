// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


contract TODO {

    struct Task{
        string description;
        bool status;
    }

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    Task[] public list;


    modifier onlyOwner {
        require(msg.sender == owner, "Only owner");
        _;
    }

    function setOwner(address newOwner) public onlyOwner{
        owner = newOwner;
    }

    function createTask(string memory descr) public onlyOwner{
        list.push(Task(descr, false));
    }

    function completeTask(uint id, bool stats) public onlyOwner{
        list[id].status = stats;
    }

    function getActiveTasks() public view returns(Task[] memory){
        uint sum = getNumberOfActive();
        uint counter = 0;
        Task[] memory activeTasks = new Task[](sum);

        for (uint i=0; i < list.length; i++){
            if(list[i].status == false){
                activeTasks[counter] = list[i];
                counter++;
            }
        }
        return activeTasks;
    }

    function getNumberOfActive() public view returns(uint){
        uint sum = 0;
        for (uint i=0; i < list.length; i++){
            if(list[i].status == false){
                sum++;
            }
        }
        return sum;
    }




// ВЛОЖЕННЫЕ ФУНКЦИИ -----------------------------------------------------------------------------
    // function test(uint a) public pure returns(uint){
    //     uint temp = test2(a);
    //     return temp;
    // }


    // function test2(uint a) private pure returns(uint){
    //     return a +  1;
    // }
// ВЛОЖЕННЫЕ ФУНКЦИИ -----------------------------------------------------------------------------

}