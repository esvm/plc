public class SafeQueue {
    private int[] queue;
    private int size;
    
    public SafeQueue(int size) {
        this.queue = new int[size];
        this.size = 0;
    }

    public synchronized void push(int v) throws InterruptedException {
        if (this.size == this.queue.length)
            wait();

        this.queue[this.size++] = v;
        notifyAll();
    }

    public synchronized int getSize() {
        return this.queue.length;
    }

    public int pop() throws InterruptedException {
        if (this.size == 0)
            wait();

        int v = this.queue[0];
        for (int i = 0; i < this.size - 1; i++) {
            this.queue[i] = this.queue[i+1];
        }
        this.size--;
        notifyAll();
        return v;
    }
}
