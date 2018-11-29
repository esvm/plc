public class SafeArray {
    private final int[] array;

    public SafeArray(int len) {
        array = new int[len];
    }

    public int get(int i){
        synchronized (this.array) {
            return this.array[i];
        }

    }

    public void set(int i, int v) {
        synchronized (this.array) {
            this.array[i] = v;
            System.out.println("add: " + v);
        }
    }

    public void swap(int i, int j) {
        synchronized (this.array) {
            int temp = this.array[i];
            this.array[i] = this.array[j];
            this.array[j] = temp;
            System.out.println("Trocou " + i + " com " + j);
        }
    }
}
