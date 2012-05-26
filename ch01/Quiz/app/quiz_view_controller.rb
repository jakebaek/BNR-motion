class QuizViewController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor

    @questions = ['What is 7+7', 'What is the capital of Vermont?', 'From what is cognac made?']
    @answers = ['14', 'Montpelier', 'Grapes']
    @currentQuestionIndex = 0

    rectClient = view.bounds
    @questionLabel = UILabel.alloc.initWithFrame([[0, 0], [rectClient.size.width, 50]])
    @questionLabel.text = @questions[@currentQuestionIndex]
    view.addSubview(@questionLabel)

    @questionButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @questionButton.setTitle('Show Question', forState:UIControlStateNormal)
    @questionButton.addTarget(self, action:'onClickedQuestionButton', forControlEvents:UIControlEventTouchUpInside)
    @questionButton.frame = [[0, 50], [rectClient.size.width, 50]]
    view.addSubview(@questionButton)

    @answerLabel = UILabel.alloc.initWithFrame([[0, 200], [rectClient.size.width, 50]])
    @answerLabel.text = '???'
    view.addSubview(@answerLabel)

    @answerButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @answerButton.setTitle('Show Answer', forState:UIControlStateNormal)
    @answerButton.addTarget(self, action:'onClickedAnswerButton', forControlEvents:UIControlEventTouchUpInside)
    @answerButton.frame = [[0, 250], [rectClient.size.width, 50]]
    view.addSubview(@answerButton)
  end

  def onClickedQuestionButton
    @currentQuestionIndex += 1
    @currentQuestionIndex = 0 if @currentQuestionIndex == @questions.count

    @questionLabel.text = @questions[@currentQuestionIndex]
    @answerLabel.text = '???'
  end

  def onClickedAnswerButton
    @answerLabel.text = @answers[@currentQuestionIndex]
  end
end