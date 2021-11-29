import 'dart:math';

import 'package:domain/domain.dart';

class JiztMockRepositoryImpl extends JiztRepository {
  final _summaries = [
    Summary(
      id: "1",
      source:
          "SpaceX announced Monday that it will fly a space tourism flight as early as the fourth quarter of this year, billing it as the first \"all-civilian\" mission to space.\nA tech entrepreneur named Jared Isaacman has financed the mission, named \"Inspiration4,\" and will serve as commander aboard the autonomous Crew Dragon spacecraft. Isaacman, 37, is a pilot rated to fly commercial and military aircraft, but he has no formal astronaut training. He is founder and chief executive officer of Shift4 Payments, a digital payments company.\n\"My passion for aviation and the dream of going to space has really been lifelong,\" Isaacman said during a news conference.\nIsaacman clearly wants to go to space, but he also intends the four-person mission to spread goodwill back on Earth. So he has committed to donating \$100 million to St. Jude Children’s Research Hospital and is raffling off one of the seats to US citizens who donate at least \$10 to the hospital. Another seat will go to a \"St. Jude ambassador,\" presumably chosen by the hospital. The final seat with be chosen via an entrepreneurial competition in collaboration with his company, Shift4 Payments.\n\"This is an important milestone toward enabling access to space for everyone,\" said Elon Musk in a call with reporters. \"Because, at first, things are very expensive, and it is only through missions like this that we're able to bring the cost down over time and make space accessible to all.\"\nThe announcement comes less than a week after Axiom Space announced the four crew members of its \"first private crew\" to visit the International Space Station. That Crew Dragon mission will be commanded by Axiom employee and former astronaut Michael López-Alegría, with three customers who are paying about \$55 million each to dock to the International Space Station for about eight days. Given that this \"Ax-1 mission\" is due to launch no earlier than January 2022, it seems likely that Isaacman's Inspiration4 mission will fly first.\nAccording to SpaceX, Isaacman and the Inspiration4 crew will undergo commercial astronaut training by the company on the Falcon 9 launch vehicle and Dragon spacecraft, including \"a specific focus on orbital mechanics, operating in microgravity, zero gravity, and other forms of stress testing.\" The multiday mission will launch from historic Launch Complex 39A at NASA’s Kennedy Space Center. As a \"free flyer\" mission, it will not dock with the International Space Station.\nThis second announced commercial mission for Crew Dragon sets up an extremely busy period for the program. Beginning with the Crew-1 mission for NASA in November 2020, SpaceX could fly as many as five crewed missions during a 15-month period, including three human spaceflights for NASA.\nThis also appears to bode well for SpaceX's efforts to use Crew Dragon for more than just NASA missions, suggesting there may be a market for orbital tourism in which going into orbit around Earth is a destination in and of itself.",
      model: SummaryModel.t5,
      params: SummaryParams(),
      output:
          "SpaceX will fly its first all-civilian mission as early as the fourth quarter this year. The Inspiration4 mission was funded by Jared Isaacman, a tech entrepreneur who will serve as commander on the mission. Isaacman intends to use the mission to spread goodwill back on Earth. He will donate \$100 million to St. Jude Children's Research Hospital, raffling off one of the four seats on the mission to a US citizen who donates at least \$10 to the hospital. The crew will need to undergo training before the mission. It is the second announced commercial mission for SpaceX's Crew Dragon.",
      status: SummaryStatus.completed,
      startedAt: DateTime.now().subtract(Duration(hours: 60)),
      endedAt: DateTime.now().subtract(Duration(hours: 60)),
    ),
    Summary(
      id: "2",
      source:
          "Transparent wood just got even better, moving us a step closer to windows that are far better insulators than traditional glass ones.\nThe standard process for making wood transparent typically involves soaking the wood in a vat of sodium chlorite – a chemical compound used in some bleaches and toothpastes – to remove a structural component of the wood called lignin. However, this takes a lot of chemicals, produces liquid waste that is tough to recycle and can weaken the wood.\nLiangbing Hu at the University of Maryland and his colleagues came up with a method that modifies the lignin instead of removing it completely. It is quicker and uses fewer materials than the standard lignin-removal process, and also leaves the wood stronger.\nThe researchers’ method stems from the recent discovery that lignin can be made transparent by removing only the parts of its molecules that give them their colour. They brushed hydrogen peroxide, which is often used as a disinfectant, over the surface of the wood and then left it under a UV lamp designed to simulate natural sunlight. After soaking the wood in ethanol to remove any remaining gunk, they filled the pores in the wood with clear epoxy, a step that is also part of making lignin-free transparent wood.\nThe final product is a piece of wood that allows more than 90 per cent of light to pass through it and is more than 50 times stronger than transparent wood with the lignin completely removed. “The transparent wood is lighter and stronger than glass. It could be used for load-bearing windows and roofs,” says Hu. “It can be potentially used to make a see-through house.”",
      model: SummaryModel.t5,
      params: SummaryParams(),
      output:
          "Transparent wood is usually created by removing a structural component of the wood called lignin. A team of researchers has come up with a method of creating transparent wood by modifying the lignin without removing it completely. The technique produces wood that allows more than 90 percent of light to pass through it and is 50 times stronger than wood with the lignin removed. It is lighter and stronger than glass, and it could be potentially used to make a see-through house.",
      status: SummaryStatus.completed,
      startedAt: DateTime.now().subtract(Duration(hours: 50)),
      endedAt: DateTime.now().subtract(Duration(hours: 50)),
    ),
    Summary(
      id: "3",
      source:
          "The deep-sea oil and gas industry has a vast and costly infrastructure to maintain. Wells, other equipment, and thousands of kilometers of pipeline must be installed, inspected and repaired.\nNow, cutting-edge underwater drones and robots are being developed that could make the work safer, cheaper and less polluting.\nAmong them is Eelume, a six-meter-long, snake-like robot kitted out with sensors and a camera at each end. It can be kept at a docking station at depths up to 500 meters (547 yards) for six months, without being brought back to the surface.\nThe self-propelling robot can travel up to 20 kilometers (12.4 miles) before needing to return to its station to recharge. It can also swap out parts for different tasks, including tools to operate subsea valves, and cleaning brushes to remove marine growth and sediments.\nMaintenance work at many deep-water wells and pipeline systems is already carried out by unmanned vehicles. But these vehicles typically need to be transported to the offshore site on a fully crewed ship and then remotely operated from onboard the surface vessel. That can cost up to \$100,000 per day, according to Pål Liljebäck, chief technology officer with Eelume Subsea Intervention, which developed the robot.\nBased in Trondheim, Norway, the company was spun off from the Norwegian University of Science and Technology. Liljebäck says that by \"enabling the robot to become a subsea resident living in a docking station, it can be mobilized at any time to do inspections and intervention tasks, and thereby reducing the need for costly surface vessels.\"\nEelume can work autonomously on tasks assigned from a control room onshore, and send back video and data. Its snake-like design allows it to work in confined spaces and wriggle its body to stay in place in strong currents. By docking under the sea, it can be deployed whatever the conditions on the surface of the ocean.",
      model: SummaryModel.t5,
      params: SummaryParams(),
      output:
          "Eelume is a six-meter-long snake-like robot that will make deep-sea oil and gas operations safer, cheaper, and less polluting. It can be kept at a docking station at depths of up to 500 meters for six months, travel up to 20 kilometers between charges, and it has parts that can be swapped out for different tasks. Eelume can work autonomously in confined spaces and send back video and data. The global underwater robotics market is expected to be worth around \$7 billion in 2025. A 3-minute video that features the robot is available in the article.",
      status: SummaryStatus.completed,
      startedAt: DateTime.now().subtract(Duration(hours: 2)),
      endedAt: DateTime.now().subtract(Duration(hours: 2)),
    ),
    Summary(
      id: "4",
      source:
          "Elon Musk, the founder of Tesla, SpaceX, and many other companies, has mastered the art of using Twitter to harness fans and promote himself and his interests across as wide an audience as possible. Using some of that momentum, last night he made a vocal debut on a newer platform — Silicon Valley’s hottest startup right now, Clubhouse, which lets people join rooms to listen in on conversations between hosts and guests.\nMusk, fielding a series of mostly softball questions, used the session to “talk to his base” on topics ranging from space travel, colonies on Mars, crypto, AI and Covid-19 vaccines.\nHe managed to bust a few myths about his “alternative” positions on several subjects, and at times managed to sound far more nuanced than his meme-propelled, trolling Twitter feed. For example, in contrast to previous expositions on the viability of living on Mars, Musk didn’t paint a rose-colored vision in his conversation. Instead, he said that while Mars exploration is a worthwhile effort to keep humankind alive, life would be hard.\nThe last quarter of the interview then veered off radically when Vlad Tenev, CEO of Robinhood, was brought in (apparently by Musk, but there was a hint of co-ordination behind the scenes).\nSuddenly, Musk turned interviewer and had Tenev unpack what had happened in the last week with the Wall Street Bets debacle.\nSome saw the Clubhouse room as a massive PR stunt by the VC firm Andreessen Horowitz — which, in addition to being a big investor in Robinhood and Clubhouse, backs startups that work with Musk’s companies.\nWith more than 5,000 people in the room (breaking Clubhouse’s previously maintained limits), hundreds of journalists and live streams on YouTube, we did get a little taste of how A16Z’s new media efforts — which effectively seek to disintermediate journalists in the public discourse about technology — might work.\nAnd from the looks of events like last night’s, like it or leave it, for now at least, it’s a part of the mix.",
      model: SummaryModel.t5,
      params: SummaryParams(),
      output:
          "Elon Musk recently made a debut on Clubhouse, a platform that lets people join rooms to listen in on conversations between hosts and guests. He talked on a range of topics, including space travel, colonies on Mars, crypto, AI, and Covid-19 vaccines. Musk also interviewed Robinhood CEO Vlad Tenev. More than 5,000 people viewed the stream on Clubhouse, breaking the service's previously maintained limits. Links to recordings of the stream are available in the article.",
      status: SummaryStatus.completed,
      startedAt: DateTime.now().subtract(Duration(minutes: 20)),
      endedAt: DateTime.now().subtract(Duration(minutes: 20)),
    ),
    Summary(
      id: "5",
      source:
          "Today is the third anniversary of quitting my job at Google to build my own software business. I posted updates at the end of my first and second years, so it’s time to share my progress.\nThe year things clicked into place\nIn my first two years working for myself, I earned less than \$10k total. My goal for the third year was to earn \$20k in revenue.\nHalfway through the year, it looked like I’d fall short. My businesses collectively generated about \$300/month, and none of my new ideas were working.\nMiraculously, one new product in May turned everything around. By the end of the year, I earned \$63k in revenue, far exceeding my goal.\nOkay, my net profits are still negative, but this time I have a good excuse!\nI sell a physical product now, so my income lags my expenses by two or three months. My profit margins are 30-50% per sale, so the numbers will catch up eventually.\nFor the past few years, I’ve done all my software development on a home server. It works great, except for when I screw up the network configuration or want to install a new operating system. My server has no monitor or keyboard attached, so I have to drag it over to my desk, swap all the cables with my workstation, and then swap everything back when I’m done.\nI’d read that a Raspberry Pi could masquerade as a USB keyboard, and I knew it could capture video. What if a web app combined those two features and transformed the Pi into a miniature remote administration device?\nAfter a few months of tinkering, I had a working prototype.\nI questioned whether there was a market for this. Why would anyone buy this device from me? It was just a collection of widely available hardware components. Maybe one or two customers per week would purchase, so if I made \$80 per kit, it would be worth my time packing and shipping orders.\nThen, I published a blog post about it.\nImmediately, it became clear that this business was different than anything I’d ever done before. Less than four hours after the blog post went live, customers had purchased all nine kits from my inventory, and they kept buying even when it was backordered.\nWithin a week, the blog post had driven \$8.8k in sales. It reached the front page of Hacker News and became one of the top “Show HN” posts of all time.\nThere was a drop in sales after that initial spike, but TinyPilot has been growing consistently ever since. I had zero experience selling a physical product, so I quickly learned how to manage inventory, systematize the order fulfillment process, and work with vendors to make circuit boards and 3D-printed cases.\nTinyPilot ended the year with almost \$54k in revenue. My net income is still negative, but it’s because my costs are front-loaded. TinyPilot’s expenses for 2020 include inventory to last through February 2021.",
      model: SummaryModel.t5,
      params: SummaryParams(),
      output:
          "In the first two years of working on his own business, Michael Lynch earned less than \$10k total. His goal for the third year was to earn \$20k, but he exceeded the goal by earning \$63k in revenue by the end of the year. This article follows his projects throughout the third year, documenting the successes, failures, and lessons learned.",
      status: SummaryStatus.completed,
      startedAt: DateTime.now(),
      endedAt: DateTime.now(),
    )
  ];

  @override
  Future<void> deleteSummary(String id) async {
    return;
  }

  @override
  Future<List<Summary>> getAllSummaries() async {
    return _summaries;
  }

  @override
  Future<Summary> getSummary(String id) async {
    return _summaries.last;
  }

  @override
  Future<Summary> requestSummary(SummaryRequest request) async {
    return Summary(
      id: Random().nextDouble().toString(),
      source:
          "Today is the third anniversary of quitting my job at Google to build my own software business. I posted updates at the end of my first and second years, so it’s time to share my progress.\nThe year things clicked into place\nIn my first two years working for myself, I earned less than \$10k total. My goal for the third year was to earn \$20k in revenue.\nHalfway through the year, it looked like I’d fall short. My businesses collectively generated about \$300/month, and none of my new ideas were working.\nMiraculously, one new product in May turned everything around. By the end of the year, I earned \$63k in revenue, far exceeding my goal.\nOkay, my net profits are still negative, but this time I have a good excuse!\nI sell a physical product now, so my income lags my expenses by two or three months. My profit margins are 30-50% per sale, so the numbers will catch up eventually.\nFor the past few years, I’ve done all my software development on a home server. It works great, except for when I screw up the network configuration or want to install a new operating system. My server has no monitor or keyboard attached, so I have to drag it over to my desk, swap all the cables with my workstation, and then swap everything back when I’m done.\nI’d read that a Raspberry Pi could masquerade as a USB keyboard, and I knew it could capture video. What if a web app combined those two features and transformed the Pi into a miniature remote administration device?\nAfter a few months of tinkering, I had a working prototype.\nI questioned whether there was a market for this. Why would anyone buy this device from me? It was just a collection of widely available hardware components. Maybe one or two customers per week would purchase, so if I made \$80 per kit, it would be worth my time packing and shipping orders.\nThen, I published a blog post about it.\nImmediately, it became clear that this business was different than anything I’d ever done before. Less than four hours after the blog post went live, customers had purchased all nine kits from my inventory, and they kept buying even when it was backordered.\nWithin a week, the blog post had driven \$8.8k in sales. It reached the front page of Hacker News and became one of the top “Show HN” posts of all time.\nThere was a drop in sales after that initial spike, but TinyPilot has been growing consistently ever since. I had zero experience selling a physical product, so I quickly learned how to manage inventory, systematize the order fulfillment process, and work with vendors to make circuit boards and 3D-printed cases.\nTinyPilot ended the year with almost \$54k in revenue. My net income is still negative, but it’s because my costs are front-loaded. TinyPilot’s expenses for 2020 include inventory to last through February 2021.",
      model: SummaryModel.t5,
      params: SummaryParams(),
      status: SummaryStatus.completed,
      output:
          "In the first two years of working on his own business, Michael Lynch earned less than \$10k total. His goal for the third year was to earn \$20k, but he exceeded the goal by earning \$63k in revenue by the end of the year. This article follows his projects throughout the third year, documenting the successes, failures, and lessons learned.",
      startedAt: DateTime.now().subtract(Duration(seconds: 10)),
      endedAt: DateTime.now(),
    );
  }

  @override
  Stream<List<Summary>> streamAllSummaries() async* {
    yield _summaries;
  }
}
