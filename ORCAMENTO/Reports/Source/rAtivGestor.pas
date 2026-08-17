{******************************************************************************}
{* Rodolpho da SIlva - 14/09/2005 - 20157                                     *}
{* Removido o parâmetro "Usuarios por..."                                     *}
{******************************************************************************}
{* Marcio Motta - 01/04/2005 - 17231                                          *}
{* Redimensionamento do Form de parâmetros                                    *}
{******************************************************************************}


unit rAtivGestor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass, ppVar,
  ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  TXRB;

type
  TrptAtivGestor = class(TFrmCmReport)
    sqlAtivGestor: TCMSqlParams;
    cdsAtivGestor: TCMClientDataSet;
    dsAtivGestor: TwwDataSource;
    pplAtivGestor: TppBDEPipeline;
    rpAtivGestor: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLabel123: TppLabel;
    ppLine33: TppLine;
    ppLabel124: TppLabel;
    rptAtivGestorLabel2: TppLabel;
    rptAtivGestorLabel3: TppLabel;
    rptAtivGestorLabel10: TppLabel;
    rptAtivGestorLabel4: TppLabel;
    rptAtivGestorLabel11: TppLabel;
    rptAtivGestorLabel5: TppLabel;
    rptAtivGestorLabel12: TppLabel;
    rptAtivGestorLabel6: TppLabel;
    rptAtivGestorLabel13: TppLabel;
    rptAtivGestorLabel7: TppLabel;
    rptAtivGestorLabel14: TppLabel;
    rptAtivGestorLabel8: TppLabel;
    rptAtivGestorLabel9: TppLabel;
    rptAtivGestorLabel15: TppLabel;
    rptAtivGestorLabel16: TppLabel;
    rptAtivGestorLine2: TppLine;
    txtPeriodo: TppLabel;
    rptAtivGestorLabel17: TppLabel;
    rptAtivGestorLabel18: TppLabel;
    rptAtivGestorLabel19: TppLabel;
    rptAtivGestorLabel20: TppLabel;
    ppDetailBand13: TppDetailBand;
    rptAtivGestorDBText3: TppDBText;
    rptAtivGestorDBText4: TppDBText;
    rptAtivGestorDBText5: TppDBText;
    rptAtivGestorDBText6: TppDBText;
    rptAtivGestorDBText7: TppDBText;
    rptAtivGestorDBText8: TppDBText;
    rptAtivGestorDBText9: TppDBText;
    rptAtivGestorDBText10: TppDBText;
    rptAtivGestorDBText11: TppDBText;
    ppFooterBand13: TppFooterBand;
    ppLine34: TppLine;
    ppLabel125: TppLabel;
    ppCalc24: TppSystemVariable;
    ppCalc25: TppSystemVariable;
    rptAtivGestorGroup1: TppGroup;
    rptAtivGestorGroupHeaderBand1: TppGroupHeaderBand;
    rptAtivGestorDBText1: TppDBText;
    rptAtivGestorDBText2: TppDBText;
    rptAtivGestorLabel1: TppLabel;
    rptAtivGestorLine3: TppLine;
    rptAtivGestorGroupFooterBand1: TppGroupFooterBand;
    rptAtivGestorLine1: TppLine;
    ppLabel1: TppLabel;
    procedure sqlAtivGestorFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure FormCreate(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptAtivGestor: TrptAtivGestor;

implementation

uses uSistema, uModulo, uData;

{$R *.DFM}

procedure TrptAtivGestor.sqlAtivGestorFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'CODCENTRORESPON') or (sParamName = 'ORDENACAO') then
    sNewValue := sOldValue;
end;




procedure TrptAtivGestor.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria SQL Parametro Exercício
  with CmpRptCM.ParamValues[0].LookupSettings.SQL do begin
    Clear;
    Add('SELECT DISTINCT EXERCICIO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ')');
    Add('ORDER BY EXERCICIO');
  end;
  // Cria SQL Parametro Período Inicial
  with CmpRptCM.ParamValues[1].LookupSettings.SQL do begin
    Clear;
    Add('SELECT PERIODO, NOMEPERIODO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
    Add('      (EXERCICIO = ' + IntToStr(Year(Date)) + ') ');
    Add('ORDER BY PERIODO');
  end;
  // Cria SQL Parametro Período Final
  with CmpRptCM.ParamValues[2].LookupSettings.SQL do begin
    Clear;
    Add('SELECT PERIODO, NOMEPERIODO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
    Add('      (EXERCICIO = ' + IntToStr(Year(Date)) + ') ');
    Add('ORDER BY PERIODO');
  end;
  // Cria SQL Parametro Centro de Responsabilidade
  with CmpRptCM.ParamValues[3].LookupSettings.SQL do begin
    Clear;
    Add('SELECT CODCENTRORESPON, (TRIM(CODCENTRORESPON) || '' - '' || ' +
                                                               'NOME) AS NOME');
    Add('FROM CENTRESPON');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ')');
    Add('ORDER BY NOME');
  end;
end;




procedure TrptAtivGestor.CrmRptCMBeforePrint(Sender: TObject);
var smesini, smesfim: string;
begin
  inherited;
  if CmpRptCM.ParamValues[5].AsFloat <> 0 then
    rptAtivGestorLabel20.caption := 'Valores por ' +
                     FloatToStrF(CmpRptCM.ParamValues[5].AsFloat,ffNumber,18,2)
  else
    rptAtivGestorLabel20.caption := '';
  rptAtivGestorLabel18.Caption := IntToStr(CmpRptCM.ParamValues[0].AsInteger);
  case CmpRptCM.ParamValues[1].AsInteger of
    1  : smesini := 'Janeiro';
    2  : smesini := 'Fevereiro';
    3  : smesini := 'Março';
    4  : smesini := 'Abril';
    5  : smesini := 'Maio';
    6  : smesini := 'Junho';
    7  : smesini := 'Julho';
    8  : smesini := 'Agosto';
    9  : smesini := 'Setembro';
    10 : smesini := 'Outubro';
    11 : smesini := 'Novembro';
    12 : smesini := 'Dezembro';
  end;
  case CmpRptCM.ParamValues[2].AsInteger of
    1  : smesfim := 'Janeiro';
    2  : smesfim := 'Fevereiro';
    3  : smesfim := 'Março';
    4  : smesfim := 'Abril';
    5  : smesfim := 'Maio';
    6  : smesfim := 'Junho';
    7  : smesfim := 'Julho';
    8  : smesfim := 'Agosto';
    9  : smesfim := 'Setembro';
    10 : smesfim := 'Outubro';
    11 : smesfim := 'Novembro';
    12 : smesfim := 'Dezembro';
  end;
  if smesini <> smesfim then
    rptAtivGestorLabel19.Caption := smesini + ' - ' + smesfim
  else
    rptAtivGestorLabel19.Caption := smesini;
  with sqlAtivGestor do begin
    Prepare;
    if CmpRptCM.ParamValues[5].AsFloat = 0 then
      ParamByName('VALORDIV').AsFloat := 1
    else
      ParamByName('VALORDIV').AsFloat := CmpRptCM.ParamValues[5].AsFloat;
    ParamByName('EXERCICIO').AsInteger  := CmpRptCM.ParamValues[0].AsInteger;
    ParamByName('PERIODOINI').AsInteger := CmpRptCM.ParamValues[1].AsInteger;
    ParamByName('PERIODOFIM').AsInteger := CmpRptCM.ParamValues[2].AsInteger;

    if CmpRptCM.ParamValues[8].AsString <> '' then
      SQL.Strings[80] := '(G.CODGRUPOORC = ' + QuotedStr(CmpRptCM.ParamValues[8].AsString) + ') AND '
    else
      SQL.Strings[80] := '';


    if CmpRptCM.ParamValues[7].AsString <> '' then
       ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[7].AsInteger
    else
       ParamByName('IDPLANOORCAMEN').AsInteger := modulo.iPlanoOrc;

    ParamByName('IDPESSOA').AsInteger := sistema.IdEmpresa;
    if Trim(CmpRptCM.ParamValues[3].AsString) <> '' then begin
      ParamByName('CODCENTRORESPON').AsString  :=
                                       '(RTRIM(C.CODCENTRORESPON) = ''' +
                                       Trim(CmpRptCM.ParamValues[3].AsString) +
                                       ''') AND ';
      ppLabel1.Visible := False;
    end else begin
      ParamByName('CODCENTRORESPON').AsString  := '(1 = 1) AND ';
      ppLabel1.Visible := True;
    end;
    Case CmpRptCM.ParamValues[4].AsInteger of
      0 : ParamByName('ORDENACAO').AsString := 'G.CODGRUPOORC, ';
      1 : ParamByName('ORDENACAO').AsString := 'G.NOMEGRUPOORCAMEN, ';
    end;
    Open;
  end;
end;




procedure TrptAtivGestor.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;

  case Index of
     0: begin
          // Cria SQL Parametro Período Inicial
          with CmpRptCM.ParamValues[1].LookupSettings.SQL do begin
            Clear;
            Add('SELECT PERIODO, NOMEPERIODO');
            Add('FROM PERIODOORCAMEN');
            Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
            Add('(EXERCICIO = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) + ') ');
            Add('ORDER BY PERIODO');
          end;
          // Cria SQL Parametro Período Final
          with CmpRptCM.ParamValues[2].LookupSettings.SQL do begin
            Clear;
            Add('SELECT PERIODO, NOMEPERIODO');
            Add('FROM PERIODOORCAMEN');
            Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
            Add('(EXERCICIO = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) + ') ');
            Add('ORDER BY PERIODO');
          end;
        end;
  end;
end;




end.
