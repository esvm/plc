//import java.util.ArrayList;
//import java.util.Random;
//import java.util.concurrent.locks.Lock;
//import java.util.concurrent.locks.ReentrantLock;

public class Questao2 {
}

//class Produtor extends Thread {
//    private Random rand;
//    private ContadorPC cont;
//
//    public Produtor(ContadorPC pc) {
//        rand = new Random();
//        cont = pc;
//    }
//
//    @Override
//    public void run() {
//        super.run();
//        System.out.println("Produziu o valor: " + cont.add(rand.nextInt(1000) + 1));
//    }
//}
//
//class Consumidor extends Thread {
//    private ContadorPC cont;
//
//    public Consumidor(ContadorPC pc) {
//        cont = pc;
//    }
//
//    @Override
//    public void run() {
//        super.run();
//        System.out.println("Consumiu o valor: " + cont.remove());
//    }
//}
//
//class ContadorPC {
//    private ArrayList<Integer> queue;
//    private Lock lock;
//
//    public ContadorPC() {
//        this.queue = new ArrayList<>();
//        this.lock = new ReentrantLock();
//    }
//
//    synchronized public int add(int v) {
//        queue.add(v);
//        notifyAll();
//        return v;
//    }
//
//    synchronized public int remove() {
//        while (queue.size() == 0) {
//            try {
//                this.wait();
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
//        }
//        int v = queue.remove(queue.size() - 1);
//        return v;
//    }
//}
//
//class ProdutorConsumidor {
//    public static void main(String[] args) {
//
//        ContadorPC pc = new ContadorPC();
//        for (int i = 0; i < 10; i++) {
////            System.out.println(i);
//            new Produtor(pc).start();
//            new Consumidor(pc).start();
//        }
//    }
//}
