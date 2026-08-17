// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
// Autor(a)  : Everson Luiz Pereira da Cunha
// Data      : 20/02/2018
// Pendencia : SIG TIBERO
// Alteração : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//             Retirada de INDEX, +rule etc.
//             Melhoria realizada para adaptação ao TIBERO.
//------------------------------------------------------------------------------
// Autor(a)  : Thiago Melo
// Rotina    : -
// Data      : 03/10/2007
// Pendencia : SOL 206252 Kinanta 1997935
// Alteração : Funcionalidade sem "Commit"
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : -
// Data      : 03/10/2007
// Pendencia : 26493
// Alteração : Correcão do tamanho do texto que é gravado na descrição da TMPDESC.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : -
// Data      : 03/10/2007
// Pendencia : 26490
// Alteração : Tocar o tipo do campo SISTORIGEM de VarChar(2) para Number.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Ajuste em querys
// Data      : 15/01/2007
// Pendencia : 18554
// Alteração : Tratar o campo SITENVIO como CHAR, colocando plics quando
//   necessário.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 13/11/2006
// Rotina      : bbtnConfirmarClick
// Pendência   : 21559
// Descricao   : Gravar o campo IdSeqInternoFB na inclusão de registros na Tmpdesc.
//------------------------------------------------------------------------------
unit FCadTmpDesc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  Mask, wwdbedit, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList, Wwdotdot, Wwdbcomb, CMProcuraMask, uIntegraBack,
  uSistema;

type
  TfrmCadTmpDesc = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label1: TLabel;
    DBText1: TDBText;
    qryLote: TwwQuery;
    Label2: TLabel;
    DBText2: TDBText;
    grpMesAnoRef: TGroupBox;
    Label10: TLabel;
    edAnoRef: TEdit;
    edMesRef: TEdit;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    edAnoCob: TEdit;
    edMesCob: TEdit;
    dbrgrpAtrasoDevol: TDBRadioGroup;
    qryRubrica: TwwQuery;
    GroupBox2: TGroupBox;
    lbRubrica: TLabel;
    dblkpcmbRubrica: TwwDBLookupCombo;
    lblValor: TLabel;
    dbeValor: TDBEdit;
    lblDataPagamento: TLabel;
    DBDateEdit1: TCMDateTimePicker;
    dblkpcmbLote: TwwDBLookupCombo;
    Label17: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    dbeValorRecebido: TDBEdit;
    Label7: TLabel;
    dbeSituacao: TDBEdit;
    Label8: TLabel;
    dbeLotePrevia: TDBEdit;
    Label3: TLabel;
    RdgTipoReg: TRadioGroup;
    LabelAviso: TLabel;
    lbOrigemRubrica: TLabel;
    dbcbOrigemRubrica: TwwDBComboBox;
    cmContaD: TCMProcuraMaskContabil;
    grpFavorecidoOutros: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    sbtnAddFavOutros: TSpeedButton;
    sbtnRemFavOutros: TSpeedButton;
    edCPFFavOutros: TEdit;
    edNomeFavOutros: TEdit;
    MontaSelectFAV: TMontaSelect;
    qryAux: TwwQuery;
    cmContaC: TCMProcuraMaskContabil;
    mskedMes: TMaskEdit;
    lblMotivo: TLabel;
    dblkMotivo: TwwDBLookupCombo;
    qryMotivo: TwwQuery;
    GroupBox3: TGroupBox;
    dbcbProcessar: TDBCheckBox;
    qryConvenios: TwwQuery;
    rgPlanos: TRadioGroup;
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure dbrgrpAtrasoDevolExit(Sender: TObject);
    procedure dblkpcmbRubricaEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure RdgTipoRegClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnAddFavOutrosClick(Sender: TObject);
    procedure sbtnRemFavOutrosClick(Sender: TObject);
    procedure dblkpcmbRubricaChange(Sender: TObject);
    procedure mskedMesExit(Sender: TObject);
    procedure mskedMesKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure qryDetAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    bInsere,bAltera,bExclui : Boolean;
    Procedure EnabButtons(St:Boolean);
    procedure AbreQryDet(aidtitular, aidpessoa: integer);
    Procedure AtribEdits(St:Boolean);
    Procedure SqlQryRubricas;
    function VerificaPessoaFisica(aiidpessoa: integer): boolean;
    procedure ControlaContaContabil;
    procedure ControlaRubricaConvenio;
    Function Atualiza(sSql,Ms:String):Boolean;
    procedure AbreqryRubricas (sTipo:String);
  public
    { Public declarations }
    liidtitular, liidpessoa, liidpessjur: integer;
    bExcluiDet, bErro, bConfirmou : Boolean; 
  end;

var frmCadTmpDesc: TfrmCadTmpDesc;


implementation

uses
  uObjFolha, UMensErro, UDataBase, DAPrev, UContribuicaoPrevFB, DBaseDados,
  UModulo, uAdmPrevFB;

{$R *.DFM}

Procedure TfrmCadTmpDesc.EnabButtons(St:Boolean);
begin
  BbtnCancelar.Enabled  := St;
  BbtnSair.Enabled      := St;
  BbtnConfirmar.Enabled := St;

  dbgrdDet.Enabled      := St;
end;

Procedure TfrmCadTmpDesc.AtribEdits(St:Boolean);
begin
  EdAnoRef.ReadOnly:=St;
  EdMesRef.ReadOnly:=St;
  EdAnoCob.ReadOnly:=St;
  EdMesCob.ReadOnly:=St;
  DbrGrpAtrasoDevol.ReadOnly:=St;
  DbLkPcmbRubrica.ReadOnly:=St;
  DbDateEdit1.ReadOnly:=St;
  dbeValorRecebido.ReadOnly:=St;
  DbLkPcmBLote.ReadOnly:=St;
  dbeSituacao.ReadOnly:=St;
  CmDateTimePicker1.ReadOnly:=St;
  dbeLotePrevia.ReadOnly:=St;
  dbeValor.ReadOnly:=St;
  dbcbProcessar.ReadOnly:=St;
  LabelAviso.Visible:=St and (qryDet.fieldbyname('sitenvio').AsString<>'0');
  sbtnExcluiDet.enabled:=(qry.state = dsEdit) and not st;
end;

procedure TfrmCadTmpDesc.AbreqryRubricas (sTipo:String);
var
   ssql : String;
begin
  If sistemafolha.FlgUsaCodRubExt = 0 Then
  Begin
    qryRubrica.close;
    qryRubrica.sql.clear;
    ssql := ' SELECT P.IDPROVENTO, P.FLGDESCONTO, P.FLGOBRIGAFAVOREC, '+
            ' P.IDPROVENTO AS CODIGO, P.DESCRICAO,  '+
            ' IDPROVENTO||'' - ''||DESCRICAO AS JUNCAO '+
            ' FROM PROVDESC  P '+
            ' WHERE P.FLGATRASODEVOL = '+QuotedStr(stipo)+' ';

    If bInsere then
    begin
         If sTipo = 'N' then
           ssql := ssql + ' AND P.IDPROVENTO NOT IN (SELECT C.IDRUBRICA FROM CONTPREV C '+
                          ' WHERE ((C.IDRUBRICA = P.IDPROVENTO) OR (C.IDRUBDECTERC = P.IDPROVENTO))) ';
         If sTipo  = 'A' then
           ssql := ssql + ' AND P.IDPROVENTO NOT IN (SELECT C.IDRUBRICA FROM CONTPREV C '+
                          ' WHERE ((C.IDRUBRICAATRASO = P.IDPROVENTO) OR (C.IDRUBDECTERCATRA = P.IDPROVENTO))) ';
         If sTipo = 'D' then
           ssql := ssql + ' AND P.IDPROVENTO NOT IN (SELECT C.IDRUBRICA FROM CONTPREV C '+
                          ' WHERE ((C.IDRUBRICADEVOLUC = P.IDPROVENTO) OR (C.IDRUBDECTERCDEVOL = P.IDPROVENTO))) ';
    end;
    ssql := ssql + ' ORDER BY P.DESCRICAO ';
    qryRubrica.sql.add(ssql);
    qryRubrica.open;
  End
  Else
  Begin
    qryRubrica.close;
    qryRubrica.sql.clear;
    ssql := ' SELECT P.IDPROVENTO, P.FLGDESCONTO, P.FLGOBRIGAFAVOREC, '+
            ' P.IDPROVENTO AS CODIGO, P.DESCRICAO,  '+
            ' CODPROVDESC||'' - ''||DESCRPROVDESC AS JUNCAO '+
            ' FROM PROVDESC  P '+
            ' WHERE P.FLGATRASODEVOL = '+QuotedStr(stipo)+' ';
    If bInsere then
    begin
         If sTipo = 'N' then
           ssql := ssql + ' AND P.IDPROVENTO NOT IN (SELECT C.IDRUBRICA FROM CONTPREV C '+
                          ' WHERE ((C.IDRUBRICA = P.IDPROVENTO) OR (C.IDRUBDECTERC = P.IDPROVENTO))) ';
         If sTipo  = 'A' then
           ssql := ssql + ' AND P.IDPROVENTO NOT IN (SELECT C.IDRUBRICA FROM CONTPREV C '+
                          ' WHERE ((C.IDRUBRICAATRASO = P.IDPROVENTO) OR (C.IDRUBDECTERCATRA = P.IDPROVENTO))) ';
         If sTipo = 'D' then
           ssql := ssql + ' AND P.IDPROVENTO NOT IN (SELECT C.IDRUBRICA FROM CONTPREV C '+
                          ' WHERE ((C.IDRUBRICADEVOLUC = P.IDPROVENTO) OR (C.IDRUBDECTERCDEVOL = P.IDPROVENTO))) ';
    end;
    ssql := ssql + ' ORDER BY P.DESCRICAO ';
    qryRubrica.sql.add(ssql);
    qryRubrica.open;
  End;
end;


Procedure TfrmCadTmpDesc.SqlQryRubricas;
Var sSql: String;
begin
  sSql:='SELECT IDPROVENTO, FLGDESCONTO, FLGOBRIGAFAVOREC, ';
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' IDPROVENTO AS CODIGO, DESCRICAO, '+
               ' IDPROVENTO||'' - ''||DESCRICAO AS JUNCAO '
  else sSql:=sSql+' CODPROVDESC AS CODIGO, DESCRPROVDESC AS DESCRICAO, '+
                  ' CODPROVDESC||'' - ''||DESCRPROVDESC AS JUNCAO ';
  sSql:=sSql+' FROM PROVDESC '+
             ' WHERE  FLGATRASODEVOL = :FLGATRASODEVOL ';
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' ORDER BY DESCRICAO '
  else sSql:=sSql+' ORDER BY DESCRPROVDESC ';
  With qryRubrica do
  begin
    Close;
    Sql.Clear;
    Sql.Add(sSql);
    Params[0].DataType:=ftString;
  end; {With}
end;

procedure TfrmCadTmpDesc.AbreQryDet(aidtitular, aidpessoa: integer);
 var ssql: String;
begin
  inherited;
  ssql:='';
  ssql:='SELECT T.IDPROVENTO,T.DATACOBRANCA,T.DATARECEBIMENTO, '+
        'P.CODPROVDESC,'; 
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' P.DESCRICAO, '
  else sSql:=sSql+' P.DESCRPROVDESC AS DESCRICAO, ';
  sSql:=sSql+
    'T.FLGATRASODEVOL,T.FLGDESCFOLHA,P.FLGDESCONTO,T.FLGTIPODESC,'+
    'T.IDFAVORECIDO,T.IDLOTE,T.IDMOTIVO,T.IDPESSJUR,T.IDPESSOA,'+
    'T.IDMODULO, T.SISTORIGEM, '+
    'T.IDPLANOPREV,T.IDPROVENTO,T.IDTITULAR,T.MESCOBRANCA,T.MESREFERENCIA,'+
    'T.REFERENCIA,T.SEQPROPOSTA,T.SITENVIO,T.VALOR,T.VALORINFO, NVL(T.FLGNAOPROCESSA,0) AS FLGNAOPROCESSA, '+
    'T.VALORRECEBIDO,T.LOTEPREVIA,T.TRGDTINCLUSAO,T.PLACONTAC,T.PLACONTAD,'+
    'DECODE(T.FLGTIPODESC,''A'',''Assistencial'',''C'',''Convênio'',''E'',''Empréstimo'', '+
    '''P'',''Previdenciário'',''Não identificado'') AS ORIGEM, T.ROWID, T.FLGMANUAL, '+
{    'IDTMPDESC, '+      //Everson TIBERO
    'IDSEQINTERNOFB '+}  //Everson TIBERO
    'T.IDTMPDESC, '+     //Everson TIBERO
    'T.IDSEQINTERNOFB '+ //Everson TIBERO
    ' FROM TMPDESC T, PROVDESC P'+
    ' WHERE (T.IDTITULAR = '+inttostr(aidtitular)+')'+
    ' AND (T.IDPESSOA = '+inttostr(aidpessoa)+')';

  case RdgTipoReg.ItemIndex Of
    1 : ssql:=ssql+'AND (T.LOTEPREVIA IS NOT NULL)';
    2 : ssql:=ssql+'AND (T.LOTEPREVIA IS NULL)';
  end;

  if mskedMes.Text <> '    /  ' then
    ssql:=ssql+' AND (T.MESCOBRANCA = '+QuotedStr(Trim(mskedMes.Text))+')';

  ssql:=ssql+' AND (P.IDPROVENTO = T.IDPROVENTO) '+
    'AND (T.FLGDESCFOLHA = ''B'') '+  
    'ORDER BY T.MESCOBRANCA DESC, T.MESREFERENCIA DESC, T.FLGDESCONTO DESC';

  qryDet.Close;
  qryDet.SQL.Clear;
  qryDet.SQL.Add(ssql);
  qryDet.Open;
end;

procedure TfrmCadTmpDesc.CmeCadastroFind(Sender: TObject);
var
  sSQL : String;
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[3] <> '') then
  begin
    liidtitular:=strtoint(MontaSelect.ValoresChave[2]);
    liidpessoa:=strtoint(MontaSelect.ValoresChave[3]);
    liidpessjur:=strtoint(MontaSelect.ValoresChave[0]);

    // Daniel Begnami - 92874_399070 - 14/08/2008
    sSQL := 'SELECT P.NOME, P.NUMDOCUMENTO, P.IDPESSOA, BF.IDPLANOPREV, '+
            '       BF.IDTITULAR, BF.IDPESSOA, BF.IDBENEFICIO, BF.SEQPROPOSTA, BF.IDPESSJUR '+
            'FROM   PESSOA P, BFCIARIOTITPLAN BTIT, BENEFBFCIARIO BF, PARTPREVPLAN PP '+
            'WHERE  P.IDPESSOA = '+IntToStr(liidpessoa)+
            '  AND  BF.IDTITULAR = '+IntToStr(liidtitular)+
            '  AND  BF.IDPLANOPREV   = BTIT.IDPLANOPREV '+
            '  AND  BF.IDTITULAR     = BTIT.IDTITULAR '+
            '  AND  BF.IDPESSOA      = BTIT.IDPESSOA '+
            '  AND  BF.IDBENEFICIO = BTIT.IDBENEFICIO '+
            '  AND  BF.SEQPROPOSTA   = BTIT.SEQPROPOSTA '+
            '  AND  BF.IDPESSJUR     = BTIT.IDPESSJUR '+
            '  AND  PP.IDPLANOPREV   = BTIT.IDPLANOPREV '+
            '  AND  PP.IDPESSOA      = BTIT.IDTITULAR '+
            '  AND  PP.IDPESSJUR     = BTIT.IDPESSJUR '+
            '  AND  ((BTIT.IDPESSOA = P.IDPESSOA) OR (BTIT.IDRESPONSAVEL = P.IDPESSOA))';

    if rgPlanos.ItemIndex = 1 then
      sSQL := sSQL + '  AND  PP.FLGDESATIVADO = 0 '
    else if rgPlanos.ItemIndex = 2 then
      sSQL := sSQL + '  AND  PP.FLGDESATIVADO = 1 ';

    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add(sSQL);

//    qry.parambyname('IdTitular').asinteger:=liidtitular;
//    qry.parambyname('IdPessoa').asinteger:=liidpessoa;

    qry.Open;
    // Fim 92874_399070

    AbreQryDet(liidtitular, liidpessoa);
  end;
end;

procedure TfrmCadTmpDesc.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  edAnoRef.Text := Copy(qryDet.FieldByName('MesReferencia').AsString,1,4);
  edMesRef.Text := Copy(qryDet.FieldByName('MesReferencia').AsString,6,2);
  edAnoCob.Text := Copy(qryDet.FieldByName('Mescobranca').AsString,1,4);
  edMesCob.Text := Copy(qryDet.FieldByName('Mescobranca').AsString,6,2);
  AbreqryRubricas(qryDet.fieldbyname('FLGATRASODEVOL').AsString);
  ControlaContaContabil;
end; 

procedure TfrmCadTmpDesc.CmeCadastroConfirma(Sender: TObject);
begin
  try
    qry.CancelUpdates;
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
  // Thiago Melo SOL 206252 Kinanta 1997935
  //Modulo.GravaLogTOTALPREV ('Lançamento Manual para Folha de Benefício. - '+qry.FieldByName('NOME').AsString);
  // Thiago Melo SOL 206252 Kinanta 1997935
  AbreQryDet(liidtitular, liidpessoa);
end; 

procedure TfrmCadTmpDesc.CmeDetalheConfirma(Sender: TObject);
begin
  if (qryDet.State in [dsEdit,dsInsert]) then
  begin
    if qryDet.fieldbyname('FLGATRASODEVOL').isnull then
    begin
      MsgDlg('Tipo da Rubrica deve ser informado.','Erro',mtError,[mbOk,mbHelp],0);
      dbrgrpAtrasoDevol.setfocus;
      Exit;
    end;

    if qryDet.fieldbyname('IDPROVENTO').isnull then
    begin
      MsgDlg('Rubrica deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
      dblkpcmbRubrica.setfocus;
      Exit;
    end;

    if (qryRubrica.fieldbyname('FLGOBRIGAFAVOREC').asinteger = 1) then
    begin
      if edNomeFavOutros.text = '' then
      begin
        MsgDlg('É obrigatório o preenchimento do Favorecido para o lançamento desta rubrica.','Erro',mtError,[mbOk,mbHelp],0);
        exit;
      end;
    end;

    if qryDet.FieldByName('IDSEQINTERNOFB').isnull then
      qryDet.FieldByName('IDSEQINTERNOFB').asinteger := LeUltRegistro(nil, 'SEQINTERNOFB');

  end;
  inherited;
  EnabButtons(True);
  AtribEdits(True);
end; // CmeDetalhe.Confirma(Self)

procedure TfrmCadTmpDesc.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryDet.State = dsInsert then
  begin
    qryDet.FieldByName('IDTMPDESC').AsInteger := LeUltRegistro(Nil, 'TMPDESC');
    qryDet.FieldByName('IDTITULAR').AsInteger:=qry.FieldByName('IDTITULAR').AsInteger;
    qryDet.FieldByName('IDPESSJUR').AsInteger:=qry.FieldByName('IdPessJur').AsInteger;
    qryDet.FieldByName('IDPESSOA').AsInteger:=qry.FieldByName('IdPessoa').AsInteger;
    qryDet.FieldByName('SEQPROPOSTA').AsInteger:=qry.FieldByName('SeqProposta').AsInteger;
    qryDet.FieldByName('SITENVIO').AsString:='0';

    if dbrgrpAtrasoDevol.ItemIndex = 2 then
      qryDet.FieldByName('IDMOTIVO').AsInteger:=prmIdMotivoDevolBen
    else
      qryDet.FieldByName('IDMOTIVO').AsInteger:=prmIdMotivoFolhaBen;
    qryDet.FieldByName('FLGMANUAL').AsInteger:=1;
    qryDet.Fieldbyname('SISTORIGEM').asInteger := 18;
    qryDet.Fieldbyname('IDMODULO').asInteger := 18;
  end
  else
    if qryDet.FieldByName('FLGMANUAL').AsInteger = 0 then
      qryDet.FieldByName('FLGMANUAL').AsInteger:=2;
  //ATUALIZAR PARA O PLANO NOVO SE LANÇAMENTO FOI FEITO NO PLANO ANTIGO
  qryDet.FieldByName('IDPLANOPREV').AsInteger:=qry.FieldByName('IdPlanoPrev').AsInteger;
  qryDet.FieldByName('MESREFERENCIA').AsString:=Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text);
  qryDet.FieldByName('MESCOBRANCA').AsString:=Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text);

  qryDet.FieldByName('DESCRICAO').AsString := Copy(qryRubrica.FieldByName('DESCRICAO').AsString, 1, 40);
    
  qryDet.FieldByName('FLGDESCFOLHA').AsString:='B';
  qryDet.FieldByName('FLGDESCONTO').AsString:=qryRubrica.FieldByName('FLGDESCONTO').AsString;
  qryDet.FieldByName('REFERENCIA').AsString:='***';
  qryDet.FieldByName('IDMOTIVO').AsInteger := StrToInt(dblkMotivo.LookupValue); 
  qryDet.Fieldbyname('SISTORIGEM').asInteger := 18;
  qryDet.Fieldbyname('IDMODULO').asInteger := 18;
  If dbcbOrigemRubrica.ItemIndex = 1 then
     qryDet.Fieldbyname('IDFAVORECIDO').asInteger := qryConvenios.Fieldbyname('IDFAVORECIDO').asInteger;
  If dbcbProcessar.checked then
  begin
      qryDet.Fieldbyname('LOTEPREVIA').Clear;
      qryDet.Fieldbyname('VALORRECEBIDO').clear;
      qryDet.Fieldbyname('datarecebimento').clear;
  end;
end;

procedure TfrmCadTmpDesc.dbrgrpAtrasoDevolExit(Sender: TObject);
begin
  inherited;
  case dbrgrpAtrasoDevol.ItemIndex of
    0 : Abreqryrubricas('N');
    1 : AbreqryRubricas('A');
    2 : Abreqryrubricas('D');
  end;
end;

procedure TfrmCadTmpDesc.dblkpcmbRubricaEnter(Sender: TObject);
begin
  inherited;
  case dbrgrpAtrasoDevol.ItemIndex of
    0 : Abreqryrubricas('N');
    1 : AbreqryRubricas('A');
    2 : Abreqryrubricas('D');
  end;
  ControlaRubricaConvenio;
  
end;

procedure TfrmCadTmpDesc.FormShow(Sender: TObject);
begin
  inherited;
  windowstate:=wsMaximized;
  mskedMes.Text:=Copy(DateToStr(date), 7,4)+'/'+Copy(DateToStr(date), 4,2);
  qrylote.open;
  qryMotivo.Open;
  AbreQryDet(0, 0);
  cmContaD.Mascara:=IntegraBack.MascaraPlano;
  cmContaD.Plano:=IntegraBack.Plano;
  cmContaC.Mascara:=IntegraBack.MascaraPlano;
  cmContaC.Plano:=IntegraBack.Plano;
  binsere := false;
  bAltera := false;
  bExclui := false;
end;

procedure TfrmCadTmpDesc.RdgTipoRegClick(Sender: TObject);
begin
  inherited;
  AbreQryDet(liidtitular, liidpessoa);
end;

procedure TfrmCadTmpDesc.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  bExcluiDet := False; 
  RdgTipoReg.Enabled:=False;
  EnabButtons(False);
  AtribEdits(False);
  bInsere := true;
  bAltera := false;
  bExclui := false;
end;

procedure TfrmCadTmpDesc.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  bExcluiDet := False; 
  RdgTipoReg.Enabled:=False;
  EnabButtons(False);
  AtribEdits(False);
  if (QryDet.FieldByName('SitEnvio').asstring = '1') and
     (QryDet.FieldByName('SitEnvio').asstring = '2') and
     (QryDet.FieldByName('SitEnvio').asstring = '9') then
    AtribEdits(True);
  bInsere := false;
  bAltera := true;
  bExclui := false;
end;

procedure TfrmCadTmpDesc.sbtnExcluiDetClick(Sender: TObject);
begin
  If not dtmbasedados.dbBaseDados.InTransaction then
     dtmbasedados.dbBaseDados.StartTransaction;

  bErro:=False;

  if qryDet.Locate('IDTITULAR;IDPESSJUR;IDPLANOPREV;IDPESSOA;MESREFERENCIA;MESCOBRANCA;IDPROVENTO',
     vararrayof([liidtitular,
                 liidpessjur,
                 qryDet.FieldByName('IDPLANOPREV').AsString,
                 liidpessoa,
                 (Copy(qryDet.fieldbyname('MESREFERENCIA').asstring,1,4)+'/'+
                  Copy(qryDet.fieldbyname('MESREFERENCIA').asstring,6,2)),
                 (Copy(qryDet.fieldbyname('MESCOBRANCA').asstring,1,4)+'/'+
                  Copy(qryDet.fieldbyname('MESCOBRANCA').asstring,6,2)),
                 qryDet.fieldbyname('IDPROVENTO').AsInteger]),[]) then
  begin
    AbreqryRubricas(qryDet.fieldbyname('FLGATRASODEVOL').AsString);
    qryDet.edit;
    qrydet.delete;
  end
  else
    bErro:=not Atualiza(
      'DELETE TMPDESC '+
      'WHERE IDTITULAR = '+QuotedStr(inttostr(liidtitular))+' '+
      'AND IDPESSJUR = ' +QuotedStr(inttostr(liidpessjur))+' '+
      'AND IDPLANOPREV = '+qryDet.FieldByName('IDPLANOPREV').AsString+' '+
      'AND IDPESSOA = ' + QuotedStr(inttostr(liidpessoa))+' '+
      'AND MESREFERENCIA = '+QuotedStr(Copy(qryDet.fieldbyname('MESREFERENCIA').asstring,1,4)+'/'+Copy(qryDet.fieldbyname('MESREFERENCIA').asstring,6,2))+' '+
      'AND MESCOBRANCA = '+QuotedStr(Copy(qryDet.fieldbyname('MESCOBRANCA').asstring,1,4)+'/'+Copy(qryDet.fieldbyname('MESCOBRANCA').asstring,6,2))+' '+
      'AND IDPROVENTO = '+QuotedStr(IntToStr(qryDet.fieldbyname('IDPROVENTO').AsInteger)),'Apagar');

  RdgTipoReg.Enabled:=False;
  bInsere := false;
  bAltera := false;
  bExclui := true;
end;

Function TfrmCadTmpDesc.Atualiza(sSql,Ms:String):Boolean;
begin
  With qryAux do
  begin
    Close;
    Sql.Clear;
    Sql.Add(sSql);
    try
      ExecSql;
      Result:=True;
    Except
      MsgDlg('Erro ao '+Ms+' Registro.', 'Aviso', mtWarning,
           [mbOk, mbHelp],0);
      Result:=False;
    end;
  end; {With}
end;

procedure TfrmCadTmpDesc.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  RdgTipoReg.Enabled := False;
  PnlMestre.Enabled  := False;
  bbtnSair.Enabled   := False; 
  AtribEdits((qryDet.fieldbyname('sitenvio').AsString <> '0')); 
end;

procedure TfrmCadTmpDesc.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  RdgTipoReg.Enabled:=True;
  PnlMestre.Enabled:=True;
  mskedMes.setfocus;
end;

procedure TfrmCadTmpDesc.bbtnConfirmarClick(Sender: TObject);
begin
  If bExcluiDet then
    If Not bErro then
    Begin
     dtmBaseDados.dbBaseDados.Commit;
     bConfirmou := True;
     bbtnCancelarClick(Self);
    End
    else
    begin
      dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Houve erro ao processar','Atenção!',mtError,[mbOk,mbHelp],0);
    end
  Else
    inherited;

  RdgTipoReg.Enabled := True;
  bbtnSair.Enabled   := True; 
end;

procedure TfrmCadTmpDesc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  If (bExcluiDet And Not bConfirmou) Then
  Begin
    dtmBaseDados.dbBaseDados.RollBack;
    AbreQryDet(liidtitular, liidpessoa);
  End;

  RdgTipoReg.Enabled := True;
  PnlMestre.Enabled  := True;
  bbtnSair.Enabled   := True; 
end;

procedure TfrmCadTmpDesc.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  EnabButtons(True);
  AtribEdits(True);
end;

procedure TfrmCadTmpDesc.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  EnabButtons(True);
  AtribEdits(True);
end;

function TfrmCadTmpDesc.VerificaPessoaFisica(aiidpessoa: integer): boolean;
begin
  if not FazQuery(qryAux, 'select idpessoa from pessoafisica where idpessoa = '+
       inttostr(aiidpessoa)) then
  begin
    result:=MsgDlg('A pessoa selecionada não tem as informações de Dados Pessoais preenchida. '+#13#13+
                   'O sistema pode alterar automaticamente o cadastro '+
                   'ou você pode cancelar esta operação e entrar na tela de '+
                   'Cadastro/Favorecido, para preencher as informações Dados Pessoais de pessoa física.'+#13#13+
                   'Deseja que o sistema acerte automaticamente o cadastro agora ? (S/N)',
                   'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes;
    if result then
    begin
      if not ExecutarQuery(qryAux,
              'insert into pessoafisica (idpessoa,idestado,numdepirrf) values ('+
              inttostr(aiidpessoa)+',0,0)') then
      begin
        MsgDlg('Não foi possível alterar automaticamente o cadastro da pessoa física. '+#13#13+
               'Por favor entre na tela de Cadastro/Favorecido e preencha as '+
               'informações Dados Pessoais de pessoa física.',
               'Informação', mtWarning, [mbOk, mbHelp], 0);
        result:=false;
      end
      else
        result:=true;
    end;
  end
  else
    result:=true;
end;

procedure TfrmCadTmpDesc.sbtnAddFavOutrosClick(Sender: TObject);
begin
  inherited;
  MontaSelectFAV.Executar;
  if (MontaSelectFAV.ValoresChave.Count > 0) and
     (MontaSelectFAV.ValoresChave[0] <> '') then
  begin
    qryDet.FieldByName('IDFAVORECIDO').AsInteger := StrToInt(MontaSelectFAV.ValoresChave[0]);
    edNomeFAVOutros.Text    := MontaSelectFAV.ValoresChave[1];
    edCPFFavOutros.Text     := MontaSelectFAV.ValoresChave[2];
  end;
end;

procedure TfrmCadTmpDesc.sbtnRemFavOutrosClick(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('IDFAVORECIDO').AsString := '';
  edNomeFAVOutros.Text    := '';
  edCPFFavOutros.Text     := '';
end;

procedure TfrmCadTmpDesc.ControlaRubricaConvenio;
var
   iLote : Integer;
   sAnoMes : String;
begin
    qryConvenios.close;
    qryConvenios.parambyname('IDRUBRICA').asInteger    := qryRubrica.fieldbyname('IDPROVENTO').asInteger;
    qryConvenios.parambyname('MESREFERENCIA').asstring := Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text);
    qryConvenios.Open;
    If not qryConvenios.eof then
    begin
         iLote   := qryConvenios.fieldbyname('IDLOTE').asInteger;
         sAnoMes := qryConvenios.fieldbyname('ULTIMPORT').asString;
         if qryLote.Locate('IDLOTE;MESREFERENCIA',vararrayof([iLote,sAnoMes]),[]) then
         begin
              dblkpcmbLote.Text := qryLote.fieldbyname('IDLOTE').asstring;
              dblkpcmbLote.PerformSearch;
              edNomeFavOutros.Text := qryConvenios.fieldbyname('NOME').asstring;
              edCPFFavOutros.text :=  qryConvenios.fieldbyname('NUMDOCUMENTO').asstring;
              dbcbOrigemRubrica.ItemIndex := 1; 
         end;
    end;
end;

procedure TfrmCadTmpDesc.ControlaContaContabil;
begin
  cmContaD.enabled:=true;
  cmContaC.enabled:=true;
  if qryRubrica.FieldByName('FLGDESCONTO').asinteger = 0 then
  begin
    cmContaD.visible:=true;
    cmContaC.visible:=false;
  end
  else
    if qryRubrica.FieldByName('FLGDESCONTO').asinteger = 1 then
    begin
      cmContaC.visible:=true;
      cmContaD.visible:=false;
    end
    else
    begin
      cmContaD.enabled:=false;
      cmContaC.enabled:=false;
    end;
end;

procedure TfrmCadTmpDesc.dblkpcmbRubricaChange(Sender: TObject);
begin
  inherited;
  if qryRubrica.active then
  begin
     ControlaContaContabil;
     ControlaRubricaConvenio;
  end;
end;

procedure TfrmCadTmpDesc.mskedMesExit(Sender: TObject);
begin
  inherited;
  if not qry.Active then Exit;
  AbreQryDet(liidtitular, liidpessoa);
end;

procedure TfrmCadTmpDesc.mskedMesKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    if not qry.Active then Exit;
    AbreQryDet(liidtitular, liidpessoa);
  end;
end;

procedure TfrmCadTmpDesc.FormCreate(Sender: TObject);
begin
  inherited;
  CmeDetalhe.RepetirInsert:=false;
  CmeCadastro.RepetirInsert:=false;
  liidtitular:=0;
  liidpessoa:=0;
end;

procedure TfrmCadTmpDesc.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  edCPFFavOutros.Text         := '';
  edNomeFavOutros.Text        := '';

  qryDet.FieldByName('FLGATRASODEVOL').AsString:='N'; 

  dbrgrpAtrasoDevol.ItemIndex := 0;
  AbreqryRubricas('N');
end;

procedure TfrmCadTmpDesc.bbtnSairClick(Sender: TObject);
begin
  bExcluiDet := False; 
  inherited;
end;

procedure TfrmCadTmpDesc.bbtnOkDetClick(Sender: TObject);
begin
  If (Trim(dblkMotivo.Text) = '') Then
  Begin
    MsgDlg('Por favor informe o Motivo.', 'Erro', mtError, [mbOk,mbHelp], 0);
    dblkMotivo.SetFocus;
    Exit;
  End;
  inherited;
end;

procedure TfrmCadTmpDesc.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Modulo.GravaLogTOTALPREV ('Lançamento Manual para Folha de Benefício. - '+qry.FieldByName('NOME').AsString); // Thiago Melo SOL 206252 Kinanta 1997935
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Cadastro Manual de Lançamentos da Folha de Benefícios.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;
end;

procedure TfrmCadTmpDesc.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AtribEdits((qryDet.fieldbyname('sitenvio').AsString <> '0'));
end;

end.
{==============================================================================|
| UNIT: FCADTMPDESC                                                            |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   CASDASTRO MANUAL DE REGISTROS NA TMPDESC.                                  |
|                                                                              |
===============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ALTERAÇÃO NA QUERY QUE É EXIBIDA NO GRID PARA TRATAR O FLGATRASO E O       |
| FLGDEVOLUCAO.                                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/05/2002 A 21/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12q                                              |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSÃO DOS CAMPOS CONTA CONTÁBIL E DO FAVORECIDO.                        |
| - NÃO PERMITIR INCLUSÃO AUTOMÁTICA.                                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/05/2002 A 22/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12t                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSÃO DO FLGMANUAL                                                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei B Marins.                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/07/2002 A 23/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF  - Pendencia 7664.                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação para exibir código/descrição externa |
|  conforme a parametrização na tabela PARAMAPREV.                             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/01/2003 A 29/01/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.03.02f                                              |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  alteração na qry para obter apenas os planos ativos.                        |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO COSTA                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 30/06/2003 A 30/06/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.03.06l                                              |
| CLIENTE: CM                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   Ao entrar uma rubrica de convênio identificar o favorecido e o lote de     |
|   importação e colocar na TMPDESC.                                           |
|                                                                              |
|==============================================================================}


