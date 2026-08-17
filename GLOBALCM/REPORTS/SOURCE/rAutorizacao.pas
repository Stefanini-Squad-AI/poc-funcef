{------------------------------------------------------------------------
data     : 19.08.2006 (sábado)
pendência: 20974
descrição: Alterei a propriedade dos labels para AutoSize = True, acertando a
           descrição dos labels.
--------------------------------------------------------------------------
data     : 17.08.2006
descrição: alteração nas funcões:
           RetornaDiferencaAutoriza
           RetornaDiferencasFuncao
-------------------------------------------------------------------------
data     : 10.08.2006
descrição: Relatório comparativo de autorizações
           Traz os registro da tabela FUNCAO e AUTORIZAÇÃO que foram eliminadas
           na nova importação de autorizações.
-------------------------------------------------------------------------}

unit rAutorizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppVar, ppBands,
  ppClass, ppCtrls, ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache,
  ppProd, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DbClient,
  uCmSqlParams, uCMClientDataSet, uCtrlPadroes;

type
  TrptParamAutoriza = class(TFrmCmReport)
    dsDifereAutoriza: TwwDataSource;
    ppAutorizacao: TppBDEPipeline;
    rpCompara: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    LblEmpresa: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppSubReportFuncao: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    LblTitMembro: TppLabel;
    ppLabel7: TppLabel;
    ppDetailBand2: TppDetailBand;
    DbtNomeMembro: TppDBText;
    DbtDescrMembro: TppDBText;
    LblTitulo: TppLabel;
    ppLabel4: TppLabel;
    ppSubReportAutorizacao: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel9: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand4: TppDetailBand;
    DbtNomeVisao: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    LblSistema: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppDifereFuncao: TppBDEPipeline;
    dsDifereFuncao: TwwDataSource;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    cdsDifereFuncao: TCMClientDataSet;
    sqlDifereFuncao: TCMSqlParams;
    cdsDifereAutoriza: TCMClientDataSet;
    sqlDifereAutoriza: TCMSqlParams;
    cdsUsuario: TCMClientDataSet;
    sqlUsuario: TCMSqlParams;
    dsUsuario: TwwDataSource;
    ppUsuario: TppBDEPipeline;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    sqlUsuarioAcesso: TCMSqlParams;
    CdsUsuarioAcesso: TCMClientDataSet;
    ppLabel2: TppLabel;
    ppLabel11: TppLabel;
    pplabel: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppShape1: TppShape;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppShape2: TppShape;
    ppLine5: TppLine;
    ppLine6: TppLine;
    sqlBackup: TCMSqlParams;
    cdsBackup: TCMClientDataSet;
    ppDBText8: TppDBText;
    dsBackup: TwwDataSource;
    ppBack: TppBDEPipeline;
    ppLabel12: TppLabel;
    ppDBText9: TppDBText;
    ppLabel13: TppLabel;
    ppDBText10: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    function RetornaDiferencasAutoriza(const iIdBackCtrl:integer;
                                       const iIdEspAcesso: integer): string;
    function RetornaDiferencasFuncao(const iIdBackCtrl:integer): string;
  public
    { Public declarations }
    destructor Destroy;override;
  end;

var
  rptParamAutoriza: TrptParamAutoriza;

implementation

{$R *.DFM}

destructor TrptParamAutoriza.Destroy;
begin
  inherited;
end;

function TrptParamAutoriza.RetornaDiferencasAutoriza(const iIdBackCtrl,
  iIdEspAcesso: integer): string;
var
  sSQL: string;
begin
  sSQL :=
   'select ab.trgdtinclusao, ab.idespacesso,                                  '+
   'ab.idoperfunc,                                                            '+
   'ab.idpessoa,                                                              '+
   'ab.idbackctrl,                                                            '+
   'fn.nomefuncao,                                                            '+

   //17.08.2006
   'fpai.nomefuncaopai,                                                       '+
   'op.nomeoperacao,                                                          '+

   // 17.08.2006
   'm.nomemodulo                                                              '+

   //17.08.2006 - ini
   'from  autorizaback ab, funcaoback fn, operfuncback opf, operacaoback op,  '+
   'modulo m,                                                             '+
   '(select fn2.idfuncao, fpai.nomefuncao as nomefuncaopai                    '+
   'from funcaoback fn2, funcaoback fpai                                      '+
   'where fn2.idfuncaopai = fpai.idfuncao                                     '+
   'and fn2.idbackctrl = fpai.idbackctrl                                      '+
   'and fpai.idbackctrl = ' + IntToStr(iIdBackCtrl)                            +
   ' and fpai.idmodulo = fn2.idmodulo                                         '+
   ') fpai                                                                    '+
   //17.08.2006 - fim

   //22.08.2006 - ini
   'where ab.idbackctrl  = ' + IntToStr(iIdBackCtrl)                           +
   ' and fn.idbackctrl   = ' + IntToStr(iIdBackCtrl)                           +
   ' and opf.idbackctrl  = ' + IntToStr(iIdBackCtrl)                           +
   ' and op.idbackctrl   = ' + IntToStr(iIdBackCtrl)                           +
   //22.08.2006 - fim


   //17.08.2006 - ini
   ' and fn.idfuncao = fpai.idfuncao                                           '+
   ' and opf.idmodulo = fn.idmodulo                                            '+
   ' and fn.idmodulo = m.idmodulo                                              '+
   //17.08.2006 - fim

   ' and ab.idoperfunc = opf.idoperfunc                                        '+
   ' and opf.idfuncao = fn.idfuncao                                            '+
   ' and opf.idoperacao = op.idoperacao                                        '+
   ' and ab.idespacesso = ' + IntToStr(iIdEspAcesso)                            +
   ' and ab.idoperfunc not in                                                    '+
   ' (select a.idoperfunc                                                      '+
   'from autoriza a                                                            '+
   //'where ab.idespacesso = a.idespacesso                                      '+
   //'and ab.idoperfunc  = a.idoperfunc                                         '+
   //'and ab.idpessoa    = a.idpessoa                                           '+
   ')                                                                          '+
   'order by m.nomemodulo, fn.nomefuncao, op.nomeoperacao                      ';
  Result := sSQL;
end;

function TrptParamAutoriza.RetornaDiferencasFuncao
(const iIdBackCtrl: integer): string;
var
  sSQL: string;
begin
  sSQL :=
    'select fn.trgdtinclusao, fn.idfuncao,                                    '+
    'fn.nomefuncao,                                                           '+

   //17.08.2006
    'fpai.nomefuncaopai,                                                      '+

    'fn.idmodulo,                                                             '+

   //17.08.2006 - ini
    'm.nomemodulo,                                                            '+

    'op.nomeoperacao                                                          '+
    'from   funcaoback fn,  operacaoback op, modulo m, operfuncback opf,      '+

   //17.08.2006 - ini
    '(select fn2.idfuncao, fpai.nomefuncao as nomefuncaopai                   '+
    'from funcaoback fn2, funcaoback fpai                                     '+
    'where fn2.idfuncaopai = fpai.idfuncao                                    '+
    'and fn2.idbackctrl = fpai.idbackctrl                                     '+
    'and fpai.idbackctrl = ' + IntToStr(iIdBackCtrl)                           +
    'and fpai.idmodulo = fn2.idmodulo                                         '+
    ') fpai                                                                   '+
   //17.08.2006 - fim


    'where  fn.idbackctrl  = ' + IntToStr(iIdBackCtrl)                         +
    'and op.idbackctrl     = ' + IntToStr(iIdBackCtrl)                         +
    ' and opf.idbackctrl    = ' + IntToStr(iIdBackCtrl)                        +
    ' and fn.idfuncao = opf.idfuncao                                          '+

   //17.08.2006 - ini
    'and fn.idfuncao = fpai.idfuncao                                          '+
    'and fn.idmodulo = m.idmodulo                                             '+
   //17.08.2006 - fim

    'and op.idoperacao = opf.idoperacao                                       '+
    'and opf.idoperfunc not in (select idoperfunc from operfunc opf1)         '+
    'order by m.nomemodulo, fn.nomefuncao, op.nomeoperacao                    ';
    Result := sSQL;
end;

procedure TrptParamAutoriza.CrmRptCMBeforePrint(Sender: TObject);
var
  sSQL1, sSQL2 : String;

begin
  inherited;

  sSQL1:= ' SELECT IDUSUARIO, NOMEUSUARIO, DESCRICAO '+
          '   FROM USUARIOSISTEMA U ';
          if cmpRptCm.ParamValues[0].AsString <> '' then
            sSQL1:= sSQL1 + '  WHERE U.NOMEUSUARIO = ' + QuotedStr(cmpRptCm.ParamValues[0].AsString);


  sqlUsuario.Prepare;
  sqlUsuario.SQL.Clear;
  sqlUsuario.SQL.Add(sSQL1);
  sqlUsuario.Open;

  sSQL2:= ' SELECT IDESPACESSO '+
          '   FROM USUARIOSISTEMA U ';
          if cmpRptCm.ParamValues[0].AsString <> '' then
          sSQL2:= sSQL2 + '  WHERE U.NOMEUSUARIO = ' + QuotedStr(cmpRptCm.ParamValues[0].AsString);

         sSQL2:= sSQL2 + ' UNION '+
          ' SELECT IDESPACESSO '+
          '   FROM USUARIOSISTEMA U, GRUPOUSU G '+
          '  WHERE U.IDUSUARIO = G.IDUSUARIO ';
          if cmpRptCm.ParamValues[0].AsString <> '' then
          sSQL2:= sSQL2 + '  AND U.NOMEUSUARIO = ' + QuotedStr(cmpRptCm.ParamValues[0].AsString);

  sqlUsuarioAcesso.Prepare;
  sqlUsuarioAcesso.SQL.Clear;
  sqlUsuarioAcesso.SQL.Add(sSQL2);
  sqlUsuarioAcesso.Open;


  sqlBackup.Prepare;
  sqlBackup.ParamByName('IDBACKCTRL').AsInteger := cmpRptCm.ParamValues[1].AsInteger;
  sqlBackup.Open;

  sqlDifereAutoriza.SQL.Text := RetornaDiferencasAutoriza
                                  (cmpRptCm.ParamValues[1].AsInteger,
                                   cdsUsuarioAcesso.FieldByName('IDESPACESSO').AsInteger);
 
  sqlDifereAutoriza.Open;
  sqlDifereFuncao.SQL.Text := RetornaDiferencasFuncao
                                  (cmpRptCm.ParamValues[1].AsInteger);

  sqlDifereFuncao.Open;
end;

end.
