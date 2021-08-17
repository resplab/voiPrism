FROM opencpu/base
RUN R -e 'install.packages("INLA",repos=c(getOption("repos"),INLA="https://inla.r-inla-download.org/R/stable"), dep=TRUE)'
RUN R -e 'install.packages("BCEA")'
RUN R -e 'install.packages("splancs")'
RUN R -e 'remotes::install_github("resplab/voi")'
RUN R -e 'remotes::install_github("resplab/voiPrism")'
RUN echo  "{\"timelimit.post\":18000}" >  /etc/opencpu/server.conf.d/timeoverride.conf
RUN echo "opencpu:opencpu" | chpasswd
