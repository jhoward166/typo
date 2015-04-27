require 'spec_helper'
describe Admin::ContentController do
    render_views
    describe 'with admin connection' do
        before do
            Factory(:blog)
            Profile.delete_all
            @user = Factory(:user, :text_filter => Factory(:markdown), :profile => Factory(:profile_admin, :label => Profile::ADMIN))
            @user.editor = 'simple'
            @user.save
            @article1 = Factory(:article, :body => "Example")
            @article2 = Factory(:article, :body => "Hello")
            comment1 = Factory(:comment, :article => @article1)
            comment2 = Factory(:comment, :article => @article2)
            request.session = { :user => @user.id }
        end
        describe 'merge articles' do
            it 'should not merge bodies if same article' do
                article1 = @article1
                article2 = @article1
                previous_content1 = article1.body
                previous_content2 = article2.body
                post :merge_articles, 'id' => article2.id, 'merge_with' => article1.id
                assert_response :redirect
                article2.reload
                article2.body.should_not == "#{previous_content2} #{previous_content1}"
            end
            it 'should merge bodies' do
                article1 = @article1
                article2 = @article2
                previous_content1 = article1.body
                previous_content2 = article2.body
                post :merge_articles, 'id' => article2.id, 'merge_with' => article1.id
                assert_response :redirect
                article2.reload
                article2.body.should == "#{previous_content2} #{previous_content1}"
            end
            it 'should merge comments' do
                article1 = @article1
                article2 = @article2
                article1_comments_count = Feedback.where(:article_id => article1.id).count
                article2_comments_count = Feedback.where(:article_id => article2.id).count
                post :merge_articles, 'id' => article2.id, 'merge_with' => article1.id
                assert_response :redirect
                article2.reload
                Feedback.where(:article_id => article2.id).count.should == (article1_comments_count + article2_comments_count)
            end
        end
    end
end
