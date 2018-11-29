import java.util.Random;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingDeque;

public class Questao3 {
}

class Produtor extends Thread {
    private Random rand;
    private BlockingQueue<Integer> cont;

    public Produtor(BlockingQueue pc) {
        rand = new Random();
        cont = pc;
    }

    @Override
    public void run() {
        super.run();
        int n = rand.nextInt(1000) + 1;
        try {
            cont.put(n);
            System.out.println("Produziu o valor: " + n);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}

class Consumidor extends Thread {
    private BlockingQueue<Integer> cont;

    public Consumidor(BlockingQueue pc) {
        cont = pc;
    }

    @Override
    public void run() {
        super.run();
        try {
            Integer v = cont.take();
            System.out.println("Consumiu o valor: " + v);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
}

class ProdutorConsumidor {
    public static void main(String[] args) {

        BlockingQueue<Integer> pc = new LinkedBlockingDeque<>(5);
        for (int i = 0; i < 10; i++) {
            new Produtor(pc).start();
            new Consumidor(pc).start();
        }
    }
}
