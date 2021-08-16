FROM opencpu/base
RUN R -e 'install.packages("voi")'
RUN R -e 'remotes::install_github("resplab/voiPrism")'
RUN echo "opencpu:opencpu" | chpasswd
