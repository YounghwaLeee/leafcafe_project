var http = require('http');
var fs = require('fs');
var socketio = require('socket.io');
var server = http.createServer((req, res)=>{
    if(req.url=='/leafChat'){

        fs.readFile(__dirname+'/chat_client.ejs','utf-8',(e,d)=>{
            res.writeHead(200, {'Content-Type':'text/html;Charset=utf-8'});
            res.end(d);
        });
    }else if(req.url=='/leafAdmin'){
        fs.readFile(__dirname+'/chat_admin.ejs','utf-8',(e,d)=>{
            res.writeHead(200, {'Content-Type':'text/html;Charset=utf-8'});
            res.end(d);
        });
    }

}).listen(10077, ()=>{
    console.log('server start http://127.0.0.1:10077/leafChat');
});

//====통신프로그램==========================================================================
//1. 소켓서버를 생성하고 실행한다. 
var io = socketio.listen(server);

//2. 접속을 대기하는 이벤트를 생성('connection' 이벤트가 발생하면 실행될 곳)
io.sockets.on('connection',function(socket){
    var roomName;
    socket.on('join',function(roomNameReceive){
        roomName = roomNameReceive;
        socket.join(roomName);
    });
    //3. 클라이언트가 보낸 문자를 받을 이벤트
    socket.on('message',function(data){
        io.sockets.in(roomName).emit('response',' <li id="chatAdmin">주식회사 leaf</li><li id="admin">'+data);
    });
    socket.on('hello',function(msg){
        //4.클라이언트에게 서버가 정보 보내는 이벤트 발생
        socket.emit('echo','주식회사 leaf <br/><li>'+msg);
    });
    socket.on('cMessage',function(data){
        io.sockets.in(roomName).emit('response',' <li id="chatUser">문의자</li><li id="user">'+data);
    });
});