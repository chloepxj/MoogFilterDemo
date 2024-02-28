### TODO (27.2)

# background

	moog history - I
	moog tech aspect - C
	biquad, nonlinearity (main reference summary) - J


The Moog ladder filter, conceived by Dr. Robert Moog in the 1960s, represents a landmark innovation in synthesizer technology. Its unique circuitry, characterized by a cascade of transistors and capacitors resembling a ladder, enabled the shaping of electronic sounds with warmth and richness. This filter quickly became integral to Moog's synthesizer designs, including the renowned Moog Modular and Minimoog instruments. Its ability to sculpt harmonic content imparted a distinct, organic quality highly sought after by musicians and sound designers. From progressive rock to electronic dance music, the Moog ladder filter's influence permeates diverse musical genres, contributing to its enduring legacy as a symbol of innovation and sonic exploration in electronic music production.

The circuit of the Moog Ladder Filter has four stage, each of which consists of two transistors and a capacitor. The input signal is fed into the first transistor stage, where it undergoes voltage-controlled amplification. As the signal passes through subsequent transistor stages, the capacitors coupled with each stage interact to create a cascading effect, gradually attenuating higher frequencies while allowing lower frequencies to pass through. This gradual roll-off of high frequencies gives the Moog ladder filter its characteristic smooth, musical sound. The filter's cutoff frequency is typically controlled by a voltage applied to the transistors, allowing for dynamic manipulation of the filter's response. Additionally, feedback loops within the circuit contribute to resonance effects, further enhancing the filter's versatility and sonic capabilities. 

biquad filter, second order IIR filter, as a common filter in audio signal processing, has strong performance. By adjusting the positions of the two zeros and two poles, the biquad filter can achieve different effects. At the same time, due to the presence of formants, it can also emphasize some specific frequency audio signals. At the same time, many analog audio devices (such as filters for analog synthesizers) have natural resonance properties. When simulating these devices in the digital domain, precisely controlling the resonance peak can help more realistically reproduce the sound characteristics of the analog device.

The nonlinear functions used in biquad filter can be divided into two categories according to their effects: hard saturating function and soft saturating fuction. Signals processed in a hard saturating process are quickly limited to a certain threshold after reaching it, and do not increase. This method will produce a significant clipping effect when the signal exceeds the saturation point, resulting in a more powerful, sharp sound effect. The hard saturating is smoother, the signal doesn't fade as quickly, and the resulting sound is warmer.

	
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
Linear system realizes the function of nonlinear system by adding nonlinear function. For linear systems, the method of analysis is very simple, because the signal we analyze is a discrete time signal, so we only need to ensure that all the poles are in the unit circle to ensure the stability of the system. For the linear part, all the poles of our filter satisfy this condition, as shown in Figure XX, so the linear part is stable. However, for nonlinear systems, due to the introduction of nonlinear functions, the system may meet the condition of stability of the poles, but still appear unstable. Then we need a new stability criterion to judge the stability of the whole system. According to the analysis of X, we need to divide the nonlinear system into nonlinear part and linear part. As for the whole non-detailed filter, the absolute value of the derivative of the nonlinear function is always less than 1 under the premise of satisfying linear stability. The three nonlinear functions we selected all satisfy this condition, as shown in Figure XX. At the same time, we can also use the Lyaplov stability criterion to judge whether a system is stable, but here it is too complicated. In our experiment, we chose to observe whether the audio signal processed by the filter is stable and there is no obvious distortion phenomenon to judge whether the filter is stable. In the audio we obtained, in addition to the infinite value of the file corresponding to the second and sixth filter structures, indicating that the second and sixth filters are unstable, all the other audio is clear and logical, and there is no obvious distortion, indicating that the other filters are stable in this case.
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




