public class Main {
    public static long counter = 1;

    public static void main(String[] args) {
        SafeArray array = new SafeArray();
        Thread t = new Thread(() -> {
            for (int i = 0; i < 10; i++) {
                array.set(i);
            }
        });
        t.start();

        try {
            t.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        new Thread(() -> {
            for (int i = 0; i < 10; i++) {
                array.swap(i, 9-i);
            }
        }).start();

        for (int i = 0; i < 2; i++) {
            new Fred(array, i).start();
        }
        System.out.println("Hello from MAIN thread");
    }
}



