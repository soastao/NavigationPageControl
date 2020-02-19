unit mainfrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, NavigationPageControl, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.ListBox, FMX.Colors, FMX.ScrollBox, FMX.Memo;

type
  TMainForm = class(TForm)
    NavPC: TNavigationPageControl;
    NavTabItem1: TNavTabItem;
    NavTabItem2: TNavTabItem;
    NavTabItem3: TNavTabItem;
    NavTabItem4: TNavTabItem;
    GroupBox1: TGroupBox;
    Layout1: TLayout;
    NavTabItem5: TNavTabItem;
    cbox1: TCheckBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    ColorComboBox2: TColorComboBox;
    cbox2: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ColorComboBox1: TColorComboBox;
    ColorComboBox3: TColorComboBox;
    Label5: TLabel;
    ColorComboBox4: TColorComboBox;
    Label6: TLabel;
    ColorComboBox5: TColorComboBox;
    Label7: TLabel;
    ColorComboBox6: TColorComboBox;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    Button1: TButton;
    Memo1: TMemo;
    procedure cbox1Change(Sender: TObject);
    procedure ColorComboBox2Change(Sender: TObject);
    procedure cbox2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ColorComboBox1Change(Sender: TObject);
    procedure ColorComboBox3Change(Sender: TObject);
    procedure ColorComboBox4Change(Sender: TObject);
    procedure ColorComboBox5Change(Sender: TObject);
    procedure ColorComboBox6Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    num:integer;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

procedure TMainForm.Button1Click(Sender: TObject);
begin
  if num = 0 then
  begin
    NavPC.TabItemList[0].PresetItemIconName := TGoodIcon.ic_account_balance;
    NavPC.TabItemList[1].PresetItemIconName := TGoodIcon.ic_directions_boat;
    NavPC.TabItemList[2].PresetItemIconName := TGoodIcon.ic_play_circle_filled;
    NavPC.TabItemList[3].PresetItemIconName := TGoodIcon.ic_account_box;
    NavPC.TabItemList[4].PresetItemIconName := TGoodIcon.ic_poll;
  end;
  if num=1 then
  begin
    NavPC.TabItemList[0].PresetItemIconName := TGoodIcon.ic_import_contacts;
    NavPC.TabItemList[1].PresetItemIconName := TGoodIcon.ic_grade;
    NavPC.TabItemList[2].PresetItemIconName := TGoodIcon.ic_cloud_download;
    NavPC.TabItemList[3].PresetItemIconName := TGoodIcon.ic_account_circle;
    NavPC.TabItemList[4].PresetItemIconName := TGoodIcon.ic_audiotrack;
  end;
  if num=2 then
  begin
    NavPC.TabItemList[0].PresetItemIconName := TGoodIcon.ic_home;
    NavPC.TabItemList[1].PresetItemIconName := TGoodIcon.ic_description;
    NavPC.TabItemList[2].PresetItemIconName := TGoodIcon.ic_video_library;
    NavPC.TabItemList[3].PresetItemIconName := TGoodIcon.ic_person;
    NavPC.TabItemList[4].PresetItemIconName := TGoodIcon.ic_grade;
    num:=-1;
  end;

  num:=num+1;
end;

procedure TMainForm.cbox1Change(Sender: TObject);
begin
  if cbox1.IsChecked then
    NavPC.Appearence.Badge.ShowBadge:=true
  else
    NavPC.Appearence.Badge.ShowBadge:=false;
end;

procedure TMainForm.cbox2Change(Sender: TObject);
begin
  if cbox2.IsChecked then
  begin
    NavPC.Appearence.Badge.ShowBadgeValue:=true;
    NavPC.Appearence.Badge.BadgeCircleRadius:=16;
  end
  else
  begin
    NavPC.Appearence.Badge.ShowBadgeValue:=false;
    NavPC.Appearence.Badge.BadgeCircleRadius:=8;
  end;
end;

procedure TMainForm.ColorComboBox1Change(Sender: TObject);
begin
  NavPC.Appearence.NormalTabItem.NormalColor:=ColorComboBox1.Color;
end;

procedure TMainForm.ColorComboBox2Change(Sender: TObject);
begin
  NavPC.Appearence.Badge.BadgeColor:=ColorComboBox2.Color;
end;

procedure TMainForm.ColorComboBox3Change(Sender: TObject);
begin
  NavPC.Appearence.SelectedTabItem.SelectedColor:=ColorComboBox3.Color;
end;

procedure TMainForm.ColorComboBox4Change(Sender: TObject);
begin
  NavPC.Appearence.TabbarBackgroundColor:=ColorComboBox4.Color;
end;

procedure TMainForm.ColorComboBox5Change(Sender: TObject);
begin
  NavPC.Appearence.SheetBackgroundColor:=ColorComboBox5.Color;
end;

procedure TMainForm.ColorComboBox6Change(Sender: TObject);
begin
  NavPC.Appearence.TabBarDividingLineColor:=ColorComboBox6.Color;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  num:=0;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  ColorComboBox2.Color:=NavPC.Appearence.Badge.BadgeColor;
  ColorComboBox3.Color:=NavPC.Appearence.SelectedTabItem.SelectedColor;
  ColorComboBox1.Color:=NavPC.Appearence.NormalTabItem.NormalColor;
  ColorComboBox4.Color:=NavPC.Appearence.TabbarBackgroundColor;
  ColorComboBox5.Color:=NavPC.Appearence.SheetBackgroundColor;
  ColorComboBox6.Color:=NavPC.Appearence.TabBarDividingLineColor;
end;

end.
