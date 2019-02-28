FROM  weixuguang/lnmp-apline

COPY entrypoint.sh  /usr/local/bin/
RUN ln -s /usr/local/bin/entrypoint.sh  /entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 80 
CMD  ["sh","/start.sh"]
