class Generator(BaseGenerator):
    def data(self):

        probabilities = [
            1/2,
            1/4,
            1/6
        ]

        scenario_probability_A, scenario_probability_B = sample(probabilities, 2)

        scenario_options = {
            1/2: [
                {
                    "action": "a two-sided coin is flipped",
                    "result": "the coin comes up heads",
                },
                {
                    "action": "a two-sided coin is flipped",
                    "result": "the coin comes up tails",
                },
                {
                    "action": "a six-sided die is rolled",
                    "result": "the die has an even value",
                },
                {
                    "action": "a six-sided die is rolled",
                    "result": "the die has an odd value",
                },
                {
                    "action": "a pair of six-sided dice are rolled",
                    "result": "the dice pair has a sum at least 4 and at most 9",
                },
                {
                    "action": "a card is drawn from a standard 52-card deck",
                    "result": "the card is black",
                },
                {
                    "action": "a card is drawn from a standard 52-card deck",
                    "result": "the card is red",
                },
            ],
            1/4: [
                {
                    "action": "a pair of six-sided dice are rolled",
                    "result": "the dice pair has a sum of either 9 or 10",
                },
                {
                    "action": "a pair of six-sided dice are rolled",
                    "result": "the dice pair has a sum of either 4 or 5",
                },
                {
                    "action": "a card is drawn from a standard 52-card deck",
                    "result": "the card is a club",
                },
                {
                    "action": "a card is drawn from a standard 52-card deck",
                    "result": "the card is a spade",
                },
                {
                    "action": "a card is drawn from a standard 52-card deck",
                    "result": "the card is a diamond",
                },
                {
                    "action": "a card is drawn from a standard 52-card deck",
                    "result": "the card is a heart",
                },
            ],
            1/6: [
                {
                    "action": "a six-sided die is rolled",
                    "result": f"the die has a value of {randrange(1,7)}",
                },
                {
                    "action": "a pair of six-sided dice are rolled",
                    "result": "both dice are the same value",
                },
                {
                    "action": "a pair of six-sided dice are rolled",
                    "result": "the dice pair has a sum of 7",
                },
            ],
        }

        scenario_A = choice(scenario_options[scenario_probability_A])
        scenario_B = choice(scenario_options[scenario_probability_B])

        points_A, points_B = sample(range(1,5),2)

        games = [
            {
                "label": "A",
                "action": scenario_A["action"],
                "result": scenario_A["result"],
                "probability": scenario_probability_A,
                "points": points_A,
                "ev": scenario_probability_A*points_A,
            },
            {
                "label": "B",
                "action": scenario_B["action"],
                "result": scenario_B["result"],
                "probability": scenario_probability_B,
                "points": points_B,
                "ev": scenario_probability_B*points_B,
            },
        ]

        return {
            "games": games,
        }
