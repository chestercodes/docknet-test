using static MyProject.Domain;

namespace MyProject.Services
{
    public class EmojiAppender
    {
        public string AppendNTimes(string str, Emoji emoji, int n)
        {
            var returnVal = str;
            for (int i = 1; i < n; i++)
            {
                returnVal += emoji.Item;
            }

            return returnVal;
        }
    }
}
