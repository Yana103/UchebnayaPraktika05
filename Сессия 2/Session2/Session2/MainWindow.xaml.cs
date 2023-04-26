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

namespace Session2
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public Session2_22Entities mainInfo;
        public MainWindow()
        {
            InitializeComponent();
            var allAirports = Session2_22Entities.GetContext().Airports.ToList();
            allAirports.Insert(0, new Airports
            {
                Name = "All Airports"
            });
            FromRoute.ItemsSource = allAirports;
            FromRoute.SelectedIndex = 0;
            ToRoute.ItemsSource = allAirports;
            ToRoute.SelectedIndex = 0;
            SortBy.SelectedIndex = 0;

            var allNumber = Session2_22Entities.GetContext().Schedules.ToList();
            allNumber.Insert(0, new Schedules
            {
                FlightNumber = "All number"
            });
            FlightNumber.ItemsSource = allNumber;
            FlightNumber.SelectedIndex = 0;
            Sort();
        }
        public void Sort()
        {
            var searchFlight = Session2_22Entities.GetContext().Schedules.ToList();
            if (OutboundRoute.SelectedDate != null)
                searchFlight = searchFlight.Where(p => p.Date == OutboundRoute.SelectedDate).ToList();
            if (FromRoute.SelectedIndex > 0)
                searchFlight = searchFlight.Where(p => p.Routes.DepartureAirportID == (FromRoute.SelectedItem as Airports).ID).ToList();
            if (ToRoute.SelectedIndex > 0)
                searchFlight = searchFlight.Where(p => p.Routes.ArrivalAirportID == (ToRoute.SelectedItem as Airports).ID).ToList();
            if (SortBy.SelectedIndex == 0)
                searchFlight = searchFlight.OrderBy(p => p.Date).ToList();
            else if (SortBy.SelectedIndex == 1)
                searchFlight = searchFlight.OrderBy(p => p.EconomyPrice).ToList();
            else
                searchFlight = searchFlight.OrderBy(p => p.Confirmed).ToList();
            if (FlightNumber.SelectedIndex > 0)
                searchFlight = searchFlight.Where(p => p.FlightNumber == (FlightNumber.SelectedItem as Schedules).FlightNumber).ToList();
            OutputAirlines.ItemsSource = searchFlight;
        }
        private void ApplyBtn_Click(object sender, RoutedEventArgs e)
        {
            Sort();
        }

        private void CancelBtn_Click(object sender, RoutedEventArgs e)
        {
            var selectFlight = (OutputAirlines.SelectedItem as Schedules);
            if (selectFlight.Confirmed == true)
            {
                selectFlight.Confirmed = false;
                MessageBox.Show("Рейс отменён");
            }
            else
            {
                selectFlight.Confirmed = true;
                MessageBox.Show("Рейс активен");
            }
            try
            {
                Session2_22Entities.GetContext().SaveChanges();
                Session2_22Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                Sort();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void EditBtn_Click(object sender, RoutedEventArgs e)
        {
            if (OutputAirlines.SelectedItem != null)
            {
                this.Visibility = Visibility.Collapsed;
                Edit edit = new Edit(OutputAirlines.SelectedItem as Schedules);
                edit.ShowDialog();
            } else
            {
                MessageBox.Show("Выберите редактируемый рейс");
            }
            this.Visibility = Visibility.Visible;
            Session2_22Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            Sort();
        }

        private void ImportBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Visibility = Visibility.Collapsed;
            Import import = new Import();
            import.ShowDialog();
            Session2_22Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            this.Visibility = Visibility.Visible;
            Sort();
        }

        private void Window_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                Session2_22Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                Sort();
            }
        }
    }
}