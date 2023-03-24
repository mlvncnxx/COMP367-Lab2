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

// pipeline {
//     agent any
//
//     environment {
//         JAVA_HOME = '/Users/Mel/Library/Java/JavaVirtualMachines/openjdk-19.0.1/Contents/Home'
//     }
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
//                 //sh 'mvn -f /Users/Mel/Desktop/Winter 2023/COMP 367/COMP367-Lab2/WebApp/pom.xml clean package'
//
//                 //sh 'cd /Users/Mel/Desktop/Winter\ 2023/COMP\ 367/COMP367-Lab2 && mvn clean package'
//                 sh 'cd /Users/Mel/Desktop/Winter\\ 2023/COMP\\ 367/COMP367-Lab2 && mvn clean package'
//
//                 // To run Maven on a Windows agent, use
//                 //bat "mvn clean compile"
//             }
//         }
//     }
// }



pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven"
        jdk "JDK19"
    }

    stages {
        stage('Checkout') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/mlvncnxx/COMP367-Lab2.git'
            }
        }
        stage('Build Maven Project') {
            steps {
                // Run Maven to build the project and generate the WAR file
                sh 'mvn -Dmaven.test.failure.ignore=true clean package'
            }
        }
        stage('Docker Build') {
            steps {
                // Build the Docker image with the compiled WAR file
                sh 'docker build -t melanonuevo/maven-java-webapp:$BUILD_NUMBER .'
            }
        }
        stage('Docker Login and Push') {
            steps {
                // Log in to Docker Hub using the credentials you added to Jenkins Credentials
                withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'

                    // Push the Docker image to Docker Hub
                    sh 'docker push melanonuevo/maven-java-webapp:$BUILD_NUMBER'
                }
            }
        }
    }
}


