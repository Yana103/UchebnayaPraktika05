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
    /// Логика взаимодействия для AdminPage.xaml
    /// </summary>
    public partial class AdminPage : Page
    {
        public AdminPage()
        {
            InitializeComponent();
            var alloffice = Session1_XXEntities.GetContext().Offices.ToList();
            alloffice.Insert(0, new Office
            {
                Title = "All office"
            });
            cb_office.SelectedIndex = 0;
            cb_office.ItemsSource = alloffice;
            UpdateClients();

        }
        public void UpdateClients()
        {
            var currentUsers = Session1_XXEntities.GetContext().Users.ToList();
            if (cb_office.SelectedIndex > 0 && cb_office.SelectedIndex != 1) 
            { 
             currentUsers = currentUsers.Where(p => p.OfficeID == cb_office.SelectedIndex + 1).ToList();
            }
            else if (cb_office.SelectedIndex == 1)
                currentUsers = currentUsers.Where(p => p.Office.Title == "Abu dhabi").ToList();
            DGridOffices.ItemsSource = currentUsers;
        }

        private void add_btn_Click(object sender, RoutedEventArgs e)
        {
            adduser addsers = new adduser();
            addsers.Show();
        }

        private void ext_btn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void cnhg_rl_btn_Click(object sender, RoutedEventArgs e)
        {
            User user = DGridOffices.SelectedItem as User;
            if (user.RoleID == 1)
            {
                user.RoleID = 2;
                MessageBox.Show("Понизили");
            }
            else
            { 
                user.RoleID = 1;
                MessageBox.Show("Повысили");
            }
            Session1_XXEntities.GetContext().SaveChanges();
            UpdateClients();

        }

        private void onoff_btn_Click(object sender, RoutedEventArgs e)
        {
            User user = DGridOffices.SelectedItem as User;
            if (user.Active == true)
            { 
                user.Active = false;
                MessageBox.Show("Забанено");
            }
            else 
            { 
                user.Active = true;
                MessageBox.Show("Разбанено");
            }

            Session1_XXEntities.GetContext().SaveChanges();
            UpdateClients();
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
                Session1_XXEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DGridOffices.ItemsSource = Session1_XXEntities.GetContext().Users.ToList(); 
        }

        private void refresh_btn_Click(object sender, RoutedEventArgs e)
        {
            Session1_XXEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            DGridOffices.ItemsSource = Session1_XXEntities.GetContext().Users.ToList();
            UpdateClients();
        }

        private void cb_office_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateClients();
        }
    }
}
