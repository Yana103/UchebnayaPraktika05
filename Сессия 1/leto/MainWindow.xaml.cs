using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace leto
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        // класс глобальных переменных
        public static class Globals
        {
            public static int UserRole;
            public static bool UserAdd;
            public static User userinfo { get; set; }
        }
        private void enter_btn_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            using (var db = new Session1_XXEntities())
            {
                var user = db.Users.AsNoTracking().FirstOrDefault(u => u.Email == Log.Text && u.Password == Pass.Password);
                var logi = db.Users.AsNoTracking().FirstOrDefault(u => u.Email == Log.Text);
                if (logi == null)
                {
                    errors.AppendLine("Такого пользователя не существует");
                }

                if (user == null)
                {
                    errors.AppendLine("Неверный пароль");
                }

                if (errors.Length > 0)
                    MessageBox.Show(errors.ToString());
                if (errors.Length == 0)
                {
                    if (user.Active == true)
                    {
                        Globals.UserRole = user.RoleID;
                        Globals.userinfo = user;
                        GlavPage glavpage = new GlavPage();
                        glavpage.Show();
                        this.Close();
                    }
                    else
                        MessageBox.Show("Бан");

                }
            }
        }

        private void ext_glv_btn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
    

