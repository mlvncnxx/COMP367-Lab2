// pipeline {
//     agent any
//
//     tools {
//         // Install the Maven version configured as "M3" and add it to the path.
//         maven "Maven"
//         jdk "JDK19"
//     }
//
//     stages {
//         stage('Build') {
//             steps {
//                 // Get some code from a GitHub repository
//                 git branch: 'main', url: 'https://github.com/mlvncnxx/COMP367-Lab2.git'
//
//                 // Run Maven on a Unix agent.
//                 sh "mvn -Dmaven.test.failure.ignore=true clean package"
//
//                 // To run Maven on a Windows agent, use
//                  //bat "mvn clean compile"
//             }
//         }
//     }
// }

pipeline {
    agent any

    environment {
        JAVA_HOME = '/Users/Mel/Library/Java/JavaVirtualMachines/openjdk-19.0.1/Contents/Home'
    }

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven"
        jdk "JDK19"
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/mlvncnxx/COMP367-Lab2.git'

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package"

                //sh 'mvn -f /Users/Mel/Desktop/Winter 2023/COMP 367/COMP367-Lab2/WebApp/pom.xml clean package'

                sh 'cd /Users/Mel/Desktop/Winter 2023/COMP 367/COMP367-Lab2/WebApp/pom.xml && mvn clean package'

                // To run Maven on a Windows agent, use
                //bat "mvn clean compile"
            }
        }
    }
}

