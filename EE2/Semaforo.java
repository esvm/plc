public class Semaforo extends Thread {
    private int count;

    public Semaforo(int v) {
        this.count = v;
    }

    public void up(){
        synchronized (this) {
            this.count++;
            notifyAll();
        }
    }

    public void down() {
        synchronized (this) {
            if (count == 0)  {
                try {
                    wait();
                } catch (InterruptedException e) {
                }
            } else count--;
        }
    }
}
