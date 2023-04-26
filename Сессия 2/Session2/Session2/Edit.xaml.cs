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
using System.Text.RegularExpressions;

namespace Session2
{
    /// <summary>
    /// Логика взаимодействия для Edit.xaml
    /// </summary>
    public partial class Edit : Window
    {
        public Schedules currentFlight;
        public Edit(Schedules selectFlight)
        {
            currentFlight = selectFlight;
            InitializeComponent();
            DataContext = currentFlight;
            From.Text = currentFlight.Routes.Airports.Name;
            To.Text = currentFlight.Routes.Airports1.Name;
            Aircraft.Text = currentFlight.Aircrafts.Name;
        }

        private void UpdateBtn_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (Date.SelectedDate != null)
            {
                currentFlight.Date = (DateTime)Date.SelectedDate;
            }
            else
            {
                errors.AppendLine("Дата не может быть пустой");
            }
            if (!string.IsNullOrWhiteSpace(Time.Text))
            {
                if (Regex.IsMatch(Time.Text, @"\d{2}:\d{2}:\d{2}"))
                {
                    currentFlight.Time = TimeSpan.Parse(Time.Text);
                }
                else
                {
                    errors.AppendLine("Неверно указано время");
                }
            } else
            {
                errors.AppendLine("Время не может быть пустым");
            }
            if (!string.IsNullOrWhiteSpace(Price.Text))
            {
                if (Regex.IsMatch(Price.Text, @"[0-9]"))
                    if (Price.Text == "0")
                    {
                        errors.AppendLine("Рейс не может стоить 0$");
                    }
                    else 
                    {
                        try
                        {
                            currentFlight.EconomyPrice = Decimal.Parse(Price.Text.Replace('.', ','));
                        }
                        catch
                        {
                            errors.AppendLine("Цена имеет неверный формат");
                        }
                    }
                else
                {
                    errors.AppendLine("Неверно выбрана цена");
                }
            }
            else
            {
                errors.AppendLine("Цена не может быть пустой");
            }
            
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            try
            {
                Session2_22Entities.GetContext().SaveChanges();
                MessageBox.Show("Данные успешно сохранены");
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void CancelBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}