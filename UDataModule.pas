unit UDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, FireDAC.Comp.UI,
  FireDAC.Comp.Client, Data.DB;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var vBanco: string;
begin
  FDConnection1.Connected := False;
  vBanco :=   'D:\_Documentos\Sistemas\delphi_relatorios_pdf-2021-11-28\banco_de_dados\banco_relatorios.FDB';
  FDConnection1.Params.Database := vBanco;
  FDConnection1.Params.UserName := 'SYSDBA';
  FDConnection1.Params.Password := 'masterkey';
  FDConnection1.Connected := True;
end;

end.
