FROM maven:3.6.3-openjdk-15

# Google Chrome

ARG CHROME_VERSION=88.0.4324.150-1
ADD google-chrome.repo /etc/yum.repos.d/google-chrome.repo
RUN microdnf install -y google-chrome-stable-$CHROME_VERSION \
	&& sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" --no-sandbox/g' /opt/google/chrome/google-chrome

# ChromeDriver

ARG CHROME_DRIVER_VERSION=87.0.4280.88
RUN microdnf install -y unzip \
	&& curl -s -o /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip \
	&& unzip /tmp/chromedriver.zip -d /opt \
	&& rm /tmp/chromedriver.zip \
	&& mv /opt/chromedriver /opt/chromedriver-$CHROME_DRIVER_VERSION \
	&& chmod 755 /opt/chromedriver-$CHROME_DRIVER_VERSION \
	&& ln -s /opt/chromedriver-$CHROME_DRIVER_VERSION /usr/bin/chromedriver
