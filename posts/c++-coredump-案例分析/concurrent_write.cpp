#include <string>
#include <vector>
#include <unordered_map>
#include <memory>
#include <thread>

class VoidObject {
public:
    VoidObject() {}
    ~VoidObject() {}
};

class Element {
public:
    std::vector<VoidObject> vector_field;
    VoidObject object_field;
    std::shared_ptr<VoidObject> object_ptr_field;
};

void EditElement(std::shared_ptr<Element> ele) {
    ele->vector_field = {VoidObject()};
    ele->object_field = VoidObject();
    ele->object_ptr_field = std::make_shared<VoidObject>();
}

int main() {
    auto shared_ele = std::make_shared<Element>();
    std::thread thr1(EditElement, shared_ele);
    std::thread thr2(EditElement, shared_ele);
    
    thr1.join();
    thr2.join();
}
