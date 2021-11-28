unit uRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ppPrnabl, ppClass, ppCtrls,
  ppBands, ppCache, ppDesignLayer, ppParameter, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppReport, ppVar;

type
  TfrmRelatorios = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    subTitulo: string;
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

{$R *.dfm}

uses
  UDataModule;

end.
