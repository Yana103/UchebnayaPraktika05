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
using Microsoft.Win32;
using System.IO;

namespace Session2
{
    /// <summary>
    /// Логика взаимодействия для Import.xaml
    /// </summary>
    public partial class Import : Window
    {
        public Schedules newFlight = new Schedules();
        public Import()
        {
            InitializeComponent();
        }
        int success = 0, duplicate = 0, missing = 0;
        void Miss()
        {
            missing++;
        }
        void Ok()
        {
            success++;
        }
        void Dupl()
        {
            duplicate++;
        }

        private void ImportBtn_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new Session2_22Entities())
            {
                OpenFileDialog openFile = new OpenFileDialog();
                if (openFile.ShowDialog() == true)
                {
                    Schedules info = new Schedules();
                    RoadFile.Text = openFile.FileName;
                    var listFlight = Session2_22Entities.GetContext().Schedules.ToList();
                    foreach (var line in File.ReadAllLines(openFile.FileName))
                    {
                        var data = line.Split(',');
                        if (data.Length == 9)
                        {
                            if (data[0] == "ADD")
                            {
                                if (Regex.IsMatch(data[1], @"\d{4}-\d{2}-\d{2}"))
                                {
                                    var protectDate = data[1].Split('-');
                                    if (Convert.ToInt32(protectDate[1]) <= 12 && Convert.ToInt32(protectDate[2]) <= 31)
                                        newFlight.Date = DateTime.Parse(data[1]);
                                    else
                                        Miss();
                                }
                                else
                                {
                                    Miss();
                                }
                                if (Regex.IsMatch(data[2], @"\d{2}:\d{2}"))
                                    newFlight.Time = TimeSpan.Parse(data[2]);
                                else
                                {
                                    Miss();
                                }

                                if (Regex.IsMatch(data[3], @"[0-9]"))
                                    newFlight.FlightNumber = data[3];
                                else
                                {
                                    Miss();
                                }
                                if (Regex.IsMatch(data[4], @"[A-Z]{3}"))
                                {
                                    if (Regex.IsMatch(data[5], @"[A-Z]{3}"))
                                    {
                                        var routes = Session2_22Entities.GetContext().Routes.ToList();
                                        int departure = routes.First(p => p.Airports.IATACode == data[4]).Airports.ID;
                                        int arrival = routes.First(p => p.Airports1.IATACode == data[5]).Airports1.ID;
                                        int routeID = routes.First(p => p.DepartureAirportID == departure && p.ArrivalAirportID == arrival).ID;
                                        newFlight.RouteID = routeID;
                                    }
                                    else
                                    {
                                        Miss();
                                    }
                                }
                                else
                                {
                                    Miss();
                                }
                                if (Regex.IsMatch(data[6], @"[0-9]"))
                                    newFlight.AircraftID = Convert.ToInt32(data[6]);
                                else
                                {
                                    Miss();
                                }
                                if (Regex.IsMatch(data[7], @"[0-9].\d{2}"))
                                    newFlight.EconomyPrice = Decimal.Parse(data[7].Replace('.', ','));
                                else
                                {
                                    Miss();
                                }
                                if (data[8] == "OK")
                                    newFlight.Confirmed = true;
                                else if (data[8] == "CANCELED")
                                    newFlight.Confirmed = false;
                                else
                                {
                                    Miss();
                                }
                                var duplicateFlight = listFlight.FirstOrDefault(p => p.Date == newFlight.Date && p.FlightNumber == newFlight.FlightNumber);
                                if (duplicateFlight != null)
                                {
                                    Dupl();
                                    continue;
                                }
                                try
                                {
                                    Ok();
                                    Session2_22Entities.GetContext().Schedules.Add(newFlight);
                                    Session2_22Entities.GetContext().SaveChanges();
                                    Session2_22Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                                }
                                catch (Exception ex)
                                {
                                    MessageBox.Show(messageBoxText: ex.Message.ToString());
                                }
                            }
                            else if (data[0] == "EDIT")
                            {
                                if (Regex.IsMatch(data[1], @"\d{4}-\d{2}|12|-\d{2}|30|"))
                                {
                                    if (Regex.IsMatch(data[3], @"[0-9]"))
                                    {
                                        var editFlight = listFlight.FirstOrDefault(p => p.Date == DateTime.Parse(data[1]) && p.FlightNumber == data[3]);
                                        if (editFlight != null)
                                        {
                                            if (Regex.IsMatch(data[1], @"\d{4}-\d{2}-\d{2}"))
                                            {
                                                var protectDate = data[1].Split('-');
                                                if (Convert.ToInt32(protectDate[1]) <= 12 && Convert.ToInt32(protectDate[2]) <= 31)
                                                    editFlight.Date = DateTime.Parse(data[1]);
                                                else
                                                    Miss();
                                            }
                                            if (Regex.IsMatch(data[2], @"\d{2}:\d{2}"))
                                                editFlight.Time = TimeSpan.Parse(data[2]);
                                            else
                                            {
                                                Miss();
                                            }
                                            if (Regex.IsMatch(data[3], @"[0-9]"))
                                                editFlight.FlightNumber = data[3];
                                            else
                                            {
                                                Miss();
                                            }
                                            if (Regex.IsMatch(data[4], @"[A-Z]{3}"))
                                            {
                                                if (Regex.IsMatch(data[5], @"[A-Z]{3}"))
                                                {
                                                    var routes = Session2_22Entities.GetContext().Routes.ToList();
                                                    int departure = routes.First(p => p.Airports.IATACode == data[4]).Airports.ID;
                                                    int arrival = routes.First(p => p.Airports1.IATACode == data[5]).Airports1.ID;
                                                    int routeID = routes.First(p => p.DepartureAirportID == departure && p.ArrivalAirportID == arrival).ID;
                                                    editFlight.RouteID = routeID;
                                                }
                                                else
                                                {
                                                    Miss();
                                                }
                                            }
                                            else
                                            {
                                                Miss();
                                            }
                                            if (Regex.IsMatch(data[6], @"[0-9]"))
                                                editFlight.AircraftID = Convert.ToInt32(data[6]);
                                            else
                                            {
                                                Miss();
                                            }
                                            if (Regex.IsMatch(data[7], @"[0-9].\d{2}"))
                                                editFlight.EconomyPrice = Decimal.Parse(data[7].Replace('.', ','));
                                            else
                                            {
                                                Miss();
                                            }
                                            if (data[8] == "OK")
                                                editFlight.Confirmed = true;
                                            else if (data[8] == "CANCELED")
                                                editFlight.Confirmed = false;
                                            else
                                                Miss();
                                            try
                                            {
                                                Ok();
                                                Session2_22Entities.GetContext().SaveChanges();
                                                Session2_22Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                                            }
                                            catch (Exception ex)
                                            {
                                                MessageBox.Show(ex.Message.ToString());
                                            }
                                        }
                                        else
                                            Miss();
                                    }
                                    else
                                    {
                                        Miss();
                                    }
                                }
                                else
                                {
                                    Miss();
                                }
                            }
                            else
                            {
                                MessageBox.Show("Операция неизвестна");
                                Miss();
                            }
                        }
                        else
                        {
                            Miss();
                            continue;
                        }
                    }
                }
                Missing.Text = missing.ToString();
                Success.Text = success.ToString();
                Duplicate.Text = duplicate.ToString();
                Session2_22Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            }
        }
    }
}