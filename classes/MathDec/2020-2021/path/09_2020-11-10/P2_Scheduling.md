INPUT: 
- Estimated delivery calendar for raw materials. In practice, it's a list of couples (idMaterial, Date)
Date: the time in the future at which the raw material will arrive
- A description of raw materials. Each material has a processing priority (depending on quality/rarity) and a list of compatibilities. Compatibilities refers to the possibility of combining batch to maximizes utilization. Every raw material has requirements in terms of processing times. 
- A list of workstations/machines. Each work station/machine accepts and can process some types of raw materials. Each workstation has a type and a capacity (expressed in terms of weight or volume)

PROBLEM: can we, with the machinery we have, process successfully all the materials in the delivery calendar? In other words, is the plant sized sufficiently?

OUTPUT:
- Yes/no: satisfiability. Is the set of workstations capable of processing all the raw materials delivered, while satisfying constraints? 
- If yes: what is the residual capacity of the machines? The input delivery calendar is an estimate based on past experience, and is subject to variations in practice. We need to assess the operational margins. 
- A scheduling of the machines/workstations for the estimated delivery calendar. 

MANY MORE CONSTRAINTS to add to bring the problem description closer to the real problem:

- For example: a workstation X can process materials of type {A, B, C, D}. In order to process material A after processing material B, machine X requires a treatment with a cost and a duration.  
- Currently the task is handled manually. The task is discretized in 1-day intervals fr convenience. Nothing prevents scheduling hour-by-hour or in blocks of few hours. 
- Materials have compatibility requirements and tolerance thresholds. For example: material D is not compatible with materials A, B. If a batch of material D is delivered while materials A and B are being processed in a workstation, D can be mixed it if in a proportion of less than 5\% of the resulting mixture. There are costs associated to this operation, which need modeling. 
- Many other details characterize machines and types of products.  
- For an idea of scale: the calendar spans anywhere between 20 days and 2 months. Raw materials come in approximately 10 types. The number of machines in a plant is from 10 minimum to a few hundred.