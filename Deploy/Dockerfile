FROM amazonlinux:2

ENV PROJECT Functions
ENV BUCKET bucket
ENV LAYER layer
ENV REGION eu-central-1
ENV OPTIMIZE true

RUN yum -y update
RUN rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm

#RUN yum -y install rpm-build wget
#RUN wget https://github.com/dotnet/core/files/2186067/openssl-libs-ami.spec.txt
#RUN rpmbuild --bb openssl-libs-ami.spec.txt
#RUN rpm -i /root/rpmbuild/RPMS/x86_64/openssl-libs-1.0.0-0.x86_64.rpm

RUN yum -y install dotnet-sdk-3.1
RUN yum -y install zip
RUN yum -y install aws-cli

RUN dotnet tool install -g Amazon.Lambda.Tools
ENV PATH="/root/.dotnet/tools:${PATH}"

RUN  mkdir /work
WORKDIR /work

CMD cd $PROJECT && dotnet lambda publish-layer $LAYER --layer-type runtime-package-store --s3-bucket $BUCKET --region $REGION --framework netcoreapp2.1 --enable-package-optimization $OPTIMIZE