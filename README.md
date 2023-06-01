# Performance evaluation of the quorum blockchain platform...

This project has been demonstrates the performance of quorum platfrom by extend the Caliper benchmark framework. The use cases are conducted in ERC-1400 smart contract with quorum blockchain and  QBFT consensus under 4-nodes, 8-nodes and 16-nodes.

Requirements / dependencies

An all-in-one solution for demonstrates the performance of quorum platfrom

## Currently supported performance indicators:
* Success rate
* Transaction/Read throughput
* Transaction/Read latency (minimum, maximum, average)
* Resource consumption (CPU, Memory, Network IO, ...)

## Prerequisite 

*  Caliper benchmark https://hyperledger.github.io/caliper/  Quorum adaptor for Caliper https://libraries.io/npm/@salikzquidz%2Fcaliper-quorum  
npm install @salikzquidz/caliper-quorum@0.3.1-unstable to enable the Quorum adaptor for Caliper  
*  Docker https://docs.docker.com/engine/install/ 
*  Docker Compose: https://docs.docker.com/compose/install/ 

 
## Run the project 

* Clone the code in Github https://github.com/atfhk/Quorum.test.Caliper. 
* Chose any use case either { 4node,8node,16node) from project directory 
* Run experimental with line code  
./ run-with-setup.sh 
The results of experimental will record in the file named report.html 

![image](https://user-images.githubusercontent.com/124568518/219003289-dd30d4b7-09e5-4be9-af74-35b87ab4e5b5.png)


## Requirements

### Software
- [Visual Studio Code](https://code.visualstudio.com/) (with the [Solidity](https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity) extension)
- [NodeJs](https://nodejs.org/) (with the [Yarn package manager](https://yarnpkg.com/getting-started/install))
