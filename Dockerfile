FROM opencpu/base
RUN R -e 'remotes::install_github("resplab/voi")'
RUN R -e 'install.packages("remotes")'
RUN R -e 'remotes::install_github("resplab/voiPrism")'
RUN echo "opencpu:opencpu" | chpasswd
