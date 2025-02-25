#include <fstream>
#include <iostream>

int main() {
	std::ifstream inp("BADAPPLE.txt");
	std::ofstream out("baAsm.txt");
	int x, y;
	while (inp >> y >> x) {
		if (x == -1 || y == -1) {
			out << std::dec << -1 << ", ";
			continue;
		}
		out << "0x" << std::hex << 0xA0000+y*16*80+20+x << ", ";
	}
}
