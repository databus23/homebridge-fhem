IMAGE:= databus23/homebridge-fhem

build:
	docker build -t $(IMAGE) $(CURDIR)
push:
	docker push $(IMAGE)
