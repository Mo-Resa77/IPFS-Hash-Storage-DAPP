// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract FileStorage {

    struct File {
        string ipfsHash;
        string fileName;
        uint256 timestamp;
    }
                                                        // private for encapsulation
    mapping(address => File[]) private userFiles;

    event FileUploaded(
        address indexed user,
        string ipfsHash,
        string fileName,
        uint256 timestamp
    );

    // Added to satisfy "update" requirement
    event FileUpdated(
        address indexed user,
        uint256 index,
        string ipfsHash,
        string fileName,
        uint256 timestamp
    );

     // زياده هنا اليوزر يقدر يحمل اكتر من ملف 
    // call data cheaper than memory and we dont edit any thing 
    function uploadFile(string calldata _ipfsHash, string calldata _fileName) external {
        // Validation
        require(bytes(_ipfsHash).length > 0, "IPFS hash is empty");
        require(bytes(_fileName).length > 0, "File name is empty");

        //store
        userFiles[msg.sender].push(
            File(_ipfsHash, _fileName, block.timestamp)
        );

        emit FileUploaded(msg.sender, _ipfsHash, _fileName, block.timestamp);
    }

    // function to update an existing file
    function updateFile(uint256 _index, string calldata _newIpfsHash, string calldata _newFileName) external {
        require(_index < userFiles[msg.sender].length, "Invalid index");
        require(bytes(_newIpfsHash).length > 0, "IPFS hash is empty");
        require(bytes(_newFileName).length > 0, "File name is empty");

        File storage file = userFiles[msg.sender][_index];
        file.ipfsHash = _newIpfsHash;
        file.fileName = _newFileName;
        file.timestamp = block.timestamp;

        emit FileUpdated(msg.sender, _index, _newIpfsHash, _newFileName, block.timestamp);
    }

    function getFile(address _user, uint256 _index)
        public
        view
        returns (string memory, string memory, uint256)
    {
        require(_index < userFiles[_user].length, "Invalid index");
        File memory file = userFiles[_user][_index];
        return (file.ipfsHash, file.fileName, file.timestamp); 
    }

    function getFilesCount(address _user) public view returns (uint256) {
        return userFiles[_user].length;
    }
}