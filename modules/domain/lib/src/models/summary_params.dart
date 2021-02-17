class SummaryParams {
  /// The maximum length of the summary to be generated, relative to the length of the original text.
  final double relativeMaxLength;

  /// The minimum length of the summary to be generated, relative to the length of the original text.
  final double relativeMinLength;

  /// Whether or not to use sampling. If set to false greedy decoding is used.
  final bool doSample;

  /// Whether or not to stop the beam search when at least num_beams sentences are finished per batch or not.
  final bool earlyStopping;

  /// Number of beams for beam search. If set to 1 no beam search is performed. The higher the number, the longer the summary will take to be generated, but its quality will likely be better.
  final int numBeams;

  /// The value used to module the next token probabilities.
  final int temperature;

  /// The number of highest probability vocabulary tokens to keep for top-k-filtering.
  final int topK;

  /// If set to less than 1, only the most probable tokens with probabilities that add up to top_p or higher are kept for generation.
  final int topP;

  /// The parameter for repetition penalty. If set to 1.0 there is no penalty.
  final int repetitionPenalty;

  /// Exponential penalty to the length. If set to 1.0 there is no penalty.
  /// - Values < 1.0 encourage the model to generate shorter summaries.
  /// - Values > 1.0 encourage the model to produce longer summaries.
  final int lengthPenalty;

  /// If set to greater than 0, all n-grams of that size can only occur once.
  final int noRepeatNgramSize;

  SummaryParams({
    this.relativeMaxLength,
    this.relativeMinLength,
    this.doSample,
    this.earlyStopping,
    this.numBeams,
    this.temperature,
    this.topK,
    this.topP,
    this.repetitionPenalty,
    this.lengthPenalty,
    this.noRepeatNgramSize,
  });
}
