### TODO (27.2)

# background

	moog history - I
	moog tech aspect - C
	biquad, nonlinearity (main reference summary) - J
	
# implementation

	different topologies (switch in code) - Ivan	
	stability testing (simple, advanced) - Jerry
	
# exp & res

	stable topologies and their differences in timbre & magnitude freq responses - Chloe
	
# individual contrib
	
	research - all
	testing - all
	code - all
	stability testing theory - J
	plugin (source code tweaking & demonstrating) short description - C
	presentation - I
	report - all

# conclusion
In this paper, we develop a variety of filter structures to observe the effect of different nonlinear module locations and different nonlinear functions on the overall audio signal processing. By changing the position of the nonlinear module, we introduce two different filters as a whole: the nonlinear biquad filter and the nonlinear feedback filter and show their different effects by processing the same audio.

The position of different nonlinear modules can make a great difference in the processing of sound and can affect the stability of the whole system. In 9 kinds of filter structures, we find that the whole filter system is unstable when the nonlinear module is placed in the second-order feedback signal, but its poles are still all in the unit circle. This shows that the introduction of nonlinear parameters influences the stability of the filter.

Different nonlinear functions produce different effects on audio. Under the premise of ensuring the stability of the filter, we test three different nonlinear functions to ensure that the absolute value of their slopes is less than or equal to 1. Among them, the effect produced by the tanh function and the soft function is relatively soft, while the effect produced by the hard function is strong and powerful.

In future research on this topic, we can focus on the processing efficiency of different filter structures as well as the applicable audio. At the same time, we can further explore the effect of the position of the nonlinear module on the stability of the filter system.

	conclusion from main ref
	our conclusion bla

# appendix
	raw code
	sample list
	
* anything else worthwile reporting on under any section according to presentation slides each of us presented. write a paragraph (+ figures etc.)




