//==================================================================================================
//Pendência: 22003
//Descrição: Passado o plano e patro
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 16/02/2006
Autor     : Cátia Azevedo
Pendencia : 18162
Descrição : Inserção de dois alter joins
            Feito no componente CMSQLParams como segue:
              (C.IDPATRO         = P.IDPESSOA(+)) AND
              (C.IDPLANOPREV     = PPV.IDPLANOPREV(+)) AND
  { --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 10/11/2005
Autor     : Rodolpho da Silva
Pendencia : 18162
Descrição : Inserir no relatório a coluna "Descrição do Centro de Custo".
            Feito o join's no componente CMSQLParams como segue:

            TRIM(CC.CODEXTERNO) || ' - ' || CC.NOME AS DESCCENTROCUSTO,
            CENTCUST CC,
            (C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CrmRptCMBeforePrint
Data      : 27/06/2005
Autor     : Rodolpho da Silva
Pendencia : 18030
Descrição : Exibir o Centro de Responsabilidade no relatório, caso o usuário passe o filtro

---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AcertaSaldoConfirmaClick
Data      : 08/12/2004
Autor     : Rodolpho da Silva
Pendencia : 18243
Descrição : Corrigir a qry para acertar valores no saldo

            No CMSQLParams, foi inserido na coluna 53, linha 6
       o texto "(FLGRESERVA IN ('A','U'))", substituindo o original
       "(FLGRESERVA = 'A')".

---------------------------------------------------------------------------------------------------}

unit rAtivGestor2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass,
  ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet,
  uCmSqlParams, uCtrlTransacoesPorGrupo, uCtrlPadroes, ppModule, raCodMod,
  TXRB;

type
  TrptAtivGestor2 = class(TFrmCmReport)
    sqlAtivGestor2: TCMSqlParams;
    cdsAtivGestor2: TCMClientDataSet;
    dsAtivGestor2: TwwDataSource;
    rpAtivGestor2: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLabel127: TppLabel;
    ppLine35: TppLine;
    ppLabel128: TppLabel;
    ppLine36: TppLine;
    rptAtivGestor2Label1: TppLabel;
    txtPerGestor2: TppLabel;
    rptAtivGestor2Label6: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppDBText50: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    rptAtivGestor2DBText2: TppDBText;
    ppDBText156: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppLine38: TppLine;
    ppLabel199: TppLabel;
    ppCalc26: TppSystemVariable;
    ppCalc27: TppSystemVariable;
    rptAtivGestor2SummaryBand1: TppSummaryBand;
    rptAtivGestor2Label3: TppLabel;
    rptAtivGestor2DBCalc8: TppDBCalc;
    rptAtivGestor2DBCalc9: TppDBCalc;
    rptAtivGestor2DBCalc10: TppDBCalc;
    rptAtivGestor2DBCalc11: TppDBCalc;
    rptAtivGestor2DBCalc12: TppDBCalc;
    rptAtivGestor2DBCalc13: TppDBCalc;
    rptAtivGestor2DBCalc14: TppDBCalc;
    rptAtivGestor2Line1: TppLine;
    rptAtivGestor2Line2: TppLine;
    rptAtivGestor2DBCalc16: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText94: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine56: TppLine;
    rptAtivGestor2DBCalc1: TppDBCalc;
    rptAtivGestor2DBCalc2: TppDBCalc;
    rptAtivGestor2DBCalc3: TppDBCalc;
    rptAtivGestor2DBCalc4: TppDBCalc;
    rptAtivGestor2DBCalc5: TppDBCalc;
    rptAtivGestor2DBCalc6: TppDBCalc;
    rptAtivGestor2DBCalc7: TppDBCalc;
    rptAtivGestor2Label2: TppLabel;
    rptAtivGestor2DBCalc15: TppDBCalc;
    ppLabel1: TppLabel;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    shpZebra: TppShape;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    ppLabel13: TppLabel;
    ppDBImage1: TppDBImage;
    CdsImagem: TCMClientDataSet;
    dsImagem: TDataSource;
    pplCdsImagem: TppBDEPipeline;
    pplAtivGestor2: TppBDEPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure sqlAtivGestor2FormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure FormCreate(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure shpZebraPrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlTransacoesPorGrupo : TCtrlTransacoesPorGrupo;
  public
    { Public declarations }
    sCentroResponsabilidade: string;


  end;

var
  rptAtivGestor2: TrptAtivGestor2;

implementation

uses uSistema, uModulo, uData;

{$R *.DFM}

procedure TrptAtivGestor2.CrmRptCMBeforePrint(Sender: TObject);
var bTodos: boolean;

    sCentroResp,

    smesini, smesfim, sexercicio: string;

begin
  inherited;
  bTodos := True;
  sexercicio := IntToStr(CmpRptCM.ParamValues[0].AsInteger);
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


  if Trim(CmpRptCM.ParamValues[3].AsString) <> '' then
     sCentroResp := ' - Centro de Responsabilidade:  ' + CmpRptCM.ParamValues[12].AsString
  else
     sCentroResp := '';


  if smesini <> smesfim then
    txtPerGestor2.caption := 'Período : ' + smesini + ' a ' + smesfim + ' de ' + sexercicio + sCentroResp
  else
    txtPerGestor2.caption := 'Período : ' + smesini + ' de ' + sexercicio + sCentroResp;


  if Trim(CmpRptCM.ParamValues[15].AsString) <> '' then
     txtPerGestor2.Caption := txtPerGestor2.Caption + ' Plano: ' + CmpRptCM.ParamValues[15].AsString;

  if Trim(CmpRptCM.ParamValues[16].AsString) <> '' then
     txtPerGestor2.Caption := txtPerGestor2.Caption + ' Patro: ' + CmpRptCM.ParamValues[16].AsString;


  if CmpRptCM.ParamValues[5].AsFloat <> 0 then
    rptAtivGestor2Label6.caption := 'Valores por ' +
                     FloatToStrF(CmpRptCM.ParamValues[5].AsFloat,ffNumber,18,2)
  else
    rptAtivGestor2Label6.caption := '';
  with sqlAtivGestor2 do begin
    Prepare;

    if Trim(CmpRptCM.ParamValues[13].AsString) <> '' then
       ParamByName('IDPLANO').AsString := '(C.IDPLANOPREV = ' + CmpRptCM.ParamValues[13].AsString + ') AND '
    else
       ParamByName('IDPLANO').AsString := '(1=1) AND ';

    if Trim(CmpRptCM.ParamValues[14].AsString) <> '' then
       ParamByName('IDPATRO').AsString := '(IDPATRO = ' + CmpRptCM.ParamValues[14].AsString + ') AND '
    else
       ParamByName('IDPATRO').AsString := '(1=1) AND';

    ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[9].AsInteger;

    if CmpRptCM.ParamValues[5].AsFloat = 0 then
      ParamByName('VALORDIV').AsFloat := 1
    else
      ParamByName('VALORDIV').AsFloat := CmpRptCM.ParamValues[5].AsFloat;
    ParamByName('EXERCICIO').AsInteger := CmpRptCM.ParamValues[0].AsInteger;
    ParamByName('PERIODOINI').AsInteger := CmpRptCM.ParamValues[1].AsInteger;
    ParamByName('PERIODOFIM').AsInteger := CmpRptCM.ParamValues[2].AsInteger;
    ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[9].AsInteger;
    ParamByName('IDPESSOA').AsInteger := sistema.IdEmpresa;
    if Trim(CmpRptCM.ParamValues[3].AsString) <> '' then begin
      ParamByName('CODCENTRORESPON').AsString  :=
                                       '(RTRIM(C.CODCENTRORESPON) = ''' +
                                       Trim(CmpRptCM.ParamValues[3].AsString) +
                                       ''') AND ';
      bTodos := False;
    end else begin
      ParamByName('CODCENTRORESPON').AsString  := '(1 = 1) AND ';
    end;
    Case CmpRptCM.ParamValues[4].AsInteger of
      0 : ParamByName('ORDENACAO').AsString := 'G.CODGRUPOORC, ';
      1 : ParamByName('ORDENACAO').AsString := 'G.NOMEGRUPOORCAMEN, ';
    end;

    If ( Trim( CmpRptCM.ParamValues[8].AsString ) = '' )  Then Begin
       ParamByName('TOTALGRUPO').AsString := '%';
    end
    else
    begin
       ParamByName('TOTALGRUPO').AsString := Trim(CmpRptCM.ParamValues[10].AsString) + '%';
    end;

    Case CmpRptCM.ParamValues[7].AsInteger of
      0 : ParamByName('USUARIO').AsString :=
                                 'EXISTS (SELECT UXC.IDPESSOAACESSO ' +
                                 '        FROM PESSOAXCRESP UXC ' +
                                 '        WHERE (UXC.IDPESSOAACESSO = ' + IntToStr(Sistema.idUsuario) + ') AND ' +
                                 '              (UXC.CODCENTRORESPON = C.CODCENTRORESPON) AND ' +
                                 '              (UXC.IDPESSOA = C.IDPESSOA)) AND ' + #13 + #10;
      1 : ParamByName('USUARIO').AsString :=
                                 'EXISTS (SELECT UXC.IDUSUARIO ' +
                                 '        FROM USCCUSTO UXC, COMPCONTASORCAMEN CP ' +
                                 '        WHERE (UXC.IDUSUARIO = ' + IntToStr(Sistema.idUsuario) + ') AND ' +
                                 '              (UXC.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ') AND ' +
                                 '              (CP.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
                                 '              (CP.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
                                 '              (UXC.CODCENTROCUSTO = CP.CODCENTROCUSTO) AND ' +
                                 '              (UXC.IDEMPRESA = CP.IDEMPRESA) ' +
                                 '        GROUP BY UXC.IDUSUARIO ) AND ' + #13 + #10;
    end;
    if CmpRptCM.ParamValues[6].AsBoolean then begin
      ParamByName('MOVIMENTO').AsString :=
                        '(((DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM) + ' +
                        'DECODE(VT1.VLRTRANSFORI,NULL,0,VT1.VLRTRANSFORI) - ' +
                        'DECODE(VT2.VLRTRANSFDES,NULL,0,VT2.VLRTRANSFDES) - ' +
                        'DECODE(VS.VLRSUPL,NULL,0,VS.VLRSUPL) + ' +
                        'DECODE(VR.VLRRET,NULL,0,VR.VLRRET)) <> 0) OR ' +
                        '(VT1.VLRTRANSFORI <> 0) OR ' +
                        '(VT2.VLRTRANSFDES <> 0) OR ' +
                        '(VS.VLRSUPL <> 0) OR (VR.VLRRET <> 0) OR ' +
                        '(VRE.VLRRES <> 0) OR (VCE.VLRCOMP <> 0) OR ' +
                        '((DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM) - ' +
                        'DECODE(VRE.VLRRES,NULL,0,VRE.VLRRES) - ' +
                        'DECODE(VCE.VLRCOMP,NULL,0,VCE.VLRCOMP)) <> 0)) AND ';
      bTodos := False;
    end else begin
      ParamByName('MOVIMENTO').AsString  := '(1 = 1) AND ';
    end;
    //*********************************
    If ( Trim( CmpRptCM.ParamValues[8].AsString ) = '' )  Then Begin

      ParamByName('GRUPOORCAMENTARIO').AsString  := '(1 = 1) AND ';

    End Else Begin
      If ( Trim( CmpRptCM.ParamValues[11].AsString ) = 'S' )  Then Begin

         ParamByName('GRUPOORCAMENTARIO').AsString  := '(1 = 1) AND ';
      end else begin
         ParamByName('GRUPOORCAMENTARIO').AsString :=
           '  G.IDGRUPOORCAMEN = ' + CmpRptCM.ParamValues[8].AsString + ' AND';
         bTodos := False;
      end;

    End;
    Open;
  end;

  ppLabel1.Visible := bTodos;
end;




procedure TrptAtivGestor2.sqlAtivGestor2FormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if ( sParamName = 'CODCENTRORESPON')   or ( sParamName = 'ORDENACAO') or
     ( sParamName = 'MOVIMENTO')         or ( sParamName = 'USUARIO')   or

     ( sParamName = 'IDPLANO' )          or ( sParamName = 'IDPATRO')   or

     ( sParamName = 'GRUPOORCAMENTARIO') then
    sNewValue := sOldValue;
end;




procedure TrptAtivGestor2.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);

  CdsImagem.Data := CtrlTransacoesPorGrupo.ListaImagem(Sistema.IdEmpresa);

  // Cria SQL Parametro Exercício
  with CmpRptCM.ParamValues[0].LookupSettings.SQL do begin
    Clear;
    Add('SELECT DISTINCT EXERCICIO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE IDPESSOA = ' + IntToStr(sistema.idEmpresa));
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
    Add('SELECT CODCENTRORESPON, (NOME || '' - '' || TO_CHAR(CODCENTRORESPON)) AS NOME');
    Add('FROM CENTRESPON');
    Add('WHERE IDPESSOA = ' + IntToStr(sistema.idEmpresa));
    Add('ORDER BY NOME');
  end;
end;




procedure TrptAtivGestor2.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  if Index = 0 then begin
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




procedure TrptAtivGestor2.shpZebraPrint(Sender: TObject);
begin
  inherited;
  if shpZebra.Brush.Color = clWhite then
     shpZebra.Brush.Color := $00EBEBEB
  else
     shpZebra.Brush.Color := clWhite;   
end;




procedure TrptAtivGestor2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlTransacoesPorGrupo);
  inherited;
end;

end.




