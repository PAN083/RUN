#!/usr/bin/env python
# -*- coding:utf-8 -*-
import socket

import time

sock = socket.socket(type=socket.SOCK_DGRAM)                           #创建Socket接口

sock.sendto('RELAY-SCAN_DEVICE-NOW'.encode(),('192.168.1.210', 4196))  #发送初始化命令1

time.sleep(2)                                                          #延时2秒

sock.sendto('RELAY-TEST-NOW'.encode(),('192.168.1.210', 4196))         #发送初始化命令2

time.sleep(2)                                                          #延时2秒

sock.sendto('RELAY-SET-1,1,1'.encode(),('192.168.1.210', 4196))        #打开第1路电灯泡

time.sleep(2)                                                          #延时2秒

sock.sendto('RELAY-SET-1,1,0'.encode(),('192.168.1.210', 4196))        #关闭第1路电灯泡

time.sleep(2)                                                          #延时2秒

server_msg, address = sock.recvfrom(1024)

print('收到服务端消息',server_msg.decode())

sock.close()
