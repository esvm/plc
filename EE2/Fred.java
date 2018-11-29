public class Fred extends Thread {
    private SafeArray array;
    public int num;
    public Fred(SafeArray array, int num) {
        this.array = array;
        this.num = num;
    }

    @Override
    public void run() {
        super.run();
        for (int i = 0; i < 10; i++) {
            this.array.get(i, this);
            System.out.println("Thread " + this.num + " getting index: " + i);
        }

    }
}
