class Generator(BaseGenerator):
    def data(self):
        actions = [
            "a two-sided coin is flipped",
            "a six-sided die is rolled",
            "a pair of six-sided dice are rolled",
            "a card is drawn from a standard 52-card deck",
        ]
        # pick two actions, not both about dice
        actionIndices = sample([0,choice([1,2]),3],2)

        probabilities = [
            1/2,
            1/4,
            1/6
        ]

        scenarioProbabilities = sample(probabilities)

        return {
            "sum": (a*x^p).add(b*x^p,hold=True),
            "result": (a+b)*x^p,
        }
