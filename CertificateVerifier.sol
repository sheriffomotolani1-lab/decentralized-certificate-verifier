// SPDX-License-Identifier: MIT
solidity ^0.8.20;

contract CertificateVerifier {
    struct Certificate {
        string studentName;
        string courseName;
        string grade;
        uint256 issueDate;
        bool exists;
    }

    // Mapping from Certificate ID/Hash to Certificate details
    mapping(bytes32 => Certificate) public certificates;
    
    // Contract owner (Issuer)
    address public owner;

    // Events
    event CertificateIssued(bytes32 indexed certId, string studentName, string courseName);
    event CertificateRevoked(bytes32 indexed certId);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized: Only owner can call this");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /// @notice Issue a new certificate
    function issueCertificate(
        bytes32 certId,
        string memory studentName,
        string memory courseName,
        string memory grade
    ) external onlyOwner {
        require(!certificates[certId].exists, "Certificate already exists");

        certificates[certId] = Certificate({
            studentName: studentName,
            courseName: courseName,
            grade: grade,
            issueDate: block.timestamp,
            exists: true
        });

        emit CertificateIssued(certId, studentName, courseName);
    }

    /// @notice Verify if a certificate is valid and return its details
    function verifyCertificate(bytes32 certId) external view returns (
        bool isValid,
        string memory studentName,
        string memory courseName,
        string memory grade,
        uint256 issueDate
    ) {
        require(certificates[certId].exists, "Certificate does not exist");
        Certificate memory cert = certificates[certId];
        
        return (true, cert.studentName, cert.courseName, cert.grade, cert.issueDate);
    }
}
