   M S B A M L   `   `   `  ����C  ?Session2, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:Session2Session2  5   	       Session2.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   (localclr-namespace:Session2     5   	   -   5          � WindowStartupLocation$  CenterScreen=�5       � Title$ Manage Flight Schedules��5   	   $	��750��6)   $
��1200��66   .��5	      �  � RowDefinitions 5
   
   �� 5      $
��Auto �6   �� 5      �� 5      $	��100 �6   .+�5   
   �� $��0��6      
BorderMain#��[  6   ._�5      �� $��Center=�6   .+�5      ]� $��50��6   $��10q�6(   .+�5      ]� $	��320��6    $��10q�6,   .+�5      �� $
��From��6$   $��20(�60   $
��33 0q�6>   �� 5      -   5         ��Name$ 	FromRoute��5   #    �� DisplayMemberPath$ IATACode��66   $��20(�6S   5      ]� 5      $	��320��6    $��
50 10 0 10q�6,   .+�5      �� $��To��6$     TextMain#��[ 6.   �� 5      -   5        $ ToRoute��5   #   $ IATACode��64   $��20(�6Q   5      ]� 5      $	��320��6    $��10q�6,   .+�5      �� $��Sort by��6$   #��[ 63   �� 5      -   5        $ SortBy��5   #   $��20(�63   .@�5      �� $��	Date-time��6(   �� 5      $��Economy price��6(   �� 5      $��	Confirmed��6(   5       5!      5"      ]� 5#      $��50��6   $��10q�6(   .+�5$      ]� $	��320��6    $��10q�6,   .+�5%      �� $��Outbound��6$   #��[ 64   (  "System.Windows.Controls.DatePicker  5&      -   5          Name$ OutboundRoute��5&   %   $��17(�6<   5'      ]� 5(      $	��320��6    $��
50 10 0 10q�6,   .+�5)      �� $��Flight Number��6$   #��[ 69   �� 5*      -   5        $ FlightNumber��5*   #   $ FlightNumber��69   $��20(�6Z   5+      �� 5,      -   5         ��Name$ ApplyBtn��5,      $��Apply��6F     	ApplyMain#��[ 6V   5-      5.      5/      �� 50   
   
�������$��0��6!   $��10��6.   $��90��6:   $	��Top=�6E   $
��Left=�6]   $��35 15q�6x   �� 51   
   $��20(�6   $��	Filter by��6"   $��30��63   $��80��6?   $
��Left=�6J   $	��Top=�6e   $
��40 5q�6}   &   System.Windows.Controls.DataGrid  52   
   -   5          Name$ OutputAirlines��52      $��1��6+      AutoGenerateColumns .  	   
IsReadOnly	 . $
��20 0q�6f   $��20(�6t   
   Columns
 53      0  *System.Windows.Controls.DataGridTextColumn  54      ,  &System.Windows.Controls.DataGridColumn   Header$
 Date��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$	 100 63   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6?   �� *Date+ �� StringFormat$ d��  55      $
 Time��6%   $	 100 63    6?   �� *Time+  56      $
 From��6%   $	 110 63    6?   �� *Routes.Airports.IATACode+  57      $ To��6%   $	 110 61    6=   �� *Routes.Airports1.IATACode+  58      $ Flight number��6%   $	 140 6<    6H   �� *FlightNumber+  59      $ Aircraft��6%   $	 110 67    6C   �� *Aircrafts.Name+  5:      $ Economy price��6%   $	 145 6<    6H   �� *EconomyPrice+$ c��  5;      $ Business price��6%   $	 145 6=     5<      $ First class price��6%   $ * 6@   ��5>      �� 5?       �� 
TargetType)  #System.Windows.Controls.DataGridRow"  6   .�5@      ��  �� Property � �� �� Value
 �����63    �� Triggers 5A      �� 5B       �� Binding 6&   �� *	Confirmed+ �� Value	 False6D   .a�5C      ��  � ��
 �  ��6;   5D      5F      5H      ]� 5I   
   $��2��6   $	��Top=�6!   $
��20 0q�69   .+�5J      ]� $
��Left=�6   .+�5K      �� -	   5        $ 	CancelBtn��5K      $	��160��6D   $��10q�6P   .��5L      ]� .+�5M      �� $��/Resources/cancel.png��6    $��20��6?   $��20��6J   �� 5N      $��Cancel Flight��6$   $��20(�69   $��Center=�6G   $��5q�6b   5O      5P      �� 5Q      -
   5        $ EditBtn��5Q      $	��140��6@   $��10q�6L   .��5R      ]� .+�5S      �� $��/Resources/edit.png��6    $��20��6=   $��20��6H   �� 5T      $��Edit Flight��6$   $��20(�67   $��Center=�6E   $��5q�6`   5U      5V      5W      �� 5X      -   5        $ 	ImportBtn��5X      $	��220��6@   $��10q�6L   $��Right=�6X   .��5Y      ]� .+�5Z      �� $��/Resources/import.png��6   $��20��6;   $��20��6F   �� 5[      $��Import Changes��6    $��20(�66   $��Center=�6D   $��5q�6_   5\      5]      5^      5_      5`      