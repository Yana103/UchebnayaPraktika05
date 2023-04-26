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
using System.Windows.Shapes;

namespace leto
{
    /// <summary>
    /// Логика взаимодействия для GlavPage.xaml
    /// </summary>
    public partial class GlavPage : Window
    {
        public GlavPage()
        {
            InitializeComponent();
            Navigation1.MainFrame1 = MainFrame1;
            if (MainWindow.Globals.UserRole == 1)
            {
                MainFrame1.Navigate(new AdminPage());
            }
            else
            {
                add_btn.Visibility = Visibility.Collapsed;
                ActiveTime activeTime = new ActiveTime();
                activeTime.Date = DateTime.Now;
                LastActive.logTime = DateTime.Now;
                activeTime.Login_Time = DateTime.Now;
                activeTime.ID_User = MainWindow.Globals.userinfo.ID;
                try
                {
                    Session1_XXEntities.GetContext().ActiveTimes.Add(activeTime);
                    Session1_XXEntities.GetContext().SaveChanges();
                    LastActive.activeTIME = activeTime;
                    MainFrame1.Navigate(new UserPage());
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }

            }
        }
        public static class LastActive
        {
            public static ActiveTime activeTIME { get; set; }
            public static DateTime logTime;
        }
        private void add_btn_Click(object sender, RoutedEventArgs e)
        {
            adduser addsers = new adduser();
            addsers.Show();
        }

        private void ext_btn_Click(object sender, RoutedEventArgs e)
        {
            if (LastActive.activeTIME == null)
            {
                MainWindow mainwindow = new MainWindow();
                mainwindow.Show();
                this.Close();
            }
            else
            {
                ActiveTime x = LastActive.activeTIME;
                x.Logout_Time = DateTime.Now;
                System.TimeSpan y = DateTime.Now - LastActive.logTime;
                x.Time_spent = y;
                try
                {
                    Session1_XXEntities.GetContext().SaveChanges();
                    MainWindow mainwindow = new MainWindow();
                    mainwindow.Show();
                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }

            }
        }
    }
}
