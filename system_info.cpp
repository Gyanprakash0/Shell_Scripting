#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <cstdlib>
#include <sys/sysinfo.h>
#include <unistd.h>

void print_cpu_info() {
    std::cout << "CPU Information:" << std::endl;
    std::ifstream cpuinfo("/proc/cpuinfo");
    std::string line;
    while (std::getline(cpuinfo, line)) {
        if (line.find("model name") != std::string::npos) {
            std::cout << line << std::endl;
        }
    }
}

void print_memory_info() {
    std::cout << "\nMemory Information:" << std::endl;
    struct sysinfo info;
    if (sysinfo(&info) == 0) {
        std::cout << "Total RAM: " << info.totalram / 1024 / 1024 << " MB" << std::endl;
        std::cout << "Free RAM: " << info.freeram / 1024 / 1024 << " MB" << std::endl;
        std::cout << "Used RAM: " << (info.totalram - info.freeram) / 1024 / 1024 << " MB" << std::endl;
    } else {
        std::cerr << "Failed to get memory information." << std::endl;
    }
}

void print_disk_usage() {
    std::cout << "\nDisk Usage:" << std::endl;
    std::system("df -h --total");
}

void print_os_info() {
    std::cout << "\nOS Information:" << std::endl;
    std::ifstream osinfo("/etc/os-release");
    std::string line;
    while (std::getline(osinfo, line)) {
        if (line.find("PRETTY_NAME") != std::string::npos) {
            std::cout << line << std::endl;
        }
    }
}

void print_uptime() {
    std::cout << "\nSystem Uptime:" << std::endl;
    struct sysinfo info;
    if (sysinfo(&info) == 0) {
        long uptime_seconds = info.uptime;
        long hours = uptime_seconds / 3600;
        long minutes = (uptime_seconds % 3600) / 60;
        long seconds = uptime_seconds % 60;
        std::cout << hours << " hours " << minutes << " minutes " << seconds << " seconds" << std::endl;
    }
}

void print_user_info() {
    std::cout << "\nLogged-in User Information:" << std::endl;
    std::system("whoami");
}

int main() {
    print_cpu_info();
    print_memory_info();
    print_disk_usage();
    print_os_info();
    print_uptime();
    print_user_info();

    return 0;
}
