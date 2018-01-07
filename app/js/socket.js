import io from 'socket.io-client';

export default function createSocket() {
  return io('http://localhost:8082');
}
