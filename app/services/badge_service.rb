class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test 
    @test_passages = @user.test_passages
  end
  
  def call
    # Badge.select { |badge| send("#{badge.rule}?", badge) }
    Badge.select do |badge|
      @user.badges << badge
    end
  end

  private
  def success_category?(badge)
    return unless @test.category_id == badge.parameter.to_i && @test_passage.passed?
    user_badge = UserBadge.assigned_badges(@user, badge).last
    @test_passages = @test_passages.where(created_at: user_badge.created_at..Time.current.utc) if user_badge
    category_test = Test.by_category(badge.parameter.to_i)
    passed_tests = @test_passages.passed.joins(:test).where("tests.category_id": @test.category_id )
    category_test.pluck(:id).sort == passed_tests.pluck(:test_id).uniq.sort
  end

  def success_all_level?(badge)
    return unless @test.level == badge.parameter.to_i && @test_passage.passed?
    user_badge = UserBadge.assigned_badges(@user, badge).last
    @test_passages = @test_passages.where(created_at: user_badge.created_at..Time.current.utc) if user_badge
    level_tests = Test.level(@test.level)
    passed_tests = @test_passages.passed.joins(:test).where("tests.level", @test.level )
    level_tests.pluck(:id).sort == passed_tests.pluck(:test_id).uniq.sort
  end

  def success_on_first_try?(badge)
    return unless @test_passage.passed?
    @user.tests.where(id: @test.id).count == 1
  end

end