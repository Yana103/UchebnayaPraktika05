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
using System.Windows.Threading;

namespace leto
{
    /// <summary>
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        public UserPage()
        {
            InitializeComponent();
            Hi.Text = $"Привет {MainWindow.Globals.userinfo.FirstName}, добро пожаловать в AMONIC Airlines.";
            DGridActives.ItemsSource = Session1_XXEntities.GetContext().ActiveTimes.Where(xyz => xyz.ID_User == MainWindow.Globals.userinfo.ID).ToList();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            DispatcherTimer timerrsec = new DispatcherTimer();
            timerrsec.Interval = TimeSpan.FromSeconds(1);
            timerrsec.Tick += dtTicker;
            timerrsec.Start();

        }

        private int sec = 0;
        private int min = 0;
        private int hour = 0;

        private void dtTicker(object sender, EventArgs e)
        {
            sec++;
            if (sec == 60)
            {
                sec = 0;
                min += 1;
                if (min == 60)
                {
                    min = 0;
                    hour += 1;
                }
            }
           timersec.Text = $"{hour.ToString()}:{min.ToString()}:{sec.ToString()}";
        }
    }
}
