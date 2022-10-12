FROM ubuntu:latest

ENV FLAG="frictf{0000___0000__y0u_@re_A_tru3_h@ck3r_327d99a34c}"

RUN apt update && apt install openssh-server sudo -y

# Copy ssh key & disable password login
RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup sshuser
RUN mkdir -p /home/sshuser/.ssh
COPY ./chall/assets/forensics_id_rsa /home/sshuser/.ssh/authorized_keys
RUN chown sshuser:sshgroup /home/sshuser/.ssh/authorized_keys && chmod 600 /home/sshuser/.ssh/authorized_keys
RUN sed -i 's/#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config

RUN echo "$FLAG" > /home/sshuser/flag.txt

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
