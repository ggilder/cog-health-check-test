from cog import BasePredictor, Input
import time


class Predictor(BasePredictor):
    def setup(self):
        self.prefix = "hello"

    def predict(self, text: str = Input(description="Text to prefix with 'hello '")) -> str:
        for _ in range(60):
            time.sleep(1)
        return self.prefix + " " + text
