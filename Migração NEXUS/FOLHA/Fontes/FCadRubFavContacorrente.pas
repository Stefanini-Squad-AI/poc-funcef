// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------

//Rotina      : (.dfm MontaSelect,  MSTerceiro), CmeCadastroFind, BtnProcuraClick
//Pendência   : SIG 21438
//Responsável : Luiz Carlos
//Data        : 23/05/2018
//Descrição   : Ajuste na Pesquisa para trazer todos os terceiros
//------------------------------------------------------------------------------
//Rotina      : (.dfm MontaSelect, ) MSTerceiro
//Pendência   : SIG 21438
//Responsável : Luiz Carlos
//Data        : 23/05/2018
//Descrição   : Ajuste na Pesquisa para trazer todos os terceiros
//------------------------------------------------------------------------------
//Rotina      : (.dfm dbgrdDet, ) qrydet
//Pendência   : SIG 21438
//Responsável : Edilaine / William Santana
//Data        : 12/06/2017
//Descrição   : pagamentos a terceiros
//------------------------------------------------------------------------------
//Pendência   : SOL 158328 Kintana 1288367
//Responsável : Vinicius Ferreira
//Data        : 29/11/2011
//Descrição   : Implementar controle da cobrança do abono anual em rubricas individuais
//---------------------------------------------------------------------------------------------------

unit FCadRubFavContacorrente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, UmensErro, wwdblook, Mask, DBCtrls, dBaseDados, uSistema,
  TREdit{$IFNDEF VER0505}, uCMTypes, wwdbedit, wwdbdatetimepicker,
  CMDateTimePicker {$ENDIF};

type
  //edilaine - SIG21438 - inicio
  TRecRetorno = record
     bExistePagto : Boolean;
     dDataPagto   : TDateTime;
  end;
  //edilaine - SIG21438 - fim

  TfrmCadRubFavContacorrente = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    qryContaBancaria: TwwQuery;
    UpdDet: TUpdateSQL;
    QryDet: TwwQuery;
    QryRubrica: TwwQuery;
    Label4: TLabel;
    DbCbRubrica: TwwDBLookupCombo;
    Bevel1: TBevel;
    dbgContasBancarias: TwwDBGrid;
    dsContaBancaria: TwwDataSource;
    Label2: TLabel;
    Label3: TLabel;
    dbreValorMinimo: TDBRealEdit;
    dbreValorMaximo: TDBRealEdit;
    dbeFavorecido: TDBEdit;
    Label5: TLabel;
    DBRealEdit1: TDBRealEdit;
    Label6: TLabel;
    DBRealEdit2: TDBRealEdit;
    qryAtualizaRubIndiv: TwwQuery;
    lblRegra: TLabel;
    dblkRegra: TwwDBLookupCombo;
    qryRegra: TwwQuery;
    dbchkAntecpAbonoFuncef: TDBCheckBox;
    dbchkAbonoAnual: TDBCheckBox;
    dbchkAntecipAbonoINSS: TDBCheckBox;
    dsRubIndiv: TwwDataSource;
    qryRubIndiv: TwwQuery;
    dbchkPagtoTerc: TDBCheckBox;
    pnlPagtoTerc: TPanel;
    dockTerceiro: TDock97;
    Toolbar972: TToolbar97;
    sbtnInsTerc: TToolbarButton97;
    sbtnAltTerc: TToolbarButton97;
    sbtnExcTerc: TToolbarButton97;
    pnlAssocia: TPanel;
    dbgrDadosTerc: TwwDBGrid;
    MSTerceiro: TMontaSelect;
    qryCtaTerceiro: TwwQuery;
    qryDetTerc: TwwQuery;
    dsDetTerc: TwwDataSource;
    qryAux: TwwQuery;
    qryValidaPerc: TwwQuery;
    pnlTerceiro: TPanel;
    lbDataInicio: TLabel;
    lbDataFim: TLabel;
    lbPercentual: TLabel;
    lblNome: TLabel;
    dbdtInicio: TCMDateTimePicker;
    dbdtFinal: TCMDateTimePicker;
    dbPercentual: TDBRealEdit;
    edtNomeTerceiro: TDBEdit;
    BtnProcura: TBitBtn;
    updDetTerc: TUpdateSQL;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure DbCbRubricaChange(Sender: TObject);

    procedure dbchkAbonoAnualMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbchkAntecpAbonoFuncefMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbchkAntecipAbonoINSSMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DbCbRubricaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure QryDetBeforePost(DataSet: TDataSet);
    procedure QryDetAfterOpen(DataSet: TDataSet);
    procedure dbchkPagtoTercClick(Sender: TObject);
    procedure BtnProcuraClick(Sender: TObject);
    procedure sbtnInsTercClick(Sender: TObject);
    procedure sbtnAltTercClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnExcTercClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    
  private
    { Private declarations }
    iIdTerceiro   : Integer;               //edilaine - SIG21438
    oOpTerceiro   : TOperacao;             //edilaine - SIG21438
    iIdRubricaOri : Integer;               //edilaine - SIG21438
    RetValidaPgto : TRecRetorno;           //edilaine - SIG21438
    bTemLancamentoTerceiro : Boolean;      //edilaine - SIG21438
    sRubExcluir : String;                 //William - SIG21438
    bdetExcluir : Boolean;                 //William - SIG21438

    //edilaine - SIG21438 - inicio
    function  ValidaDadosTerceiro : Boolean;
    function  ValidaPercentualTerceiro : Boolean;
    procedure ValidaLancamentosPagos(var Retorno : TRecRetorno);
    procedure ProcessaTerceiro;
    procedure BuscaCtaBancariaTerceiro;
    procedure AjustaDetalheTerceiro;
    procedure AbreSqlTerceiro;
    procedure FiltraSqlTerceiro;
    procedure AtivaBotoesTerceiro;
    procedure setaDadosDetTerc(idChave: integer);
    procedure excluirRubricasTerceiro;
    //edilaine - SIG21438 - fim

    Procedure AbreSqlQryDetalhe;
    Procedure AbreQryRubrica;
    Procedure AbreQryRegra;
  public
    { Public declarations }
  end;

var
  frmCadRubFavContacorrente: TfrmCadRubFavContacorrente;

implementation

Uses uDataBase, uobjfolha;

{$R *.DFM}

procedure TfrmCadRubFavContacorrente.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    qryContaBancaria.Close;
    qryContaBancaria.parambyname('PESSOA').asInteger := strToInt(MontaSelect.ValoresChave[2]); //Luiz Carlos - SIG21438
    qryContaBancaria.Open;

    if not qryContaBancaria.isempty then
    begin
      qry.Close;
      qry.parambyname('IDPESSOA').asinteger:=strToInt(MontaSelect.ValoresChave[2]); //Luiz Carlos - SIG21438
      qry.Open;

      sbtnAlterar.Enabled:=true;
      AbreQryRubrica;

      qryDet.close;
      qryDet.ParamByName('IDPESSOA').asfloat:=strtoint(MontaSelect.ValoresChave[2]);  //Luiz Carlos - SIG21438
      qryDet.open;

      AbreSqlTerceiro;   //edilaine - SIG21438
    end
    else
    begin
      sbtnAlterar.Enabled:=False;
      MsgDlg('Este Favorecido não possui conta bancária cadastrada. Favor cadastrá-la.',
             'Informação', mtWarning, [mbOk, mbHelp], 0);
    end;
  end;
end;

Procedure TfrmCadRubFavContacorrente.AbreSqlQryDetalhe;
Var sSql: String;
begin
  sSql:='SELECT PES.NOME, ABC.NUMAGENCIA, CBC.CONTACORRENTE, '+
        ' RXB.IDRUBRICA, RXB.IDPESSOA, RXB.IDCBANCARIA, '+
        ' RXB.PERCENTUAL, RXB.NUMOCORMAX, RXB.IDREGRA, R.NOMEREGRA, '+
        ' NVL(RXB.PAGTOTERC, 0) PAGTOTERC, '+                                      //edilaine - SIG21438
        ' NVL(RXB.LIMITEMINIMO,0) AS LIMITEMINIMO, '+
        ' NVL(RXB.LIMITEMAXIMO,0) AS LIMITEMAXIMO, '+
        // Vinicius Ferreira SOL 158328 KINTANA 1288367 - Inicio
        ' (SELECT FLGUSAABONO FROM RUBRICAINDIV WHERE IDFAVORECIDO = CBC.IDPESSOA AND IDRUBRICA = RXB.IDRUBRICA and rownum = 1) as FLGUSAABONO, '+
        ' (SELECT FLGANTECIPABONO FROM RUBRICAINDIV WHERE IDFAVORECIDO = CBC.IDPESSOA AND IDRUBRICA = RXB.IDRUBRICA and rownum = 1) as FLGANTECIPABONO, '+
        ' (SELECT FLGANTECIPAABONOINSS FROM RUBRICAINDIV WHERE IDFAVORECIDO = CBC.IDPESSOA AND IDRUBRICA = RXB.IDRUBRICA and rownum = 1) as FLGANTECIPAABONOINSS, ';
        // Vinicius Ferreira SOL 158328 KINTANA 1288367 - Fim
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' PRV.IDPROVENTO || '' - '' || PRV.DESCRICAO AS DESCRICAO '
  else
    sSql:=sSql+' PRV.CODPROVDESC || '' - '' || PRV.DESCRPROVDESC AS DESCRICAO ';

  sSql:=sSql+' FROM CONTABANCARIA CBC, RUBRICAXCONTABANCARIA RXB, REGRA R, '+
                  ' PROVDESC PRV, /*PARAMAPREV PAP,*/ AGENCIABANCARIA ABC, PESSOA PES '+   //edilaine - SIG21438
             ' WHERE '+
             ' CBC.IDPESSOA     = :IDPESSOA       AND '+
             ' CBC.IDCBANCARIA  = RXB.IDCBANCARIA AND '+
             ' RXB.IDRUBRICA    = PRV.IDPROVENTO  AND '+
             ' CBC.IDAGENCIA    = ABC.IDPESSOA    AND '+
             ' ABC.IDBANCO      = PES.IDPESSOA    AND '+
             ' RXB.IDREGRA      = R.IDREGRA(+) ';
  qryDet.Close;
  qryDet.Sql.Clear;
  qryDet.Sql.Add(sSql);
  QryDet.ParamByName('IDPESSOA').datatype:=ftfloat;
  qryDet.prepare;
end;

Procedure TfrmCadRubFavContacorrente.AbreQryRubrica;
 var sSql: String;
begin
  sSql:='SELECT IDPROVENTO, ';
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' IDPROVENTO || '' - '' || DESCRICAO AS DESCRICAO_RUBRICA '
  else
    sSql:=sSql+' CODPROVDESC || '' - '' || DESCRPROVDESC AS DESCRICAO_RUBRICA ';

  if CmeDetalhe.Operacao = opAlterar then
    sSql:=sSql+' FROM PROVDESC '+
               ' WHERE '+
               ' FLGTPRUBRICA LIKE ''%B%'' '
  else
    sSql:=sSql+' FROM PROVDESC '+
               ' WHERE '+
               ' FLGTPRUBRICA LIKE ''%B%'' AND '+
               ' IDPROVENTO NOT IN (SELECT IDRUBRICA FROM RUBRICAXCONTABANCARIA '+
                                    ' WHERE IDPESSOA ='+
                                      inttostr(qry.fieldbyname('IDPESSOA').asinteger)+')';
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+'ORDER BY DESCRICAO '
  else sSql:=sSql+'ORDER BY DESCRPROVDESC ';
  qryRubrica.Close;
  qryRubrica.Sql.Clear;
  qryRubrica.Sql.Add(sSql);
  qryRubrica.Open;
end;

procedure TfrmCadRubFavContacorrente.FormShow(Sender: TObject);
begin
  inherited;
  AbreSqlQryDetalhe;
  qryDet.open;
  CmeDetalhe.RepetirInsert:=false;

  bTemLancamentoTerceiro := false;   //edilaine - SIG21438
end;

procedure TfrmCadRubFavContacorrente.CmeDetalheBeforeConfirma(
  sender: TObject; var Accept: Boolean);

  var idChave: integer; //William - SIG21438
begin
  inherited;

  //edilaine - SIG21438 - inicio         
    
  if oOpTerceiro in [opInserir, opAlterar] then
  begin
    idChave := qryDetTerc.FieldByName('IDRUBRICAXCONTABANCARIATERC').AsInteger;
    if ValidaDadosTerceiro then
    begin
     setaDadosDetTerc(idChave);
     oOpTerceiro := opIdle;
     AjustaDetalheTerceiro;
     if cmeDetalhe.operacao in [opInserir] then
        FiltraSqlTerceiro;
      // ProcessaTerceiro;
    end;
    Accept:=false;
  end
  else
  begin
    if dbcbRubrica.text = '' then
    begin
      MsgDlg('Favor informar a rubrica.', 'Erro', mtWarning, [mbOk], 0);
      DbCbRubrica.setfocus;
      Accept:=false;
      exit;
    end;

    if (dbchkPagtoTerc.Checked) and (qryDetTerc.IsEmpty) then
    begin
      MsgDlg('Para pagamento para terceiros é necessário que haja pelo menos um cadastro de terceiro.', 'Erro', mtWarning, [mbOk], 0);
      Accept:=false;
      exit;
    end;

    Accept:=true;
  end;             
    
  //edilaine - SIG21438 - fim
end;

procedure TfrmCadRubFavContacorrente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Qry.Close;
  QryDet.Close;
  QryRubrica.Close;

  qryDetTerc.close;    //edilaine - SIG21438
end;

procedure TfrmCadRubFavContacorrente.CmeCadastroConfirma(Sender: TObject);
begin
  QryDet.CommitUpdates;
  //William Santana - SIG21438 - inicio
  qryDetTerc.CommitUpdates;

  if not(sRubExcluir = EmptyStr) then
   excluirRubricasTerceiro;
  //William Santana - SIG21438 - fim
end;

procedure TfrmCadRubFavContacorrente.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  AbreQryRubrica;
  FiltraSqlTerceiro;       //edilaine - SIG21438
  AjustaDetalheTerceiro; //William Santana - SIG 21438
end;

procedure TfrmCadRubFavContacorrente.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  AbreQryRubrica;
  qryContaBancaria.Locate('IDCBANCARIA',qryDet.fieldbyname('IDCBANCARIA').asinteger,[]);
  // Vinicius Ferreira SOL 158328 KINTANA 1288367 - Inicio
  qryRubIndiv.Close;
  qryRubIndiv.ParamByName('PIDFAVOREC').AsInteger   := qry.fieldbyname('IDPESSOA').value;
  qryRubIndiv.ParamByName('PIDRUB').AsInteger       := qryDet.FieldByName('IDRUBRICA').AsInteger;
  qryRubIndiv.Open;
  // Vinicius Ferreira SOL 158328 KINTANA 1288367 - Fim

  //Início - William Santana - SIG 21438
  iIdRubricaOri := qryDet.FieldByName('IDRUBRICA').AsInteger;
  FiltraSqlTerceiro;
  AjustaDetalheTerceiro;
  //Fim - William Santana - SIG 21438


end;

procedure TfrmCadRubFavContacorrente.bbtnConfirmarClick(Sender: TObject);
Var sSql: String;
begin
  inherited;
  if MsgDlg('Deseja alterar na tela de lançamentos de rubricas individuais?', 'Confirmação',
               mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
  // Vinicius Ferreira SOL 158328 KINTANA 1288367 - Inicio
  If not (qryRubIndiv.fieldByname('Qtde').asinteger = 0) then begin

     sSql:=' UPDATE RUBRICAINDIV '+
           ' SET '+
           '   VALORRUBRICA = :PPERCCALC, '+
           '   IDREGRACALCULO = :PIDREGRACALC ';
           If not (qryDet.FieldByName('FLGUSAABONO').Value = null) then
            sSql := sSql + '   ,FLGUSAABONO = :FLGUSAABONO ';
           If not (qryDet.FieldByName('FLGANTECIPABONO').Value = null) then
            sSql := sSql + '   ,FLGANTECIPABONO = :FLGANTECIPABONO ';
           If not (qryDet.FieldByName('FLGANTECIPAABONOINSS').Value = null) then
            sSql := sSql + '   ,FLGANTECIPAABONOINSS = :FLGANTECIPAABONOINSS ';
     sSql := sSql + ' WHERE '+
           '   IDFAVORECIDO = :PIDFAVOREC   AND '+
           '   IDRUBRICA    = :PIDRUB ';

    qryAtualizaRubIndiv.Close;
    qryAtualizaRubIndiv.Sql.Clear;
    qryAtualizaRubIndiv.Sql.Add(sSql);

    qryAtualizaRubIndiv.ParamByName('PPERCCALC').AsFloat      := DBRealEdit1.Value;
    qryAtualizaRubIndiv.ParamByName('PIDFAVOREC').AsInteger   := qryDet.FieldByName('IDPESSOA').AsInteger;
    qryAtualizaRubIndiv.ParamByName('PIDRUB').AsInteger       := qryDet.FieldByName('IDRUBRICA').AsInteger;
    qryAtualizaRubIndiv.ParamByName('PIDREGRACALC').AsInteger := qryDet.FieldByName('IDREGRA').AsInteger;

    If not (qryDet.FieldByName('FLGUSAABONO').Value = null) then begin
      qryAtualizaRubIndiv.ParamByName('FLGUSAABONO').datatype:=ftinteger;
      qryAtualizaRubIndiv.ParamByName('FLGUSAABONO').Value := qryDet.FieldByName('FLGUSAABONO').Value;
    End;
    If not (qryDet.FieldByName('FLGANTECIPABONO').Value = null) then begin
      qryAtualizaRubIndiv.ParamByName('FLGANTECIPABONO').datatype:=ftinteger;
      qryAtualizaRubIndiv.ParamByName('FLGANTECIPABONO').Value := qryDet.FieldByName('FLGANTECIPABONO').Value;
    End;
    If not (qryDet.FieldByName('FLGANTECIPAABONOINSS').Value = null) then begin
      qryAtualizaRubIndiv.ParamByName('FLGANTECIPAABONOINSS').datatype:=ftinteger;
      qryAtualizaRubIndiv.ParamByName('FLGANTECIPAABONOINSS').Value := qryDet.FieldByName('FLGANTECIPAABONOINSS').Value;
    End;

    qryAtualizaRubIndiv.ExecSql;

  End;
  // Vinicius Ferreira SOL 158328 KINTANA 1288367 - Fim

  End;

  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Associação de rubricas por favorecido e por conta corrente.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;
end;

procedure TfrmCadRubFavContacorrente.AbreQryRegra;
Var
  sSql : String;

begin
  qryRegra.Close;
  If SistemaFolha.FlgUsaRegraxRub = 0 Then
  Begin
    if SistemaFolha.IdGrupoRegraFolha > 0 then
    begin
      if sistemafolha.FlgAcessoTipoRegra = 0 then
      begin
        ssql:='SELECT R.IDREGRA, R.NOMEREGRA, TR.DESCREGRA, R.IDTIPOREGRA '+
              'FROM REGRA R, TIPOREGRA TR, GRUPOREGRA GR '+
              'WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA '+
              'AND TR.IDGRUPOREGRA = GR.IDGRUPOREGRA '+
              'AND GR.IDGRUPOREGRA = '+IntToStr(SistemaFolha.IdGrupoRegraFolha)+' '+
              'ORDER BY UPPER(R.NOMEREGRA)';
        qryRegra.Sql.Clear;
        qryRegra.Sql.Add(sSql);
      end
      else
      begin
        ssql:='SELECT R.IDREGRA, R.NOMEREGRA, TR.DESCREGRA, R.IDTIPOREGRA '+
              'FROM REGRA R, TIPOREGRA TR '+
              'WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA '+
              'AND R.IDTIPOREGRA IN (SELECT T1.IDTIPOREGRA '+
                                    'FROM TIPOREGRA T1 '+
                                    'WHERE T1.IDGRUPOREGRA = '+IntToStr(SistemaFolha.IdGrupoRegraFolha)+' '+
                                    'AND EXISTS (SELECT 1 '+
                                                'FROM GRUPOREGRAUSUARIO G1 '+
                                                'WHERE G1.IDUSUARIO = '+IntToStr(Sistema.IdUsuario)+' '+
                                                'AND G1.IDGRUPOREGRA = T1.IDGRUPOREGRA '+
                                                'AND G1.FLGPROCURAR = 1) '+
                                    'UNION '+
                                    'SELECT T2.IDTIPOREGRA '+
                                    'FROM TIPOREGRA T2, GRUPOREGRAUSUARIO G2 '+
                                    'WHERE T2.IDGRUPOREGRA = '+IntToStr(SistemaFolha.IdGrupoRegraFolha)+' '+
                                    'AND G2.IDUSUARIO = '+IntToStr(Sistema.IdUsuario)+' '+
                                    'AND G2.IDTIPOREGRA = T2.IDTIPOREGRA '+
                                    'AND G2.FLGPROCURAR = 1) '+
              'ORDER BY UPPER(R.NOMEREGRA)';
        qryRegra.Sql.Clear;
        qryRegra.Sql.Add(sSql);
      end;
    end
    else
    begin
      ssql:='SELECT R.IDREGRA, R.NOMEREGRA, TR.DESCREGRA, R.IDTIPOREGRA '+
            'FROM REGRA R, TIPOREGRA TR '+
            'WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA '+
            'ORDER BY UPPER(R.NOMEREGRA)';
      qryRegra.Sql.Clear;
      qryRegra.Sql.Add(sSql);
    end;
  End
  Else
  Begin
    If Trim(DbCbRubrica.Text) <> '' Then
    Begin
      if SistemaFolha.IdGrupoRegraFolha > 0 then
      begin
        if sistemafolha.FlgAcessoTipoRegra = 0 then
        begin
          ssql:='SELECT DISTINCT R.IDREGRA, R.NOMEREGRA, TR.DESCREGRA, R.IDTIPOREGRA '+
                'FROM REGRA R, TIPOREGRA TR, GRUPOREGRA GR, REGRAXRUBRICA RG '+
                'WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA '+
                'AND TR.IDGRUPOREGRA = GR.IDGRUPOREGRA '+
                'AND R.IDREGRA = RG.IDREGRA '+
                'AND RG.IDRUBRICA = '+dbcbRubrica.LookupValue+' '+
                'AND GR.IDGRUPOREGRA = '+IntToStr(SistemaFolha.IdGrupoRegraFolha)+' '+
                'ORDER BY UPPER(R.NOMEREGRA)';
          qryRegra.Sql.Clear;
          qryRegra.Sql.Add(sSql);
        end
        else
        begin
          ssql:='SELECT DISTINCT R.IDREGRA, R.NOMEREGRA, TR.DESCREGRA, R.IDTIPOREGRA '+
                'FROM REGRA R, TIPOREGRA TR, REGRAXRUBRICA RG '+
                'WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA '+
                'AND R.IDREGRA = RG.IDREGRA '+
                'AND RG.IDRUBRICA = '+dbcbRubrica.LookupValue+' '+
                'AND R.IDTIPOREGRA IN (SELECT T1.IDTIPOREGRA '+
                                      'FROM TIPOREGRA T1 '+
                                      'WHERE T1.IDGRUPOREGRA = '+IntToStr(SistemaFolha.IdGrupoRegraFolha)+' '+
                                      'AND EXISTS (SELECT 1 '+
                                                  'FROM GRUPOREGRAUSUARIO G1 '+
                                                  'WHERE G1.IDUSUARIO = '+IntToStr(Sistema.IdUsuario)+' '+
                                                  'AND G1.IDGRUPOREGRA = T1.IDGRUPOREGRA '+
                                                  'AND G1.FLGPROCURAR = 1) '+
                                      'UNION '+
                                      'SELECT T2.IDTIPOREGRA '+
                                      'FROM TIPOREGRA T2, GRUPOREGRAUSUARIO G2 '+
                                      'WHERE T2.IDGRUPOREGRA = '+IntToStr(SistemaFolha.IdGrupoRegraFolha)+' '+
                                      'AND G2.IDUSUARIO = '+IntToStr(Sistema.IdUsuario)+' '+
                                      'AND G2.IDTIPOREGRA = T2.IDTIPOREGRA '+
                                      'AND G2.FLGPROCURAR = 1) '+
                'ORDER BY UPPER(R.NOMEREGRA)';
          qryRegra.Sql.Clear;
          qryRegra.Sql.Add(sSql);
        end;
      end
      else
      begin
        ssql:='SELECT DISTINCT R.IDREGRA, R.NOMEREGRA, TR.DESCREGRA, R.IDTIPOREGRA '+
              'FROM REGRA R, TIPOREGRA TR, REGRAXRUBRICA RG '+
              'WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA '+
              'AND R.IDREGRA = RG.IDREGRA '+
              'AND RG.IDRUBRICA = '+dbcbRubrica.LookupValue+' '+
              'ORDER BY UPPER(R.NOMEREGRA)';
        qryRegra.Sql.Clear;
        qryRegra.Sql.Add(sSql);
      end;
    End;
  End;
  qryRegra.Open;
end;

procedure TfrmCadRubFavContacorrente.DbCbRubricaChange(Sender: TObject);
begin
  inherited;
  If not (dbcbRubrica.LookupValue = '') then
  AbreQryRegra;
end;

procedure TfrmCadRubFavContacorrente.dbchkAbonoAnualMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if not (DbCbRubrica.Text = '') then Begin
    if (qryRubIndiv.fieldByname('Qtde').asinteger = 0) then Begin
      MsgDlg('A rubrica não existe no histórico de rubricas individuais.', 'Erro', mtWarning, [mbOk], 0);
      Exit;
    end;
  End Else Begin
    MsgDlg('Selecione a rubrica.', 'Erro', mtWarning, [mbOk], 0);
    Exit;
  End;
end;

procedure TfrmCadRubFavContacorrente.dbchkAntecpAbonoFuncefMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if not (DbCbRubrica.Text = '') then Begin
    if (qryRubIndiv.fieldByname('Qtde').asinteger = 0) then Begin
      MsgDlg('A rubrica não existe no histórico de rubricas individuais.', 'Erro', mtWarning, [mbOk], 0);
      Exit;
    end;
  End Else Begin
    MsgDlg('Selecione a rubrica.', 'Erro', mtWarning, [mbOk], 0);
    Exit;
  End;
end;

procedure TfrmCadRubFavContacorrente.dbchkAntecipAbonoINSSMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if not (DbCbRubrica.Text = '') then Begin
    if (qryRubIndiv.fieldByname('Qtde').asinteger = 0) then Begin
      MsgDlg('A rubrica não existe no histórico de rubricas individuais.', 'Erro', mtWarning, [mbOk], 0);
      Exit;
    end;
  End Else Begin
    MsgDlg('Selecione a rubrica.', 'Erro', mtWarning, [mbOk], 0);
    Exit;
  End;
end;

procedure TfrmCadRubFavContacorrente.DbCbRubricaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If not (dbcbRubrica.LookupValue = '') then begin
    qryRubIndiv.Close;
    qryRubIndiv.ParamByName('PIDFAVOREC').AsInteger   := qry.fieldbyname('IDPESSOA').value;
    If (QryDet.State = dsInsert) then
     qryRubIndiv.ParamByName('PIDRUB').AsInteger     := QryRubrica.FieldByName('IDPROVENTO').AsInteger
    Else
     Exit;
    qryRubIndiv.Open;
  End;
end;

procedure TfrmCadRubFavContacorrente.QryDetBeforePost(DataSet: TDataSet);
begin
  qryDet.FieldByName('IDPESSOA').Value      := qry.fieldbyname('IDPESSOA').value;
  qryDet.FieldByName('IDCBANCARIA').Value   := qryContaBancaria.FieldByName('IDCBANCARIA').Value;
  qryDet.FieldByName('NOME').Value          := qryContaBancaria.FieldByName('BANCO').Value;
  qryDet.FieldByName('NUMAGENCIA').Value    := qryContaBancaria.FieldByName('NUMAGENCIA').Value;
  qryDet.FieldByName('CONTACORRENTE').Value := qryContaBancaria.FieldByName('CONTACORRENTE').Value;
  qryDet.FieldByName('DESCRICAO').Value     := qryRubrica.FieldByName('DESCRICAO_RUBRICA').Value;
  qryDet.FieldByname('NOMEREGRA').Value     := qryRegra.FieldByName('NOMEREGRA').Value;
  inherited;
end;

procedure TfrmCadRubFavContacorrente.QryDetAfterOpen(DataSet: TDataSet);
begin
  inherited;
  AbreQryRegra;
end;

//edilaine - SIG21438 - inicio
procedure TfrmCadRubFavContacorrente.dbchkPagtoTercClick(Sender: TObject);
begin
  inherited;
  pnlAssocia.enabled := dbchkPagtoTerc.Checked;

  AtivaBotoesTerceiro;
end;

procedure TfrmCadRubFavContacorrente.BtnProcuraClick(Sender: TObject);
begin
  inherited;

  // colocar o filtro para excluir o favorecido
  if MSTerceiro.Filtro.Count = 4 then
     MSTerceiro.Filtro[2] := 'PESSOA.IDPESSOA <> '+qry.FieldByName('IDPESSOA').AsString  //Luiz Carlos - SIG21438 
  else
     MSTerceiro.Filtro.Add('PESSOA.IDPESSOA <> '+qry.FieldByName('IDPESSOA').AsString);

  MSTerceiro.executar;

  if (MSTerceiro.RetornouValor) then
  begin
    iIdTerceiro := strToInt(MSTerceiro.ValoresChave[2]); //Luiz Carlos - SIG21438

    BuscaCtaBancariaTerceiro();

    if qryCtaTerceiro.isempty then
    begin
      MsgDlg('Este Terceiro não possui conta bancária cadastrada. Favor cadastrá-la.',
             'Informação', mtWarning, [mbOk, mbHelp], 0);

      edtNomeTerceiro.text := '';
      iIdTerceiro := -1;
    end
    else
    begin
      edtNomeTerceiro.text := MSTerceiro.ValoresChave[0];
    end;

  end;
  //else
//  begin
//    edtNomeTerceiro.text := '';
//    iIdTerceiro := -1;
//  end;
end;

function TfrmCadRubFavContacorrente.ValidaDadosTerceiro: Boolean;
begin
  Result := true;

  if iIdTerceiro = -1 then
  begin
    MsgDlg('É obrigatório informar o nome do terceiro a ser associado.', 'Erro', mtWarning, [mbOk], 0);
    Result := false;
  end;

  if (Result) and
     ((dbdtInicio.Date = 0) or (dbdtFinal.Date = 0)) then
  begin
    MsgDlg('Informe uma data válida.', 'Erro', mtWarning, [mbOk], 0);
    if dbdtInicio.Date = 0 then dbdtInicio.SetFocus
                           else dbdtFinal.SetFocus;
    Result := false;
  end;

  if (Result) and (dbdtInicio.Date > dbdtFinal.Date) then
  begin
    MsgDlg('Informe uma data válida.', 'Erro', mtWarning, [mbOk], 0);
    dbdtInicio.SetFocus;
    Result := false;
  end;

  if (Result) and ((dbPercentual.Value <= 0) or (dbPercentual.Value > 100)) then
  begin
    MsgDlg('O percentual informado deve estar no intervalo de 0,01 a 100,00.', 'Erro', mtWarning, [mbOk], 0);
    dbPercentual.SetFocus;
    Result := false;
  end;

  if (Result) and (ValidaPercentualTerceiro)then
  begin
    MsgDlg('A soma dos percentuais de todos os terceiros não pode ultrapassar 100%'+char(13)+char(10)+
           ' durante o mesmo intervalo, por favor insira valores válidos.', 'Erro', mtWarning, [mbOk], 0);
    dbPercentual.SetFocus;
    Result := false;
  end;

  if (Result) and (RetValidaPgto.bExistePagto) and (dbdtFinal.Date < RetValidaPgto.dDataPagto+1) then
  begin
    MsgDlg('Informe uma data válida.', 'Erro', mtWarning, [mbOk], 0);
    dbdtFinal.SetFocus;
    Result := false;
  end;

end;

procedure TfrmCadRubFavContacorrente.sbtnInsTercClick(Sender: TObject);
begin
  inherited;
  oOpTerceiro := opInserir;
  bTemLancamentoTerceiro := true;
  qryDetTerc.Insert;
  // preenche dados
  edtNomeTerceiro.Text := '';
  iIdTerceiro          := -1;
  dbdtInicio.Date      := 0;
  dbdtFinal.Date       := 0;
  dbPercentual.Value   := 0;

  BtnProcura.Enabled   := true;
  dbdtInicio.Enabled   := true;
  dbdtFinal.Enabled    := true;
  dbPercentual.Enabled := true;

  AjustaDetalheTerceiro;
end;

procedure TfrmCadRubFavContacorrente.sbtnAltTercClick(Sender: TObject);
begin
  inherited;
  oOpTerceiro := opAlterar;
  bTemLancamentoTerceiro := true;
  // preenche dados
  edtNomeTerceiro.Text := qryDetTerc.FieldByName('NOME').AsString;
  iIdTerceiro          := qryDetTerc.FieldByName('IDPESSOATERC').AsInteger;
  dbdtInicio.Date      := qryDetTerc.FieldByName('DTINICIO').AsDateTime;
  dbdtFinal.Date       := qryDetTerc.FieldByName('DTFIM').AsDateTime;
  dbPercentual.Value   := qryDetTerc.FieldByName('PERCENTUAL').AsFloat;

  AjustaDetalheTerceiro;
  BuscaCtaBancariaTerceiro();
  ValidaLancamentosPagos(RetValidaPgto);

  BtnProcura.Enabled   := not RetValidaPgto.bExistePagto;
  dbdtInicio.Enabled   := not RetValidaPgto.bExistePagto;
  dbPercentual.Enabled := not RetValidaPgto.bExistePagto;

end;

procedure TfrmCadRubFavContacorrente.sbtnExcTercClick(Sender: TObject);
var
    RetExcluir : TRecRetorno;
begin
  inherited;
  try
    try
      ValidaLancamentosPagos(RetValidaPgto);
      if RetValidaPgto.bExistePagto then
      begin
        MsgDlg('Não é possível realizar a exclusão. O terceiro possui pagamentos vinculados.', 'Erro', mtWarning, [mbOk], 0);
        exit;
      end;
            
      qryDetTerc.delete;
    except
      MsgDlg('Não foi possível excluir os dados de Pagamaneto para Terceiros!',
            'Erro',mtError,[mbOk,mbHelp],0);
    end;
  finally
    AjustaDetalheTerceiro;
  end;
end;

procedure TfrmCadRubFavContacorrente.bbtnCancelarDetClick(Sender: TObject);
begin
  //Início - William Santana - SIG 21438
  if oOpTerceiro in [opInserir, opAlterar] then
  begin
    oOpTerceiro := opIdle;
    AjustaDetalheTerceiro;
    qryDetTerc.First;
    Exit;
  end;
  if (bTemLancamentoTerceiro) then
  begin
    qryDetTerc.CancelUpdates;
    bTemLancamentoTerceiro := false;  
  end;
  inherited;
  //Fim - William Santana - SIG 21438
end;

procedure TfrmCadRubFavContacorrente.bbtnVoltarDetClick(Sender: TObject);
begin

  bbtnCancelarDet.Click; //William Santana - SIG 21438

  inherited;
end;

procedure TfrmCadRubFavContacorrente.AjustaDetalheTerceiro;
begin
  if oOpTerceiro in [opInserir, opAlterar] then
  begin
    pnlTerceiro.Visible := True;
    pnlTerceiro.BringToFront;
  end
  else
  begin
    pnlTerceiro.Visible := false;
    sbtnInsTerc.Down := False;
    sbtnAltTerc.Down := False;
    sbtnExcTerc.Down := False;
  end;
  AtivaBotoesTerceiro;    //William Santana - SIG 21438
end;

procedure TfrmCadRubFavContacorrente.AbreSqlTerceiro;
begin
  qryDetTerc.Close;
  qryDetTerc.ParamByName('IDPESSOA').AsInteger    := qry.FieldByName('IDPESSOA').AsInteger;
  qryDetTerc.Open;

  qryDetTerc.Filtered := false;

end;

procedure TfrmCadRubFavContacorrente.FiltraSqlTerceiro;
begin

  qryDetTerc.Filter := ' IDRUBRICA = '+ inttostr(qryDet.FieldByName('IDRUBRICA').AsInteger)  +
                       ' AND IDCBANCARIA = ' + inttostr(qryContaBancaria.FieldByName('IDCBANCARIA').AsInteger) ;
  qryDetTerc.Filtered := true;

  AtivaBotoesTerceiro;
end;

procedure TfrmCadRubFavContacorrente.AtivaBotoesTerceiro;
begin
  sbtnAltTerc.Enabled := (not qryDetTerc.IsEmpty) and (dbchkPagtoTerc.Checked);
  sbtnExcTerc.Enabled := (not qryDetTerc.IsEmpty) and (dbchkPagtoTerc.Checked);
  sbtnInsTerc.Enabled := dbchkPagtoTerc.Checked;
end;

function TfrmCadRubFavContacorrente.ValidaPercentualTerceiro: Boolean;
var
  rPercentual : Double;
begin
  // como os componentes não estão vinculados na qry, este controle foi feito para:
  // já considerer o percentual digitado no caso de inserção
  // e desconsiderar o percentual no case de alteração
  if oOpTerceiro = opInserir then
   rPercentual := dbPercentual.Value
  else
   rPercentual := dbPercentual.Value - qryDetTerc.FieldByName('PERCENTUAL').AsFloat;
   
  //Verificar se data estão no mesmo periodo de outras
  qryDetTerc.first;
  while not qryDetTerc.eof do
  begin
   if ((dbdtInicio.DateTime <= qryDetTerc.FieldByName('DTFIM').AsDateTime) and
       (dbdtInicio.DateTime >= qryDetTerc.FieldByName('DTINICIO').AsDateTime))
      or
      ((dbdtFinal.DateTime >= qryDetTerc.FieldByName('DTINICIO').AsDateTime) and
       (dbdtFinal.DateTime <= qryDetTerc.FieldByName('DTFIM').AsDateTime))  then
    rPercentual := rPercentual + qryDetTerc.FieldByName('PERCENTUAL').AsFloat;
    
   qryDetTerc.next;
  end;

  Result := (rPercentual > 100);

end;

procedure TfrmCadRubFavContacorrente.ValidaLancamentosPagos(var Retorno : TRecRetorno);
begin
  Retorno.dDataPagto :=  0;

  try
    qryAux.close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT MAX(P.DATAPAGAMENTO) DATAPAGAMENTO');
    qryAux.SQL.Add('  FROM PROCCONVENIODOC P ');
    qryAux.SQL.Add('  JOIN PROCONVRATEIO PR ON PR.IDPROCCONV = P.IDPROCCONV');
    qryAux.SQL.Add(' WHERE PR.IDFAVRATEIO = '+qryDetTerc.FieldByName('IDPESSOATERC').AsString );
    qryAux.SQL.Add('   AND TO_DATE('+Quotedstr(qryDetTerc.FieldByName('DATACADASTRO').AsString)+', ''DD/MM/YYYY'') < P.DATAPAGAMENTO ');
    qryAux.SQL.Add('   AND TO_DATE('+Quotedstr(qryDetTerc.FieldByName('DTINICIO').AsString)+', ''DD/MM/YYYY'') < P.DATAPAGAMENTO ');
    qryAux.SQL.Add('   AND TO_DATE('+Quotedstr(qryDetTerc.FieldByName('DTFIM').AsString)+', ''DD/MM/YYYY'') > P.DATAPAGAMENTO ');
    qryAux.Open;

    //Retorno.bExistePagto := not qryAux.IsEmpty;  //William Santana - SIG 21438
    Retorno.bExistePagto := not qryAux.FieldByName('DATAPAGAMENTO').isNull;    //William Santana - SIG 21438
    if not qryAux.eof then
       Retorno.dDataPagto := qryAux.Fields[0].AsDateTime

  finally
    qryAux.close;
  end;
end;

procedure TfrmCadRubFavContacorrente.ProcessaTerceiro;
begin
  try

    AjustaDetalheTerceiro;
  except
    MsgDlg('Não foi possível gravar os dados de Pagamaneto para Terceiros!',
            'Erro',mtError,[mbOk,mbHelp],0);
  end;
end;

procedure TfrmCadRubFavContacorrente.BuscaCtaBancariaTerceiro;
begin
  qryCtaTerceiro.close;
  qryCtaTerceiro.ParamByName('IDPESSOA').AsInteger := iIdTerceiro;
  qryCtaTerceiro.open;
end;

procedure TfrmCadRubFavContacorrente.CmeDetalheConfirma(Sender: TObject);
begin

  if (bTemLancamentoTerceiro) then   //William Santana - SIG 21438
  begin
   //esta solução alternativa é para forçar o post pois a query sai do modo insert/edit  
   qryDetTerc.edit;
   qryDetTerc.Post;
   bTemLancamentoTerceiro := false;
  end;

  if (iIdRubricaOri <> 0) and (iIdRubricaOri <> qryDet.FieldByName('IDRUBRICA').AsInteger) and not(bdetExcluir) then
  begin
    try
      //William Santana - SIG 21438 - inicio

       qryDetTerc.first;
       while not qryDetTerc.eof do
       begin
        qryDetTerc.edit;
        qryDetTerc.FieldByName('IDRUBRICA').AsInteger := qryDet.FieldByName('IDRUBRICA').AsInteger;
        qryDetTerc.post;
       end;
      //William Santana - SIG 21438 - Fim

    except
      MsgDlg('Não foi possível atualizar a rubrica para Terceiros!',
            'Erro',mtError,[mbOk,mbHelp],0);
    end;
  end;

   inherited;
end;

procedure TfrmCadRubFavContacorrente.setaDadosDetTerc(idChave: integer);
begin

  if (bTemLancamentoTerceiro) then
  begin
    if (oOpTerceiro = opInserir) then
    begin
     qryDetTerc.Insert;
     qryDetTerc.FieldByName('IDRUBRICAXCONTABANCARIATERC').AsInteger := LeUltRegistro(nil, 'RUBRICAXCONTABANCARIATERC');
    end;

    if (oOpTerceiro = opAlterar) then
    begin
      qryDetTerc.locate('IDRUBRICAXCONTABANCARIATERC',idChave,[]);
      qryDetTerc.Edit;
    end;
    
    qryDetTerc.FieldByName('NOME').AsString              := edtNomeTerceiro.text;
    qryDetTerc.FieldByName('IDPESSOATERC').AsInteger     := iIdTerceiro;
    qryDetTerc.FieldByName('DTINICIO').AsDateTime        := dbdtInicio.date;
    qryDetTerc.FieldByName('DTFIM').AsDateTime           := dbdtFinal.date;
    qryDetTerc.FieldByName('PERCENTUAL').AsFloat         := dbPercentual.Value;
    qryDetTerc.FieldByName('IDPESSOATERC').AsInteger     := iIdTerceiro;
    qryDetTerc.FieldByName('IDCBANCARIATERC').AsInteger  := qryCtaTerceiro.FieldByName('IDCBANCARIA').AsInteger;
    qryDetTerc.FieldByName('IDPESSOA').AsInteger         := qry.FieldByName('IDPESSOA').AsInteger;  // favorecido
    qryDetTerc.FieldByName('IDCBANCARIA').AsInteger      := qryContaBancaria.FieldByName('IDCBANCARIA').AsInteger;
    qryDetTerc.FieldByName('IDRUBRICA').AsInteger        := QryRubrica.FieldByName('IDPROVENTO').AsInteger;

    qryDetTerc.Post;
  end;

end;

procedure TfrmCadRubFavContacorrente.excluirRubricasTerceiro;
begin
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.Add('DELETE FROM RUBRICAXCONTABANCARIATERC WHERE');
  qryAux.sql.Add(' IDPESSOA = ' + inttostr(qry.FieldByName('IDPESSOA').AsInteger) );
  qryAux.sql.Add(' AND IDCBANCARIA = ' + inttostr(qryContaBancaria.FieldByName('IDCBANCARIA').AsInteger));
  qryAux.sql.Add(' AND IDRUBRICA in (' + sRubExcluir + '0)');
  qryAux.ExecSql;

  sRubExcluir := '';

end;

procedure TfrmCadRubFavContacorrente.sbtnExcluiDetClick(Sender: TObject);
begin
  sRubExcluir := sRubExcluir + inttostr(qryDet.FieldByName('IDRUBRICA').AsInteger) +',';
  bdetExcluir := true;
  inherited;   
end;

procedure TfrmCadRubFavContacorrente.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  sRubExcluir := '';
  bdetExcluir := false;
end;
//edilaine - SIG21438 - fim

End.


(*
|------------------procedure TfrmCadRubFavContacorrente.sbtnApagarClick(Sender: TObject);
begin
  inherited;

end;

------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/12/2002 A 26/12/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF) - Pendência 10653.                                         |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Permitir a inclusão de mais de uma rubrica       |
|  associada a uma mesma conta corrente.                                       |
| Alteração da tabela "RubricaxContaBancaria". Modificação da qryRubrica,      |
| Modificação da qryDet, updDet, Modificações na tela.                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 05/05/2003 A 05/05/2003                         |
| PENDÊNCIA: 13838                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05a                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO DO MENU DE ACESSO AO CADASTRO DE ASSOC RUB POR FAV POR CONTA     |
| CORRENTE PARA CONTA BANCÁRIA.                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 05/05/2003 A 06/05/2003                         |
| PENDÊNCIA: 13911                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05a                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Não está permitindo a alteração da conta bancária vinculada a uma rubrica.   |
| Remodelação interna completa dos eventos dos componentes da tela de forma    |
| que esta fique de acordo com o Padrão.                                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================|
*)
