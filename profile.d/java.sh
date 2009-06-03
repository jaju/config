# Make sure JAVA_HOME is set
#[ -z "$JAVA_HOME" ] && JAVA_HOME="/usr/local/java" && export JAVA_HOME
#echo $PATH | grep "$JAVA_HOME/bin" &>/dev/null
#if [ "$?" -eq 1 ]; then
#    export PATH=$JAVA_HOME/bin:$PATH
#fi

add_jar_to_cp ()
{
    current_dir=`pwd`
    jar_file=$1
    while [ "x$jar_file" != "x" ]; do
        if [ ! -f $jar_file ]; then
            echo "$jar_file: No such file"
            shift
            jar_file=$1
            continue
        fi
        fname=`basename $jar_file`
        dname=`dirname $jar_file`
        cd $dname
        new_entry=`pwd`/$fname
        echo $CLASSPATH | grep ":$new_entry" &>/dev/null
        if [ "$?" = "0" ]; then
            echo "File $jar_file already in CLASSPATH!"
        else
            CLASSPATH=$CLASSPATH:`pwd`/$fname
        fi
        cd $current_dir
        shift
        jar_file=$1
    done
    export CLASSPATH
}

add_dir_to_cp ()
{
    current_dir=`pwd`
    dir_to_add=$1
    while [ "x$dir_to_add" != "x" ]; do
        if [ ! -d $dir_to_add ]; then
            echo "$dir_to_add: No such directory!"
            shift
            dir_to_add=$1
            continue
        fi
        cd $dir_to_add
        new_entry=`pwd`
        echo $CLASSPATH | grep ":$new_entry" &>/dev/null
        if [ "$?" = "0" ]; then
            echo "Directory $dir_to_add already in CLASSPATH!"
        else
            CLASSPATH=$CLASSPATH:$new_entry
        fi
        cd $current_dir
        shift
        dir_to_add=$1
    done
    export CLASSPATH
}

add_to_cp ()
{
    resource_to_add=$1
    while [ "x$resource_to_add" != "x" ]; do
        if [ -d $resource_to_add ]; then
            echo "Adding directory: $resource_to_add..."
            add_dir_to_cp $resource_to_add
        elif [ -f $resource_to_add ]; then
            echo "Adding (JAR) file: $resource_to_add..."
            add_jar_to_cp $resource_to_add
        else
            echo "Invalid resource to add: $resource_to_add"
        fi
        shift
        resource_to_add=$1
    done
}

#CLASS_DIR=/usr/local/jars
#echo $CLASSPATH | grep "$CLASS_DIR/" &>/dev/null
#if [ "$?" -eq 1 ]; then
#    if [ -d "$CLASS_DIR" ]; then
#        for f in `/bin/ls -1 "$CLASS_DIR/*.jar" 2>/dev/null`; do
#            add_jar_to_cp $f
#        done
#        export CLASSPATH
#    fi
#fi
#unset CLASS_DIR
