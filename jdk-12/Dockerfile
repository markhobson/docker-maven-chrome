FROM maven:3.6.1-jdk-12

# Google Chrome

ADD google-chrome.repo /etc/yum.repos.d/google-chrome.repo
RUN yum install -y google-chrome-stable \
	&& sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" --no-sandbox/g' /opt/google/chrome/google-chrome

# ChromeDriver

ARG CHROME_DRIVER_VERSION=76.0.3809.68
RUN yum install -y unzip \
	&& curl -s -o /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip \
	&& rm -rf /opt/chromedriver \
	&& unzip /tmp/chromedriver_linux64.zip -d /opt \
	&& rm /tmp/chromedriver_linux64.zip \
	&& mv /opt/chromedriver /opt/chromedriver-$CHROME_DRIVER_VERSION \
	&& chmod 755 /opt/chromedriver-$CHROME_DRIVER_VERSION \
	&& ln -fs /opt/chromedriver-$CHROME_DRIVER_VERSION /usr/bin/chromedriver
