
SET easy_code_setting="$HOME/Library/Preferences/IntelliJIdea*/options/easy-code-setting.xml"
if [ ! -f "$easy_code_setting" ]; then 
    echo "正在下载easy-code-setting.xml"
    wget -P $HOME/Library/Preferences/IntelliJIdea*/options https://raw.githubusercontent.com/lmule/spring-boot-archetype/master/easy-code-setting.xml 
fi 

bash_rc="$HOME/.bashrc"
if [ "$SHELL" = "/bin/zsh" ]; then
    bash_rc="$HOME/.zshrc"
fi;

echo '

magic80-cli() {
    until [ -z "$1" ] 
    do
        case $1 in
            -package)
                shift;
                package=$1;
                shift;;
            -version)
                shift;
                version=$1;
                shift;;
            -artifactid)
                shift;
                artifactId=$1;
                shift;;
            -groupid)
                shift;
                groupId=$1;
                shift;;
            -port)
                shift;
                port=$1;
                shift;;
            -dbHost)
                shift;
                dbHost=$1;
                shift;;
            -dbPort)
                shift;
                dbPort=$1;
                shift;;
            -dbName)
                shift;
                dbName=$1;
                shift;;
            -dbUser)
                shift;
                dbUser=$1;
                shift;;
            -dbPassword)
                shift;
                dbPassword=$1;
                shift;;
            *)
                echo "------"
                exit 1
                ;;
        esac
    done
    mvn archetype:generate \
        -DarchetypeGroupId=com.magic80 \
        -DarchetypeArtifactId=spring-boot-archetype  \
        -DarchetypeVersion=0.0.1 \
        -DgroupId=$groupId \
        -DartifactId=$artifactId \
        -Dpackage=$package \
        -Dversion=$version \
        -DdbHost=$dbHost \
        -DdbPort=$dbPort \
        -DdbName=$dbName \
        -DdbUser=$dbUser \
        -DdbPassword=$dbPassword \
        -DinteractiveMode=false
    idea $artifactId
}
' >> $bash_rc;
source $bash_rc