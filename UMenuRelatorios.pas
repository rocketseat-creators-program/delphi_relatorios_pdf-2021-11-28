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
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtGrupo: TEdit;
    edtSetor: TEdit;
    btnPesquisar: TButton;
    btnLimparPesquisa: TButton;
    btnImprmirRelatorio: TButton;
    DBGrid1: TDBGrid;
    qryPesquisa: TFDQuery;
    dssPesquisa: TDataSource;
    cdsPesquisa: TClientDataSet;
    dspPesquisa: TDataSetProvider;
    qryPesquisaIDPRODUTO: TIntegerField;
    qryPesquisaNOMEPRODUTO: TStringField;
    qryPesquisaPVENDA: TFloatField;
    qryPesquisaIDGRUPO: TIntegerField;
    qryPesquisaDESCRICAOGRUPO: TStringField;
    qryPesquisaIDSETOR: TIntegerField;
    qryPesquisaDESCRICAOSETOR: TStringField;
    cdsPesquisaIDPRODUTO: TIntegerField;
    cdsPesquisaNOMEPRODUTO: TStringField;
    cdsPesquisaPVENDA: TFloatField;
    cdsPesquisaIDGRUPO: TIntegerField;
    cdsPesquisaDESCRICAOGRUPO: TStringField;
    cdsPesquisaIDSETOR: TIntegerField;
    cdsPesquisaDESCRICAOSETOR: TStringField;
    qryImprimir: TFDQuery;
    dssImprmir: TDataSource;
    ppReport1: TppReport;
    pppImprimir: TppDBPipeline;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    ppDBText7: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppDBCalc1: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnLimparPesquisaClick(Sender: TObject);
    procedure btnImprmirRelatorioClick(Sender: TObject);
    procedure ppLabel2Print(Sender: TObject);
  private
    procedure pesquisaPadrao;
    { Private declarations }
  public
    { Public declarations }
    pre_subTitulo: string;
    pesquisaGrupo, pesquisaSetor: string;
    sqlString: string;
    subtituloGrupo, subtituloSetor, subtituloCompleto: string;
  end;

var
  FMenuRelatorios: TFMenuRelatorios;

implementation

{$R *.dfm}

uses uRelatorios, UDataModule;

procedure TFMenuRelatorios.btnImprmirRelatorioClick(Sender: TObject);
begin
  qryImprimir.SQL.Text := sqlString;
  qryImprimir.Close;
  qryImprimir.Open;
  ppReport1.Print;
  qryImprimir.Close;
end;

procedure TFMenuRelatorios.btnLimparPesquisaClick(Sender: TObject);
begin
  edtSetor.Text := '';
  edtGrupo.Text := '';
  pesquisaPadrao;
end;

procedure TFMenuRelatorios.btnPesquisarClick(Sender: TObject);
begin
  pesquisaPadrao;
end;

procedure TFMenuRelatorios.pesquisaPadrao;
var
    codGrupo: string;
    codSetor: string;
begin
  codGrupo := Trim(edtGrupo.Text);
  codSetor := Trim(edtSetor.Text);

  subtituloCompleto := '';
  subtituloGrupo := '';
  subtituloSetor := '';

  sqlString := ''+#13+#10+
  ' select p.idproduto, p.nomeproduto, p.pvenda,   '+#13+#10+
  '        p.idgrupo, g.descricaogrupo,            '+#13+#10+
  '        p.idsetor, s.descricaosetor             '+#13+#10+
  ' from tb_produto p                              '+#13+#10+
  ' join tb_grupo   g on (p.idgrupo = g.idgrupo)   '+#13+#10+
  ' join tb_setor   s on (p.idsetor = s.idsetor)   '+#13+#10+
  ' where 1=1 '+#13+#10+
  '';

  if codSetor <> '' then
  begin
    sqlString := sqlString +' and p.idsetor = '+ QuotedStr(codSetor);
    subtituloSetor := 'Filtro por setor:' + QuotedStr(codSetor) + '.';
  end;

  if codGrupo <> '' then
  begin
    sqlString := sqlString +' and p.idgrupo = '+ QuotedStr(codGrupo);
    subtituloGrupo := 'Filtro por grupo:' + QuotedStr(codGrupo) + '.';
  end;

  sqlString := sqlString +
  '                                                '+#13+#10+
  ' order by s.idsetor, g.idgrupo, p.idproduto     '+#13+#10+
  '';


  subtituloCompleto := subtituloGrupo + subtituloSetor;

  cdsPesquisa.Close;
  cdsPesquisa.CommandText := sqlString;
  cdsPesquisa.Open;

end;

procedure TFMenuRelatorios.ppLabel2Print(Sender: TObject);
begin
  ppLabel2.Caption := subtituloCompleto;
end;

end.
