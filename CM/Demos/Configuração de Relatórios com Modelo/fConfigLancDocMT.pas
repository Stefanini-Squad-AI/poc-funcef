unit fConfigLancDocMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConfigRelatorioMT, ppDB, ppDBPipe, ppDBBDE, ppCache, ppClass, ppBands,
  ppRelatv, ppProd, ppReport, ppComm, ppEndUsr, Menus, uCmSqlParams,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls,
  TB97, StdCtrls, Buttons, Mask, wwdbedit, wwdblook, CMDBLookupCombo,
  ExtCtrls, ppCtrls, ppVar, ppPrnabl, wwdbdatetimepicker, CMDateTimePicker;
                                  
type
  TFrmConfigLancDocMT = class(TFrmConfigRelatorioMT)
    ppHeaderBand1: TppHeaderBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    GroupBox1: TGroupBox;
    DtIni: TCMDateTimePicker;
    Dtfim: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
  protected
    Procedure SelDados; Override;
  public
    { Public declarations }
  end;


var
  FrmConfigLancDocMT: TFrmConfigLancDocMT;

implementation

{$R *.DFM}

procedure TFrmConfigLancDocMT.FormCreate(Sender: TObject);
begin
  {
    Atribuir o Flag equivalente ao modelo do relatório caso a a tabela de
    persistência seja a CARTACOBRANCA
  }
  cFlag := 'D';
  inherited;

end;

procedure TFrmConfigLancDocMT.SelDados;
begin
  inherited;
  {
    Sobrescrever a procedure SelDados para abrir o SQLDADOS que é a fonte
    de dados para o relatório.
    Em tempo de desenho clicar acessar a opção OPEN do meno do SQLDADOS para
    abrir o CDSDADOS para habilitar o acesso aos campos da consulta para o
    desenho do relatório.
  }

  SqlDados.Prepare;
  SqlDados.ParamByName('DATAINI').AsDate := DtIni.Date;
  SqlDados.ParamByName('DATAFIM').AsDate := DtFim.Date;
  SqlDados.Open;
end;

procedure TFrmConfigLancDocMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  If DeRelatorio.CanFocus Then DeRelatorio.SetFocus;
end;

procedure TFrmConfigLancDocMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If DeRelatorio.CanFocus Then DeRelatorio.SetFocus;
end;

end.                                           
