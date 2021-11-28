unit UMenuRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids, //clipbrd,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppBands, ppCache, ppClass, ppDesignLayer,
  ppParameter, ppProd, ppReport, ppPrnabl, ppCtrls, ppVar;

type
  TFMenuRelatorios = class(TForm)
  private
    procedure pesquisaPadrao;
    { Private declarations }
  public
    { Public declarations }
    pre_subTitulo: string;
    pesquisaGrupo, pesquisaSetor: string;
  end;

var
  FMenuRelatorios: TFMenuRelatorios;

implementation

{$R *.dfm}

uses uRelatorios, UDataModule;

procedure TFMenuRelatorios.pesquisaPadrao;
begin
end;

end.
