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
    /// Логика взаимодействия для adduser.xaml
    /// </summary>
    public partial class adduser : Window
    {
        private User _currentUser = new User();
        public adduser()
        {
            InitializeComponent();
            DataContext = _currentUser;
            Offices.ItemsSource = Session1_XXEntities.GetContext().Offices.ToList();

        }

        private void Addd_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentUser.Email))
                errors.AppendLine("Укажите Электронную Почту");
            if (string.IsNullOrWhiteSpace(_currentUser.FirstName))
                errors.AppendLine("Укажите Имя");
            if (string.IsNullOrWhiteSpace(_currentUser.LastName))
                errors.AppendLine("Укажите Фамилию");
            if (_currentUser.Office == null)
                errors.AppendLine("Выберите Оффис.");
            if (_currentUser.Birthdate == null)
                errors.AppendLine("Укажите дату рождения");
            if (string.IsNullOrWhiteSpace(_currentUser.Password))
                errors.AppendLine("Укажите пароль");
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            if (_currentUser.ID == 0)
            {
                Session1_XXEntities.GetContext().Users.Add(_currentUser);
                _currentUser.RoleID = 2;
                _currentUser.Active = true;
            }
                
            try
            {
                Session1_XXEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация успешно сохранена");

                this.Close();

            }
           
            // окно с сообщением
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }

        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
