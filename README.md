# neuron
![GitHub repo size](https://img.shields.io/github/repo-size/wwood-dev/neuron)
![GitHub all releases](https://img.shields.io/github/downloads/wwood-dev/neuron/total)
![Bitbucket open issues](https://img.shields.io/bitbucket/issues/wwood-dev/neuron)
![Bitbucket open pull requests](https://img.shields.io/bitbucket/pr-raw/wwood-dev/neuron)



![Neuron](https://i.ibb.co/4mFJXVw/19png.png)



## Description ##

The NeuronMain product is designed to control peripheral devices that use simple low-speed interfaces or slowly changing signals. The board uses the following CMOS signal levels: + 3V – "1" and 0V – "0".

The board has 136 digital contacts capable to operate for both sending a pre-set level and receiving it (switching is carried out in real-time from a computer). The signal switching frequency is up to 290 times per second at an RS-232 exchange rate of 115,200 baud, and it is limited by the RS-232 interface throughput, that is, when using controllers with a higher transmission rate, the maximum signal switching frequency will multiply. ADC/DAC that uses a parallel code can be connected to some of the digital contacts to obtain the ability to send or receive analog signals.

The Cyclone IV E EP4CE10F17C8 programmable logic device (PLD) is applied to the board. The project for the PLD is developed in the Intel (Altera) Quartus 11 environment; any version of this environment that supports the specified PLD can be used for compilation.



## Project files: ##

\DevBD\ is a folder with Quartus 11 project for the PLD board. It contains Quartus service files generated during the operation, as well as the following custom ones:
>async.v – приёмопередатчик RS, реализация fpga4fun.com & KNJN LLC
SignalDistributor.v – модуль, выполняющий побайтовый приём и отправку данных по RS и управление сигнальными контактами платы
fifo1.qip – файл мегафункции Altera FIFO
PLL.qip – файл мегафункции Altera PLL
\output_files\ – папка с файлами-результатами компиляции. В неё помещается файл для программирования ПЛИС.
\COMArbitrary\ – папка с проектом VB.NET программы для отправки и приёма данных через RS-232, использовалась при отладке платы.
















NEURON firmware for communicate pc->plis
