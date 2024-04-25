#include <iostream>
#include <vector>
#include <sycl/sycl.hpp>
#include <sycl/ext/oneapi/backend/level_zero.hpp> // Include the level_zero.hpp header that contains the provided code

int main() {
    // Initialize Level-Zero native handles
    pi_native_handle PlatformHandle = nullptr; // Assume this is initialized with a valid handle
    pi_native_handle DeviceHandle = nullptr;   // Assume this is initialized with a valid handle
    pi_native_handle ContextHandle = nullptr;  // Assume this is initialized with a valid handle
    pi_native_handle QueueHandle = nullptr;    // Assume this is initialized with a valid handle
    pi_native_handle EventHandle = nullptr;    // Assume this is initialized with a valid handle

    // Create SYCL platform from Level-Zero native handle
    sycl::platform platform = sycl::ext::oneapi::level_zero::make_platform(PlatformHandle);

    // Create SYCL device from Level-Zero native handle and platform
    sycl::device device = sycl::ext::oneapi::level_zero::make_device(platform, DeviceHandle);

    // Create a vector of SYCL devices (you can add more devices if needed)
    std::vector<sycl::device> devices = {device};

    // Create SYCL context from list of devices and Level-Zero native handle
    sycl::context context = sycl::ext::oneapi::level_zero::make_context(devices, ContextHandle);

    // Create SYCL queue from context, device, and Level-Zero native handle
    sycl::queue queue = sycl::ext::oneapi::level_zero::make_queue(context, device, QueueHandle);

    // Create SYCL event from context and Level-Zero native handle
    sycl::event event = sycl::ext::oneapi::level_zero::make_event(context, EventHandle);

    // Print some information about the created objects
    std::cout << "Platform: " << platform.get_info<sycl::info::platform::name>() << std::endl;
    std::cout << "Device: " << device.get_info<sycl::info::device::name>() << std::endl;

    return 0;
}