program projetoRelatorios;

uses
  Vcl.Forms,
  UMenuRelatorios in 'UMenuRelatorios.pas' {FMenuRelatorios},
  uRelatorios in 'uRelatorios.pas' {frmRelatorios},
  UDataModule in 'UDataModule.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFMenuRelatorios, FMenuRelatorios);
  Application.Run;
end.
