import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:dio/dio.dart';
import 'home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';  // Import dotenv

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gemini Chat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),  // Set HomeScreen as the home
    );
  }
}
class MyChatPage extends StatefulWidget {
  const MyChatPage({Key? key}) : super(key: key);

  @override
  _MyChatPageState createState() => _MyChatPageState();
}

class _MyChatPageState extends State<MyChatPage> {
  final ChatUser user = ChatUser(
    id: 'user1',
    firstName: 'User',
    lastName: 'Example',
  );

  List<ChatMessage> messages = [];

  void _handleSend(ChatMessage message) {
    setState(() {
      messages.insert(0, message); // Add message to chat
    });
    _sendToGemini(message.text);
  }

  void _sendToGemini(String userInput) async {
    var dio = Dio();
    String apiKey = dotenv.env['API_KEY'] ?? "NO_API_KEY_FOUND";  // Retrieve API key from environment variables

    var data = {
      "contents": [
        {
          "role": "user",
          "parts": [
            {
              "text": "Write a fantasy story set in a dystopian future. Mix Sci-Fi and fantasy elements"
            }
          ]
        },
        {
          "role": "model",
          "parts": [
            {
              "text": "## Dystopian Fantasy Plot Outline:\n\n**Setting:** A futuristic city enclosed within a massive dome, isolating its inhabitants from the desolate wasteland outside. Technology and magic coexist, though magic is outlawed and practiced in secret. \n\n**Characters:**\n\n* **Elara:** A young woman skilled in forbidden magic, living in the city's underbelly and fighting for survival. \n* **Kai:** A tech-savvy smuggler operating within the city's black market, disillusioned with the ruling regime.\n* **Commander Cyrus:**  The ruthless leader of the city guard, obsessed with maintaining order and eradicating magic.\n* **Anya:**  An enigmatic elder and leader of the hidden magic practitioners, guiding Elara in her powers.\n\n**Plot:**\n\n1. **Introduction:**  Introduce Elara, showcasing her magical abilities and the oppressive atmosphere of the city. Establish the stark contrast between the privileged citizens within the dome and the outcasts struggling to survive outside.\n2. **Meeting of Paths:**  Elara and Kai cross paths during a black-market deal gone wrong. They are forced to cooperate to escape the city guard, discovering a shared desire for freedom and rebellion.\n3. **Unveiling the Truth:** Elara learns about the history of the dome, the reasons behind the magic ban, and the truth of the wasteland beyond. This knowledge fuels her determination to challenge the established order. \n4. **Rebellion Brews:** Elara and Kai, guided by Anya, gather allies from both the magical community and the disillusioned citizens. They plan a rebellion against Commander Cyrus and his regime.\n5. **Confrontation and Sacrifice:** The rebellion faces off against the city guard in a climactic battle.  Anya sacrifices herself to protect Elara, unlocking the full potential of her magic.\n6. **Breaking the Dome:**  Elara uses her enhanced magic to shatter the dome, exposing the city to the outside world. This act symbolizes freedom and the potential for a new future. \n7. **Uncertain Future:**  The story ends with the city exposed to the wasteland, leaving an open ending for the characters and society to rebuild and navigate the unknown. \n\n**Themes:**\n\n* **Oppression vs. Freedom:** The story explores the struggle against a tyrannical regime and the fight for individual liberty.\n* **Magic vs. Technology:** The conflict between the natural forces of magic and the artificial advancements of technology drives the narrative.\n* **Hope and Sacrifice:** Despite the bleak setting, the story emphasizes the power of hope and the willingness to sacrifice for a better future.\n* **Environmental Consequences:** The dystopian setting serves as a cautionary tale about environmental destruction and the need for sustainable living. \n* **Found Family:** The bond forged between Elara, Kai, and their allies highlights the importance of community and found family in times of hardship."
            }
          ]
        },
        {
          "role": "user",
          "parts": [
            {
              "text": "Write a political drama about an ambitious man's rise to power and demise"
            }
          ]
        },
        {
          "role": "model",
          "parts": [
            {
              "text": "## Political Drama Plot Outline:\n\n**Setting:** A contemporary nation grappling with economic instability and social unrest.\n\n**Characters:**\n\n* **Adrian Vance:** A charismatic and ambitious politician with a ruthless drive for power.\n* **Olivia Carlisle:** A seasoned journalist with unwavering integrity, determined to expose Adrian's true nature.\n* **Senator William Thornton:** A veteran politician and Adrian's mentor, initially supportive but increasingly wary of his protégé's methods.\n* **Evelyn Vance:** Adrian's wife, caught between loyalty to her husband and her own moral compass.\n* **Marcus Hayes:** A young, idealistic campaign strategist who becomes disillusioned by Adrian's tactics.\n\n**Plot:**\n\n1. **A Rising Star:**  Introduce Adrian Vance, a charismatic politician captivating the public with promises of change and prosperity. Showcase his early victories and growing popularity.\n2. **The Price of Power:** As Adrian climbs the political ladder, he resorts to increasingly manipulative tactics, forging alliances with questionable individuals and compromising his integrity. Olivia Carlisle begins investigating his past, uncovering secrets he desperately wants to keep hidden. \n3. **Inner Circle Conflicts:**  Tensions rise within Adrian's team as Marcus Hayes questions his ethical boundaries, leading to a clash of ideals. Senator Thornton, witnessing Adrian's descent into ruthlessness, attempts to guide him back on track but faces resistance.\n4. **Personal Sacrifices:**  Evelyn, aware of her husband's transgressions, struggles with her own conscience and the potential impact on their family. She becomes a pivotal figure, torn between protecting her husband and upholding her own values. \n5. **Exposure and Downfall:**  Olivia's investigation reaches a climax, exposing Adrian's corruption and manipulation to the public. His carefully constructed image crumbles, leading to public outrage and calls for his resignation.\n6. **Betrayal and Loss:**  Facing the consequences of his actions, Adrian is abandoned by his allies and supporters. Marcus testifies against him, leading to his ultimate downfall. \n7. **Reflection and Consequences:**  The story concludes with Adrian grappling with the wreckage of his ambition, exploring themes of regret, redemption, and the true cost of power.\n\n**Themes:**\n\n* **Corruption and Morality:** The narrative delves into the murky world of politics, exploring the temptations of power and the erosion of moral principles.\n* **Ambition and its Consequences:** The story examines the destructive nature of unchecked ambition and its impact on individuals and those around them.\n* **Truth and Deception:** The conflict between Olivia's pursuit of truth and Adrian's web of lies drives the central tension of the plot.\n* **Loyalty and Betrayal:** The shifting loyalties of the characters highlight the complex dynamics of relationships in the political arena. \n* **Redemption and Forgiveness:**  The ending leaves room for reflection on the possibility of redemption and the challenges of forgiveness in the face of betrayal."
            }
          ]
        },
        {
          "role": "user",
          "parts": [
            {
              "text": "Write a story of a boy lost at sea, with an odd companion"
            }
          ]
        },
        {
          "role": "model",
          "parts": [
            {
              "text": "## Lost at Sea: An Odd Companionship\n\n**Setting:** A vast, endless ocean after a violent storm.\n\n**Characters:**\n\n* **Finn:** A young boy, around 12 years old, resourceful and resilient but terrified after being separated from his family in the storm. \n* **Coral:** A sentient, giant sea turtle with a wise and calming demeanor, possessing an ancient knowledge of the ocean. \n* **The Storm Spirit:**  A mischievous and unpredictable entity, personifying the storm that caused Finn's misfortune. It appears as a swirling mass of wind and water, capable of both hindering and helping Finn. \n\n**Plot:**\n\n1. **Adrift and Alone:**  The story opens with Finn clinging to debris after his family's boat is destroyed in the storm. He is lost, alone, and fearing for his life. \n2. **An Unexpected Friend:**  As despair sets in, Finn encounters Coral, the giant sea turtle. Initially startled, Finn soon finds comfort in Coral's presence and wisdom. Coral assures him he is not alone and promises to help him find his way back home.\n3. **The Unseen Force:**  The Storm Spirit, responsible for Finn's predicament, lurks around them. It toys with Finn, sometimes creating obstacles, other times offering cryptic clues to guide his journey.\n4. **Survival at Sea:** Finn and Coral face challenges of hunger, thirst, and exposure to the elements. Finn learns to rely on his resourcefulness and Coral's guidance to survive. They encounter other sea creatures, some friendly, some dangerous, adding to the adventure.\n5. **Lessons Learned:**  Through their journey, Coral imparts ancient wisdom about the sea, life, and resilience. Finn learns valuable lessons about courage, hope, and respect for nature. \n6. **Facing the Storm:**  The Storm Spirit presents a final challenge, testing Finn's newfound strength and courage. With Coral's encouragement, Finn confronts the spirit and earns its respect, finally understanding its role in his journey. \n7. **A Hopeful Return:**  The Storm Spirit, appeased by Finn's resilience, guides them towards land.  Finn and Coral reach the shore, where he is eventually reunited with his family. He carries the lessons learned and the memory of his extraordinary friendship with Coral.\n\n**Themes:**\n\n* **Survival and Resilience:** The story explores the human spirit's ability to persevere in the face of adversity and overcome seemingly insurmountable challenges.\n* **Friendship and Companionship:** The bond between Finn and Coral highlights the importance of companionship and support in times of hardship, even from unexpected sources.\n* **Respect for Nature:** Finn's journey instills in him a deep respect for the power and mystery of the natural world, particularly the ocean.\n* **Facing Your Fears:** Finn's encounter with the Storm Spirit represents the conquering of his own fear and anxieties, leading to personal growth.\n* **Hope and Wonder:** Despite the perilous situation, the story maintains a sense of wonder and hope, emphasizing the beauty and magic of the natural world."
            }
          ]
        },
        {
          "role": "user",
          "parts": [
            {
              "text": userInput
            }
          ]
        }
      ],
      "generationConfig": {
        "temperature": 1,
        "topK": 0,
        "topP": 0.95,
        "maxOutputTokens": 8192,
        "stopSequences": []
      },
      "safetySettings": [
        {
          "category": "HARM_CATEGORY_HARASSMENT",
          "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        },
        {
          "category": "HARM_CATEGORY_HATE_SPEECH",
          "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        },
        {
          "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
          "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        },
        {
          "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
          "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        }
      ]
    };

    try {
      var response = await dio.post(
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro-latest:generateContent?key=$apiKey",
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: data
      );

      // More robust error handling
      if (response.data != null && response.data['candidates'] != null && response.data['candidates'].isNotEmpty) {
        var candidate = response.data['candidates'][0];
        if (candidate != null && candidate['content'] != null && candidate['content']['parts'] != null && candidate['content']['parts'].isNotEmpty) {
          var part = candidate['content']['parts'][0];
          if (part != null && part['text'] != null) {
            _handleResponse(part['text']);
          } else {
            _handleResponse("No text found in part.");
          }
        } else {
          _handleResponse("Content parts are missing or empty.");
        }
      } else {
        _handleResponse("Received an unexpected or empty response.");
      }
    } catch (e) {
      _handleResponse("Failed to get response: $e");
    }
  }


  void _handleResponse(String text) {
    ChatMessage message = ChatMessage(
      text: text,
      user: ChatUser(
        id: 'gemini',
        firstName: 'Creative ',
        lastName: 'Assistant',
      ),
      createdAt: DateTime.now(),
    );
    setState(() {
      messages.insert(0, message); // Add Gemini's response to chat
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creativo'),
      ),
      body: DashChat(
        currentUser: user,
        onSend: _handleSend,
        messages: messages,
        inputOptions: InputOptions(
          inputToolbarPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        ),
        messageOptions: MessageOptions(
          messagePadding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}