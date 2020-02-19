program NavPCdemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  mainfrm in 'mainfrm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
