#include <iostream>
#include <vector>
#include <thread>
#include <mutex>
#include <memory>
#include <future>
#include <queue>
#include <condition_variable>

template<typename T>
class ThreadSafeQueue {
private:
    mutable std::mutex mut;
    std::queue<std::shared_ptr<T>> data_queue;
    std::condition_variable data_cond;
public:
    ThreadSafeQueue() {}
    void wait_and_pop(T& value) {
        std::unique_lock<std::mutex> lk(mut);
        data_cond.wait(lk, [this]{return !data_queue.empty();});
        value = std::move(*data_queue.front());
        data_queue.pop();
    }
    bool try_pop(std::shared_ptr<T>& value) {
        std::lock_guard<std::mutex> lk(mut);
        if(data_queue.empty()) return false;
        value = data_queue.front();
        data_queue.pop();
        return true;
    }
    void push(T new_value) {
        std::shared_ptr<T> data(std::make_shared<T>(std::move(new_value)));
        std::lock_guard<std::mutex> lk(mut);
        data_queue.push(data);
        data_cond.notify_one();
    }
};

// Optimized logic batch 2106
// Optimized logic batch 7124
// Optimized logic batch 7829
// Optimized logic batch 5737
// Optimized logic batch 7168
// Optimized logic batch 6936
// Optimized logic batch 6396
// Optimized logic batch 4997
// Optimized logic batch 4542
// Optimized logic batch 3539
// Optimized logic batch 3048
// Optimized logic batch 4793
// Optimized logic batch 1881
// Optimized logic batch 3270
// Optimized logic batch 6108
// Optimized logic batch 9522
// Optimized logic batch 1423
// Optimized logic batch 8346