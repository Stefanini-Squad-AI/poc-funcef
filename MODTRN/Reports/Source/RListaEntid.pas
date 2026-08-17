// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  13/05/2009
// Pendência   : SOL 116806 KINTANA 549481
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RListaEntid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands,
  ppPrnabl, ppCache, TXRB, USistema;

type
  TRptListaEntid = class(TFrmCmReport)
    rpListaEntid: TppReport;
    ppListaEntid: TppBDEPipeline;
    dsListaEntid: TwwDataSource;
    CdsListaEntid: TCMClientDataSet;
    sqlListaEntid: TCMSqlParams;
    ppHeaderBand1: TppHeaderBand;
    rpListaEntidBandaInstrutor: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lblNossaEmpresa: TppLabel;
    ppLabel1: TppLabel;
    ppGroup1: TppGroup;
    rpListaEntidBandaEmpresa: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    rpListaEntidEndereco: TppDBText;
    rpListaEntidTelefone: TppDBText;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    rpListaEntidSmryBnd: TppSummaryBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpListaEntidBandaInstrutorBeforePrint(Sender: TObject);
    procedure rpListaEntidBandaEmpresaBeforePrint(Sender: TObject);
    procedure CdsListaEntidAfterOpen(DataSet: TDataSet);
    procedure CdsListaEntidAfterScroll(DataSet: TDataSet);
    procedure rpListaEntidSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptListaEntid: TRptListaEntid;

implementation

uses fAguarde;

{$R *.DFM}

procedure TRptListaEntid.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlListaEntid.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT E.NOME, E.RAZAOSOCIAL, I.NOME AS INSTRUTOR,');
    Add('   UPPER(E.NOME) AS UPNOME, UPPER(E.RAZAOSOCIAL) AS UPRAZAO,');
    Add('RTRIM(EP.LOGRADOURO) || '' '' || RTRIM(EP.NUMERO) || '' '' || RTRIM(EP.COMPLEMENTO)');
    Add(' || '' ''  || RTRIM(EP.BAIRRO) || '' '' || RTRIM(EP.CEP) || ');
    Add(''' '' || RTRIM(CI.NOME) || '' ''  || RTRIM(EP.CODESTADO) AS ENDERECO, ');
    Add('RTRIM(TELEFONE.DDI) || '' '' || TELEFONE.DDD || '' '' || TELEFONE.NUMERO AS TELEFONE');

    Add('FROM PESSOA E, PESSOA I, CURSO C, ENDPESS EP, CIDADES CI,');

    Add('(SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.DDI, TE.NUMERO');
    Add(' FROM');
    Add(' TELENDPESS TE,');
    Add(' (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('  FROM     TELENDPESS');
    Add('  GROUP BY IDENDERECO) END');
    Add(' WHERE');
    Add(' (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE');
    Add('WHERE E.IDPESSOA = C.IDENTIDINSTR');

    if CmpRptCM.ParamByName('ListaTipo').asString <> '' then
      Add('AND   C.IDTIPOCURSO IN (' +CmpRptCM.ParamByName('ListaTipo').asString+ ')');

    Add('AND E.IDPESSOA          = I.IDGRUPO(+)');
    Add('AND E.IDPESSOA          = EP.IDPESSOA(+)');
    Add('AND E.IDENDCOMERCIAL    = EP.IDENDERECO(+)');
    Add('AND EP.IDCIDADES        = CI.IDCIDADES(+)');
    Add('AND E.IDENDCOMERCIAL    = TELEFONE.IDENDERECO(+)');

    Add('UNION');
    Add('SELECT DISTINCT E.NOME, E.RAZAOSOCIAL, I.NOME AS INSTRUTOR,');
    Add('   UPPER(E.NOME) AS UPNOME, UPPER(E.RAZAOSOCIAL) AS UPRAZAO,');
    Add('RTRIM(EP.LOGRADOURO) || '' '' || RTRIM(EP.NUMERO) || '' '' || RTRIM(EP.COMPLEMENTO)');
    Add(' || '' ''  || RTRIM(EP.BAIRRO) || '' '' || RTRIM(EP.CEP) || ');
    Add(''' '' || RTRIM(CI.NOME) || '' ''  || RTRIM(EP.CODESTADO) AS ENDERECO, ');
    Add('RTRIM(TELEFONE.DDI) || '' '' || TELEFONE.DDD || '' '' || TELEFONE.NUMERO AS TELEFONE');

    Add('FROM PESSOA E, PESSOA I, HSTTRN H, ENDPESS EP, CIDADES CI,');
    Add('(SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.DDI, TE.NUMERO');
    Add(' FROM');
    Add(' TELENDPESS TE,');
    Add(' (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('  FROM     TELENDPESS');
    Add('  GROUP BY IDENDERECO) END');
    Add(' WHERE');
    Add(' (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE');

    if CmpRptCM.ParamByName('ListaTipo').asString <> '' then
      Add(', CURSO C');

    Add('WHERE E.IDPESSOA = H.IDENTIDINSTR');

    if CmpRptCM.ParamByName('ListaTipo').asString <> '' then
    begin
      Add('AND H.IDCURSO  = C.IDCURSO');
      Add('AND   C.IDTIPOCURSO IN (' +CmpRptCM.ParamByName('ListaTipo').asString+ ')');
    end;

    Add('AND E.IDPESSOA          = I.IDGRUPO(+)');
    Add('AND E.IDPESSOA          = EP.IDPESSOA(+)');
    Add('AND E.IDENDCOMERCIAL    = EP.IDENDERECO(+)');
    Add('AND EP.IDCIDADES        = CI.IDCIDADES(+)');
    Add('AND E.IDENDCOMERCIAL    = TELEFONE.IDENDERECO(+)');

    Add('ORDER BY ' + IntToStr(CmpRptCM.ParamByName('SeqRelat').asInteger + 4));

//    SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlListaEntid.Open;
end;

procedure TRptListaEntid.rpListaEntidBandaInstrutorBeforePrint(Sender: TObject);
begin
  rpListaEntidBandaInstrutor.Visible := CdsListaEntid.FieldByName('Instrutor').asString <> '';
end;

procedure TRptListaEntid.rpListaEntidBandaEmpresaBeforePrint(Sender: TObject);
begin
  if (Trim(CdsListaEntid.FieldByName('Endereco').asString) <> '') or
     (Trim(CdsListaEntid.FieldByName('Telefone').asString) <> '') then
  begin
    rpListaEntidBandaEmpresa.Height := 0.4271;
    rpListaEntidEndereco.Top := 0.25;
    rpListaEntidTelefone.Top := 0.25;
  end
  else
    rpListaEntidBandaEmpresa.Height := 0.228;
end;

procedure TRptListaEntid.CdsListaEntidAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptListaEntid.CdsListaEntidAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptListaEntid.rpListaEntidSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
