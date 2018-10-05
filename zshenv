# Identify OS and Machine -----------------------------------------
export OS=`uname -s | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`
export MACHINE=`uname -m | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export PLATFORM="$MACHINE-$OS-$OSVERSION"
export EDITOR='nvim'


# Machine Specific Environment ------------------------------------


if [ "$(hostname)" "==" "mfc-ThinkPad" ] ; then

      WORKON_HOME=$HOME/.virtualenvs
      export WORKON_HOME=$HOME/.virtualenvs
      export PROJECT_HOME=$HOME/Projects

      export LD_LIBRARY_PATH=/usr/lib/
      source /usr/local/bin/virtualenvwrapper.sh
      
      #Added by Miniconda3 installer
      export PATH="/home/mfc/.miniconda3/bin:$PATH"
      
      #Pyenv Setup 
      export PYENV_ROOT=$HOME/.pyenv
      export PATH=$PYENV_ROOT/bin:$PATH
      if command -v pyenv 1>/dev/null 2>&1; then
	    eval "$(pyenv init -)"
      fi
      eval "$(pyenv virtualenv-init -)"
fi

if [ "$(hostname)" "==" "mfc-XPS" ] ; then
      WORKON_HOME=$HOME/.virtualenvs
      export WORKON_HOME=$HOME/.virtualenvs
      export PROJECT_HOME=$HOME/Projects
      source /usr/local/bin/virtualenvwrapper.sh
      source $HOME/.virtualenvs/py3.5/bin/activate
      source $HOME/.virtualenvs/py3.5/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
      export LD_LIBRARY_PATH=/usr/lib/
      #export ENERGYPLUS_PATH=/home/mfc/.config/EnergyPlus-8-7-0
      #export PATH=$PATH:ENERGYPLUS_PATH
      # export SUNDIALS_HOME=/usr/local/
      export PATH=$PATH:/usr/local/cuda-9.1/bin
      export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-9.1/lib64
      export CUDA_HOME=/usr/local/cuda-9.1/
      export  JMODELICA_HOME=/home/mfc/.config/JModelica
      export  IPOPT_HOME=/home/mfc/.config/ipopt/
      export  SUNDIALS_HOME=/home/mfc/.config/JModelica/ThirdParty/Sundials
      export  PYTHONPATH=/home/mfc/.config/JModelica/Python/:$PYTHONPATH
      export  LD_LIBRARY_PATH=:/home/mfc/.config/ipopt//lib/:/home/mfc/.config/JModelica/ThirdParty/Sundials/lib:/home/mfc/.config/JModelica/ThirdParty/CasADi/lib:$LD_LIBRARY_PATH
      export  SEPARATE_PROCESS_JVM=/usr/lib/jvm/java-8-openjdk-amd64/
      export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
      export MODELICAPATH=${MODELICAPATH}:/usr/lib/omlibrary/
    #   export SPARK_HOME=$HOME/.config/spark-2.2.0-bin-hadoop2.7/6
    #   export PATH=$PATH:/home/mfc/.config/spark-2.2.0-bin-hadoop2.7/bin/
      export PATH=$HOME/.config/idea/bin/:$PATH
      export PATH=$PATH:/home/mfc/.config/cling/bin/
      # Anaconda
      export PATH=$PATH:/home/mfc/miniconda3/bin/
      #Pytorch
      export CMAKE_PREFIX_PATH=/home/mfc/miniconda3/
      # bcvtb
      export BCVTB_HOME=/home/mfc/.config/bcvtb
      export BCVTB_JNI_DIR=/usr/bin/java/include
      export ENERGYPLUS_BIN=/home/mfc/.config/EnergyPlus-8-5-0/
      export PATH=$PATH:ENERGYPLUS_BIN
      #gradle
      export PATH=$PATH:/opt/gradle/gradle-4.6/bin
    # agile project
    export PATH=$PATH:/usr/share/rvm/bin:/home/mfc/Projects/Agile_Data_Code_2/bin:/home/mfc/Projects/Agile_Data_Code_2/bin
    export AGILE_HOME=/home/mfc/Projects/Agile_Data_Code_2
    # Hadoop environment setup
    export HADOOP_HOME=$AGILE_HOME/hadoop
    export PATH=$PATH:$HADOOP_HOME/bin
    export HADOOP_CLASSPATH=$(hadoop classpath)
    export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
    export SPARK_DIST_CLASSPATH=$HADOOP_HOME/bin/hadoop classpath
    export PATH=$PATH:$AGILE_HOME/mongodb/bin
    export PYTHONPATH=$PYTHONPATH:$AGILE_HOME/lib
    # Spark environment setup
    export SPARK_HOME=$AGILE_HOME/spark
    export HADOOP_CONF_DIR=$AGILE_HOME/hadoop/etc/hadoop/
    export SPARK_DIST_CLASSPATH=`$HADOOP_HOME/bin/hadoop classpath`
    export PATH=$PATH:$SPARK_HOME/bin

    # Pyenv setup
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    if command -v pyenv 1>/dev/null 2>&1; then
	    eval "$(pyenv init -)"
    fi
    eval "$(pyenv virtualenv-init -)"
fi

# Path ------------------------------------------------------------


if [ "$OS" = "linux" ] ; then

fi

if [ -d ~/bin ]; then
	export PATH=~/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi


#source $HOME/.zshrc
