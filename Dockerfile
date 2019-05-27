FROM jupyter/scipy-notebook

USER jovyan

# training set zelf online zetten
ADD https://mlchallenge.azurewebsites.net/trainingset work/MachineLearningChallenge/trainingset.csv
ADD https://mlchallenge.azurewebsites.net/testset work/MachineLearningChallenge/testset.csv
ADD ./myMlChallenge.ipynb work/MachineLearningChallenge/myMlChallenge.ipynb

RUN pip install --upgrade pip
RUN pip install plotly  &&\
  pip install matplotlib_venn  &&\
  pip install cufflinks  &&\
  pip install gender-guesser &&\
  pip install -U nltk  &&\
  pip install pyarrow  &&\
  pip install --upgrade pandas  &&\
  cd ~/work

RUN git clone http://bitbucket.org/hrojas/learn-pandas
RUN mkdir temp &&\
  cd temp &&\
  git clone https://github.com/lucasjellema/DataAnalytics--IntroductionDataWrangling-JupyterNotebooks &&\
  mv DataAnalytics--IntroductionDataWrangling-JupyterNotebooks/CaseOfOracleOpenWorld2018 ~/work/DataWranglingLecture/ &&\
  mv DataAnalytics--IntroductionDataWrangling-JupyterNotebooks/HelloWorldNotebook ~/work/DataWranglingLecture/ &&\
  mv DataAnalytics--IntroductionDataWrangling-JupyterNotebooks/Titanic ~/work/DataWranglingLecture/

USER root
RUN cd /home/jovyan/work  &&\
  chown -R jovyan:users /home/jovyan &&\
  rm -Rf temp 
