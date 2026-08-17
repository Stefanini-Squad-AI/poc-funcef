unit fInserePart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, ComCtrls, wwdblook, URegra, CmEventosCadastro, ImgList, uMensErro,
  DBCtrls, CheckLst;

type
  TFrmInserePart = class(TfrmCadastroCS)
    qryPlanos: TwwQuery;
    qryIdRegra: TwwQuery;
    RegraADM: TRegra;
    qryRegraADM: TwwQuery;
    qryAux: TwwQuery;
    qryContribAss: TwwQuery;
    qryContribAssIDCONTASS: TFloatField;
    qryContribAssNOME: TStringField;
    qryContribAssCODPORTFORMA: TFloatField;
    qryContribAssFLGCOBCARNE: TFloatField;
    qryContribAssPAGADOR: TStringField;
    qryIDPESSOA: TFloatField;
    qryMATRICULA: TStringField;
    qryINSCRICAONUMERO: TFloatField;
    qryIDPESSJUR: TFloatField;
    qrySITUACAO: TStringField;
    qryNOME: TStringField;
    qryDATANASC: TDateTimeField;
    qryIDADE: TFloatField;
    qrySEXO: TStringField;
    qryIDRESPONSAVEL: TFloatField;
    qryRESPONSAVEL: TStringField;
    qryESTCIVIL: TStringField;
    qryPATROCINADORA: TStringField;
    qryDEPENDENTE: TStringField;
    qryDEPENDENCIA: TStringField;
    qryLEGAL: TStringField;
    qryIDPLANOPREV: TFloatField;
    qryPREVIDENCIARIO: TStringField;
    qryINSCRICAODATA: TDateTimeField;
    qryENDERECO: TStringField;
    qryCONTA: TStringField;
    qryBANCO: TStringField;
    qryIDNUCLEO: TFloatField;
    qryPlanosIDPLANASS: TFloatField;
    qryPlanosNOME: TStringField;
    qryPlanosOPCAOAIDENT: TStringField;
    qryPlanosOPCAOBDIF: TStringField;
    qryPlanosCODPORTFORMA: TFloatField;
    qryPlanosPart: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField2: TFloatField;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    EdMat: TEdit;
    Label3: TLabel;
    EdNumInsc: TEdit;
    Label1: TLabel;
    EdNome: TEdit;
    lblFalecido: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    EdPatro: TEdit;
    Label5: TLabel;
    EdSituacao: TEdit;
    Label10: TLabel;
    EdPlano: TEdit;
    Label11: TLabel;
    EdDataInsc: TEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    EdNascimento: TEdit;
    Label8: TLabel;
    EdSexo: TEdit;
    Label6: TLabel;
    EdEstCivil: TEdit;
    Label12: TLabel;
    EdBanco: TEdit;
    Label13: TLabel;
    EdConta: TEdit;
    Label9: TLabel;
    EdDepend: TEdit;
    Label14: TLabel;
    EdEndereco: TEdit;
    GroupBox4: TGroupBox;
    Label49: TLabel;
    DTInscricao: TDateTimePicker;
    GroupBox8: TGroupBox;
    Label48: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label44: TLabel;
    dblkPlano: TwwDBLookupCombo;
    EdOpcaoB: TEdit;
    CmbCobra: TComboBox;
    CbBenef: TComboBox;
    GroupBox7: TGroupBox;
    grbCobDif: TGroupBox;
    ChkOpcaoA: TCheckBox;
    GroupBox5: TGroupBox;
    chkBenef: TCheckBox;
    Label17: TLabel;
    Label18: TLabel;
    ChkContrib: TCheckListBox;
    qryLista: TwwQuery;
    qryListaIDCONTASS: TFloatField;
    qryListaNOME: TStringField;
    Procedure PegaListaContrib;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkPlanoChange(Sender: TObject);
  private
    { Private declarations }
    Function Atualiza(pIdPessoa,pIdPessJur,pIdPlanoPrev,pIdPlanass:String):Boolean;
  public
    { Public declarations }
    iIdTitular, iIdPlanAss, iIdPlanoPrev, iIdPessJur, iIdFilial  : Integer;
    sMatricula, sInscricao, sOpcao                               : String;
  end;

var
  FrmInserePart: TFrmInserePart;
  FormGrpFamAberto : Boolean=False;

implementation

uses FCadGeralPart, DBaseDados, FTelaAut, fInsereBenef,
  FCadGrupoFamiliarass, fCadDepTitPlanAss, USistema, UAdmAss, uDataBase;

{$R *.DFM}

Procedure TFrmInserePart.PegaListaContrib;
begin
  With qryLista do
  begin
    Sql.Clear;
    Sql.Add('SELECT DISTINCT CB.IDCONTASS, CT.NOME '+
            ' FROM CONTRIBASS CB, CONTRIBUICAO CT '+
            ' WHERE '+
            ' CB.IDCONTASS = CT.IDCONTRIBUICAO '+
            ' ORDER BY CT.NOME ');
    Open;
    First;
    chkContrib.Items.Clear;
    While Not Eof do
    begin
      chkContrib.Items.Add(Trim(FieldByName('NOME').AsString));
      Next;
    end;
  end; {With}
end;

procedure TFrmInserePart.FormCreate(Sender: TObject);
begin
  inherited;
  FrmCadGeralPart.WindowState:=wsMinimized;
  FormGrpFamAberto:=False;
  sOpcao:=frmCadGeralPart.sOpcao;
  If sOpcao = 'PLAN' Then
  begin
    Caption:='INSERIR PLANO';
    CmeCadastroFind(Self);
  end;
  (* Pega a Lista de Contribuições registradas no Assistencial *)
  PegaListaContrib;
end;

procedure TFrmInserePart.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) or (sOpcao = 'PLAN') Then
  begin
     (* Analise se o participante é falecido e cadastra responsavel NF *)
     If MontaSelect.RetornouValor Then
        If (MontaSelect.ValoresChave[2] = '') and (MontaSelect.ValoresChave[3] <> '') Then
         Begin
           MsgDlg('O participante é falecido e não tem responsável'+#13+
                  'pelo grupo  familiar  cadastrado. É  necessário'+#13+
                  'primeiro cadastrar NUCLEO FAMILIAR.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
           WindowState:=wsMinimized;
           FormGrpFamAberto:=True;
           AbrirForm(FrmCadGrupoFamiliarass, TFrmCadGrupoFamiliarass, false);
           Abort;
         End;
     (* Query de busca ==> Acha o participante (vivo ou falecido) *)
     qry.close;
     If sOpcao = 'PLAN'
      Then qry.ParamByName('IDPESSOA').asInteger := frmCadGeralPart.vIdPessoa
      Else qry.ParamByName('IDPESSOA').asInteger := StrToIntDef(MontaSelect.ValoresChave[1],0);
     qry.Open;
     (* Query de plano ==> Acha os planos que o participante ainda não tem *)
     qryPlanos.close;
     If sOpcao = 'PLAN' Then
      qryPlanos.ParamByName('IDPESSOA').asInteger := frmCadGeralPart.vIdPessoa
     Else qryPlanos.ParamByName('IDPESSOA').asInteger := StrToIntDef(MontaSelect.ValoresChave[1],0);
     qryPlanos.Open;
     (* se quantidade de registros na qryPlanos for = 0 então avisa ao *)
     (* usuário que não há mais planos disponíveis para o participante *)
     If qryPlanos.RecordCount = 0 Then
      Begin
       MsgDlg('Não há mais planos disponíveis para este participante.','Erro',
              mtError,[mbOk,mbHelp],0);
       If sOpcao = 'PLAN' Then bbtnSairClick(Self);
      End;
     (* Verifica se o grupo familiar possui um responsável *)
     (* Tabela para Referencia : GrupoFamAss               *)
     lblFalecido.Caption:='';
     If qryIDRESPONSAVEL.asString <> '' then
     Begin
       lblFalecido.Caption:='Participante Falecido: '+qryNOME.AsString;
       lblFalecido.Visible:=True;
       EdNome.Text:=qryRESPONSAVEL.AsString;
     End
     Else
     Begin
       lblFalecido.Visible:=False;
       EdNome.Text:=qryNOME.AsString;
     End;
     EdNumInsc.Text:=qryINSCRICAONUMERO.AsString;
     EdMat.Text:=qryMATRICULA.AsString;
     EdPatro.Text:=qryPATROCINADORA.AsString;
     EdSituacao.Text:=qrySITUACAO.AsString;
     EdEstCivil.Text:=qryESTCIVIL.AsString;
     EdNascimento.Text:=qryDATANASC.AsString+' ('+qryIDADE.AsString+' Anos)';
     If qryIDPESSOA.AsString<>'' then
     begin
       If qrySexo.AsString='M' then EdSexo.Text:='MASCULINO'
       else If qrySexo.AsString<>'' then EdSexo.Text:='FEMININO';
     end;
     EdDepend.Text:=UpperCase(qryDEPENDENCIA.AsString);
     EdPlano.Text:=qryPREVIDENCIARIO.AsString;
     EdDataInsc.Text:=qryINSCRICAODATA.AsString;
     EdBanco.Text:=qryBANCO.AsString;
     EdConta.Text:=qryCONTA.AsString;
     EdEndereco.Text:=qryENDERECO.AsString;
  end;
end;

procedure TFrmInserePart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmCadGeralPart.bbtnSair.Enabled:=True;
  FrmCadGeralPart.WindowState:=wsMaximized;
end;

procedure TFrmInserePart.sbtnInserirClick(Sender: TObject);
begin
  If sOpcao = 'PART' Then MontaSelect.Executar;
  CmeCadastroFind(Self);
  sbtnInserir.Down:=False;
  bbtnConfirmar.Enabled:=True;
  bbtnCancelar.Enabled:=True;
  pnlFundo.Enabled:=True;
  dblkPlano.SetFocus;
end;

Function TFrmInserePart.Atualiza(pIdPessoa,pIdPessJur,
    pIdPlanoPrev,pIdPlanass:String):Boolean;
Var sWhere : String;
    iTotal : Integer;
    bErro  : Boolean;
    qryTmp,
    qryUpd : TQuery;
begin
  bErro:=False;
  qryTmp:=TQuery.Create(Application);
  qryTmp.DatabaseName:='BaseDados';
  sWhere:=' WHERE IDPESSOA = '+pIdPessoa+
          ' AND IDPESSJUR = '+pIdPessJur+
          ' AND IDPLANOPREV = '+pIdPlanoPrev+
          ' AND IDPLANASS = '+pIdPlanass+
          ' AND FLGINSCRICAOCANC = 1';
  qryTmp.Close;
  qryTmp.Sql.Clear;
  qryTmp.SQL.Add(
    'SELECT COUNT(*) AS TOTAL FROM PARTASS '+sWhere);
  qryTmp.Open;
  iTotal:=qryTmp.FieldByName('TOTAL').AsInteger;
  qryTmp.Close;
  qryTmp.Free;
  If iTotal>0 then
  begin
    if not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;

    qryUpd:=TQuery.Create(Application);
    qryUpd.DatabaseName:='BaseDados';
    qryUpd.Close;
    qryUpd.Sql.Clear;
    qryUpd.Sql.Add(
      'UPDATE PARTASS '+
      ' SET FLGINSCRICAOCANC = 0,'+
      ' DATACANCELAMENTO = NULL'+sWhere);
    try
      qryUpd.ExecSQL;
    except
      bErro:=True;
    end;
    sWhere:=' WHERE IDTITULAR = '+pIdPessoa+
            ' AND IDPESSJUR = '+pIdPessJur+
            ' AND IDPLANOPREV = '+pIdPlanoPrev+
            ' AND IDPLANASS = '+pIdPlanass+
            ' AND FLGATIVO = 0';
    qryUpd.Close;
    qryUpd.Sql.Clear;
    qryUpd.Sql.Add(
      'UPDATE BENEFASS '+
      ' SET FLGATIVO = 1,'+
      ' DTCANCELAMENTO = NULL'+sWhere);
    try
      qryUpd.ExecSQL;
    except
      bErro:=True;
    end;
    qryUpd.Close;
    qryUpd.Sql.Clear;
    qryUpd.Sql.Add(
      'UPDATE CONTASS '+
      ' SET FLGATIVO = 1'+sWhere);
    try
      qryUpd.ExecSQL;
    except
      bErro:=True;
    end;
    If bErro then dtmBaseDados.dbBaseDados.Rollback
    else dtmBaseDados.dbBaseDados.Commit;
    qryUpd.Free;
  end; {iTotal>0}
  Result:=(iTotal>0)And(Not bErro);
end;

procedure TFrmInserePart.bbtnConfirmarClick(Sender: TObject);
var sPlano,sIdSitPart,sMes,sData,sSql : String;
    Ano,Mes,Dia                       : Word;
    bExiste                           : Boolean;
    qryPart                           : TQuery;
    CheckLst                          : Char;
    Ind                               : Integer;

{sub} (* Verifica se campos estão preenchidos *)
Function ExisteErro: Boolean;
Var cCh: Char;
begin
  cCh:=#0;
  If dblkPlano.Text = '' then cCh:='1'
  else If CbBenef.Text   = '' then cCh:='2'
  else If CmbCobra.Text  = '' then cCh:='3';
  Case cCh of
    '1' : MsgDlg('Plano não escolhido.','Erro',mtError,[mbOk,mbHelp],0);
    '2' : MsgDlg('Tipo de Beneficiário não escolhido.','Erro',mtError,[mbOk,mbHelp],0);
    '3' : MsgDlg('Forma de Cobrança não escolhida.','Erro',mtError,[mbOk,mbHelp],0);
  end;
  Case cCh Of
    '1' : dblkPlano.SetFocus;
    '2' : CbBenef.SetFocus;
    '3' : CmbCobra.SetFocus;
  end;
  ExisteErro:=cCh<>#0;
end;

{sub} (* Constraint (CM.R_1633) *)
Function ErroPlanPrevAss: Boolean;
Var qryP: TQuery;
begin
  qryP:=TQuery.Create(Application);
  With qryP do
  begin
    SQL.Clear;
    sSQL:='SELECT IDPESSJUR, IDPLANOPREV, IDPLANASS '+
          'FROM PLANPREVASS '+
          'WHERE (IDPESSJUR = '+qryIDPESSJUR.AsString+') AND '+
          '(IDPLANASS = '+sPlano+') AND '+
          '(IDPLANOPREV = '+qryIDPLANOPREV.AsString+')';
    SQL.Add(sSQL);
    DataBaseName:='BaseDados';
    Open;
    ErroPlanPrevAss:=IsEmpty;
    If IsEmpty then MsgDlg('Falta associação de plano previdenciário com plano assistencial, '+
                            '(MENU PRINCIPAL - CADASTROS - INTEGRAÇÃO - PREVIDENCIÁRIO).',
                             'Erro',mtError,[mbOk,mbHelp],0);
    Close;
  end;
end;

{Sub}
Procedure AbreQryContribass;
Var I   : Integer;
    sLin: String;
begin
  sLin:='';
  For I := 0 to chkContrib.Items.Count - 1 do
   If chkContrib.checked[I] then
   begin
    (* Adicionar IdContass no Sql *)
    If qryLista.Locate('Nome',chkContrib.Items[I],[loCaseInsensitive,loPartialKey]) then
      sLin:=sLin+qryLista.FieldByName('IDCONTASS').AsString+',';
   end;
   sLin:= Copy(sLin, 1, Length(sLin) - 1);
   qryContribass.Close;
   qryContribass.Sql.Clear;
   qryContribass.Sql.Add(
     'SELECT CT.IDCONTASS, CTO.NOME,'+
     ' CT.CODPORTFORMA, CT.FLGCOBCARNE,'+
     ' CT.PAGADOR '+
     ' FROM CONTRIBASS CT, CONTRIBUICAO CTO '+
     ' WHERE '+
     ' (CT.IDPLANASS = '+sPlano+') AND '+
     ' (CTO.IDCONTRIBUICAO = CT.IDCONTASS) AND'+
     ' (CT.IDCONTASS IN ('+sLin+'))');
   qryContribass.Open;
end; {AbreQryContribass}

begin
  iIdTitular   := 0;
  iIdPlanAss   := 0;
  iIdPlanoPrev := 0;
  iIdPessJur   := 0;
  iIdFilial    := 0;
  sMatricula   := '';
  sInscricao   := '';
  CheckLst:=#0;

  If qryIDPESSOA.AsString='' then Abort;
  qryPart:=TQuery.Create(Application);

 (* Avalia se os campos estão preenchidos *)
  If ExisteErro then Abort;

  sPlano := dblkPlano.LookupValue;

 (* Verifica se houve erro na PlanPrevAss *)
  If ErroPlanPrevAss then Abort;

  (* Verifica se foi escolhida alguma contribuição *)
  For Ind:=0 to chkContrib.Items.Count-1 do
   If chkContrib.Checked[Ind] then CheckLst:='1';

  If checkLst=#0 then
  begin
    MsgDlg('Nenhuma Tipo de Cobrança foi selecionada!','Atenção',mtWarning,[mbOk,mbHelp],0);
    Exit;
  end;

  decodedate(DTInscricao.Date,Ano,Mes,Dia);
  sMes := FloattoStr(Mes);
  if StrToIntDef(sMes,0) < 10 then sMes := '0'+sMes;
  sMes := FloatToStr(Ano)+'/'+sMes;

  (* IdSitPlanoAss da Tabela SitPlanoAss *)
  if CbBenef.ItemIndex = 0
   then sIdSitPart := '1'  (* Normal           *)
   else sIdSitPart := '8'; (* Não Beneficiário *)

  sData := DatetoStr(DTInscricao.Date);

  (* Testa Regra de Admissão dos Planos  *)
  qryIDRegra.close;
  qryIDRegra.ParambyName('pIDPlanass').asInteger := StrToIntDef(sPlano,0);
  qryIDRegra.open;
  if sIdSitPart = '1' then // beneficiário:SIM
     qryRegraADM.ParamByName('FLGPARTBENEF').Value := 1
  else qryRegraADM.ParamByName('FLGPARTBENEF').Value := 0;

  if qryIDRegra.fieldByName('IDREGRAADMISSAO').AsString <> '' then begin
     regraADM.rulename := qryIDRegra.fieldByName('IDREGRAADMISSAO').AsString;
     qryRegraADM.ParamByName('IDPESSOA').Value := qry.fieldByName('IDPESSOA').Value;
     qryRegraADM.ParamByName('IDPLANOPREV').Value := qry.fieldByName('IDPLANOPREV').Value;
     qryRegraADM.ParamByName('IDPESSJUR').Value := qry.fieldByName('IDPESSJUR').Value;
     qryRegraADM.ParamByName('pMESREF').Value := sMES;
     qryRegraADM.open;
     regraADM.execute;
     if (regraADM.result = 'False') or (regraADM.result = '')  then begin
        showmessage('Não pode ser cadastrado como participante, pois não atende Regra de admissão do plano!');
        qryregraADM.close;
        exit;
     end;
     qryregraADM.close;
  end;

  If Not Atualiza(qryIDPESSOA.AsString,qryIDPESSJUR.AsString,
          qryIDPLANOPREV.AsString,sPlano) then
  begin

    (*                            Inicia uma transação                            *)
    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;
    (*                   Inserção na Partass - MONTAGEM DA QUERY                  *)
    sSql  :=  'INSERT INTO PARTASS       '+
              '  (IDPESSJUR,             '+
              '   SEQPROPOSTA,           '+
              '   IDPLANOPREV,           '+
              '   IDPESSOA,              '+
              '   IDPLANASS,             '+
              '   IDSITPART,             '+
              '   DATAENTRADA,           '+
              '   FLGPARTBENEF,          '+
              '   FLGINSCRICAOCANC,      '+
              '   IDNUCLEO,              '+
              '   OPCAOB,                '+
              '   OPCAOA,                '+
              '   INSCRICAONUMERO)       '+
              '   VALUES (               '+
              qryIDPESSJUR.AsString   +','+
              '1,'+
              qryIDPLANOPREV.AsString +','+
              qryIDPESSOA.AsString    +','+
              sPlano                  +','+
              sIdSitPart              +','+
              'TO_DATE(' +chr(39)+ sData +chr(39)+ ',' +chr(39)+ 'DD/MM/YYYY' +chr(39)+ '),';
      if qryIDRESPONSAVEL.AsString = '' then begin
      (*   *****************************************************************            *)
      (*      O Participante NÃO É PENSIONISTA                                          *)
  (*   *****************************************************************            *)
        if sIdSitPart = '1' then begin
  (*       =============================================================            *)
  (*       É BENEFICIÁRIO do plano ( 1 - FLGPARTBENF)                               *)
  (*       =============================================================            *)
          sSql := sSql + chr(39) + '1' + chr(39) +',';
  (*         FLGINSCRICAOCANC - 0 - Inscrição Não Cancelada                         *)
  (*                            1 - Inscrição CANCELADA                             *)
  (*       temos 4 situações:                                                       *)
  (*       Titular Benefeciário                                                     *)
  (*         -> Dependentes Beneficiários NÃO Cancelados ----> FLGINSCRICAOCANC = 0 *)
  (*         -> Dependentes NÃO Beneficiários OU Cancelados -> FLGINSCRICAOCANC = 0 *)
  (*       Titular NÃO Beneficiário                                                 *)
  (*         -> Dependentes Beneficiários NÃO Cancelados ----> FLGINSCRICAOCANC = 0 *)
  (*         -> Dependentes NÃO Beneficiários OU Cancelados -> FLGINSCRICAOCANC = 1 *)
          sSql := sSql + '0,';
  (*         Participante NÃO Pensionista - IDNUCLEO nulo                       *)
          sSql := sSql + 'NULL,';
  (*         Participante NÃO Pensionista - Identificador do plano escolhido    *)
          sSql := sSql + chr(39) + EdOpcaoB.Text + chr(39) + ',';
  (*         Participante NÃO Pensionista - Seleciona cobrança diferenciada     *)
          If (ChkOpcaoA.Visible) and (ChkOpcaoA.Checked)
           Then sSql := sSql + chr(39) + '1' + chr(39) + ','
           Else sSql := sSql + chr(39) + '0' + chr(39) + ',';
  (*         Participante NÃO Pensionista - Número da inscrição do participante *)
          sSql := sSql + chr(39) + qryINSCRICAONUMERO.asString + chr(39) + ')';
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSql);
          try
  (*                      Inserção na PARTASS                                   *)
            qryAux.ExecSQL;
          except
            Showmessage('Erro na Inclusão do Titular no novo plano.');
            Exit;
          end;

  (*                 Inserção na BENEFASS - MONTAGEM DA QUERY                   *)
          sSql := 'INSERT INTO BENEFASS (    '+
                  'IDTITULAR,                '+
                  'IDPESSJUR,                '+
                  'IDPLANOPREV,              '+
                  'IDPLANASS,                '+
                  'IDDEPENDENTE,             '+
                  'DATAENTRADA,              '+
                  'SEQPROPOSTA,              '+
                  'FLGATIVO,                 '+
                  'RESPONSAVELPAG)           '+
                  'VALUES (                  '+
                  qryIDPESSOA.AsString    +','+
                  qryIDPESSJUR.AsString   +','+
                  qryIDPLANOPREV.AsString +','+
                  sPlano                  +','+
                  qryIDPESSOA.AsString    +','+
                  'TO_DATE(' +chr(39)+ sData +chr(39)+ ',' +chr(39)+ 'DD/MM/YYYY' +chr(39)+'),'+
                  '1,';// SEQPROPOSTA
  (*  FLGATIVO - 0 - NÃO Ativo                                                  *)
  (*             1 - ATIVO                                                      *)
  (*   Este flag será sempre 1 - Ativo pois o participante esta sendo inserido  *)
  (*   No cancelamento do participante este flag deve ser 0 - Não Ativo         *)
          sSql := sSql + '1,';
  (*   RESPONSAVELPAG - 0 - NÃO Responsável                                     *)
  (*                    1 - Responsável pelo pagamento                          *)
  (* Como o Participante Não é pensionista e É BENEFICIÁRIO do plano            *)
  (* Este flag será 1 - Responsável pelo pagamento pois é ele(participante) quem*)
  (* pagará as contribuições dele próprio e dos seus dependentes                *)
          sSql := sSql + '1)';
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSql);
          try
  (*                           Inserção na BENEFASS                             *)
            qryAux.ExecSQL;
          except
            Showmessage('Erro na Inclusão do Titular no novo plano.');
            Exit;
          end;

          (* Pega as contribuições selecionadas *)
          AbreQryContribass;

          (* Query que seleciona os plano relacionado ao participante *)
          qryPlanosPart.Close;
          qryPlanosPart.ParamByName('IDPESSOA').Value := qryIDPESSOA.AsString;
          qryPlanosPart.ParamByName('IDPLANASS').Value:= sPlano ;
          qryPlanosPart.Open;
  (*                           Inserção na CONTASS                              *)
  (*           Escreve-se a query dentro do laço das contribuições              *)
          while not qryContribAss.EOF do
           begin
            sSql := 'INSERT INTO CONTASS                '+
                    ' (IDPLANASS,                       '+
                    '  IDTITULAR,                       '+
                    '  IDDEPENDENTE,                    '+
                    '  IDPLANOPREV,                     '+
                    '  IDPESSJUR,                       '+
                    '  IDCONTASS,                       '+
                    '  FLGATIVO,                        '+
                    '  RECPAG,                          '+
                    '  CODPORTFORMA,                    '+
                    '  FLGCOBCARNE,                     '+
                    '  IDPAGADOR,                       '+
                    '  SEQPROPOSTA)                     '+
                    'VALUES      (                      '+
                    sPlano                           +','+
                    qryIDPESSOA.AsString             +','+
                    qryIDPESSOA.AsString             +','+
                    qryIDPLANOPREV.AsString          +','+
                    qryIDPESSJUR.AsString            +','+
                    qryContribAssIDCONTASS.AsString  +','+
                    '1                                 ,'+
                    '''R''                             ,';

         (* Se for escolhido boleto bancário, pega codportforma da tabela Planass *)
            if (CmbCobra.ItemIndex = 1)And(Not qryPlanosPart.IsEmpty) then
             sSql:=sSql+qryPlanosPart.FieldByName('CodportForma').AsString+', '
            else sSql := sSql+'NULL, ';

            sSql := sSql+'NULL, ';
          (* PAGADOR - C = Contribuinte, isto é, o próprio participante         *)
          (*           P = Patrocinadora                                        *)
            If qryContribAssPAGADOR.AsString = 'C'
          (* Será usado o ID do pensionista pois o pagador será ele             *)
            Then sSql := sSql+qryIDPESSOA.AsString+','
          (* Será usado ID da patrocinadora pois o pagador será a Patrocinadora *)
            Else
            sSql := sSql+qryIDPESSJUR.AsString+',';
            sSql := sSql+'1)';
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(sSql);
            try
  (*                           Inserção na CONTASS                              *)
             qryAux.ExecSQL;
            except
             Showmessage('Erro na Inclusão do Titular no novo plano.');
             Exit;
            end;
            qryContribAss.Next;
           end;(* while *)
           qryPlanosPart.Close;
           qryContribAss.Close;
        end
        else begin
  (*   *****************************************************************        *)
  (*    O Participante NÃO É PENSIONISTA                                        *)
  (*   *****************************************************************        *)
  (*       =============================================================        *)
  (*       NÃO É BENEFICIÁRIO do plano ( 0 - FLGPARTBENF)                       *)
  (*       =============================================================        *)
          sSql := sSql + chr(39) + '0' + chr(39) +',';

  (*       FLGINSCRICAOCANC - 0 - Inscrição Não Cancelada                       *)
  (*                          1 - Inscrição CANCELADA                           *)
  (*      este flag será alterado para 0 quando for inserido                    *)
  (*      um Dependente Beneficiário                                            *)
          sSql := sSql + '1' + ',';
  (*      Participante NÃO Pensionista - IDNUCLEO nulo                          *)
          sSql := sSql + 'NULL,';
  (*      Participante NÃO Pensionista - Identificador do plano escolhido       *)
          sSql := sSql + chr(39) + EdOpcaoB.Text + chr(39) + ',';
  (*      Participante NÃO Pensionista - Seleciona cobrança diferenciada        *)
          If (ChkOpcaoA.Visible) and (ChkOpcaoA.Checked)
           Then sSql := sSql + chr(39) + '1' + chr(39) + ','
           Else sSql := sSql + chr(39) + '0' + chr(39) + ',';
  (*      Participante NÃO Pensionista - Número da inscrição do participante    *)
          sSql := sSql + chr(39) + qryINSCRICAONUMERO.asString + chr(39) + ')';
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSql);
          try
  (*                           Inserção na PARTASS                              *)
            qryAux.ExecSQL;
          except
            Showmessage('Erro na Inclusão do Titular no novo plano.');
            Exit;
          end;
        end;           (* if sIdSitPart = '1'                                   *)
      end              (* FIM do Participante NÃO É PENSIONISTA                 *)
      else begin
  (*   ******************************************************************       *)
  (*    O Participante É PENSIONISTA                                            *)
  (*   *****************************************************************        *)
  (*       ============================================================         *)
  (*       INDEPENDENTE do PENSIONISTA ser BENEFICIÁRIO ou Não do plano         *)
  (*       quem vai ser inserido na PARTASS é o participante falecido e         *)
  (*       é lógico que o falecido não será beneficiário do plano               *)
  (*       ---> NÃO é beneficiário do plano ( 0 - FLGPARTBENF)                  *)
  (*       =============================================================        *)
        sSql := sSql + chr(39) + '0' + chr(39) +',';
  (*       FLGINSCRICAOCANC - 0 - Inscrição Não Cancelada                       *)
  (*                          1 - Inscrição CANCELADA                           *)
  (*       Será 0 pois o pensionista será inserido, na sequencia, na BENEFASS   *)
        sSql := sSql + '0,';
  (*       Participante Pensionista - IDNUCLEO do Núcleo Familiar               *)
        sSql := sSql + qryIDNUCLEO.AsString +',';
  (*       Participante Pensionista - Identificador do plano escolhido          *)
          sSql := sSql + chr(39) + EdOpcaoB.Text + chr(39) + ',';
  (*       Participante Pensionista - Seleciona cobrança diferenciada           *)
          If (ChkOpcaoA.Visible) and (ChkOpcaoA.Checked)
           Then sSql := sSql + chr(39) + '1' + chr(39) + ','
           Else sSql := sSql + chr(39) + '0' + chr(39) + ',';
  (*       Participante Pensionista - Número da inscrição do participante       *)
          sSql := sSql + chr(39) + qryINSCRICAONUMERO.asString + chr(39) + ')';
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSql);
        try
  (*                             Inserção na PARTASS                            *)
          qryAux.ExecSQL;
        except
          Showmessage('Erro na Inclusão do Titular no novo plano.');
          Exit;
        end;
  (*       Caso o Pensionista NÃO seja beneficiário ele só será inserido  na    *)
  (*       PARTASS e sua implementação termina aqui. Caso o Pensionista seja    *)
  (*       BENEFICIÁRIO deve ser inserido também na BENEFASS e CONTASS          *)

        if sIdSitPart = '1' then begin
  (*       =============================================================        *)
  (*       o PENSIONISTA É BENEFICIÁRIO do plano                                *)
  (*       =============================================================        *)
  (*                  Inserção na BENEFASS  - MONTAGEM DA QUERY                 *)
          sSql := 'INSERT INTO BENEFASS (    '+
                  'IDPESSJUR,                '+
                  'IDPLANOPREV,              '+
                  'IDPLANASS,                '+
                  'DATAENTRADA,              '+
                  'SEQPROPOSTA,              '+
                  'IDTITULAR,                '+
                  'IDDEPENDENTE,             '+
                  'FLGATIVO,                 '+
                  'RESPONSAVELPAG)           '+
                  'VALUES (                  '+
                  qryIDPESSJUR.AsString   +','+
                  qryIDPLANOPREV.AsString +','+
                  sPlano +','+
                  'TO_DATE(' +chr(39)+ sData +chr(39)+ ',' +chr(39)+ 'DD/MM/YYYY' +chr(39)+'),'+
                  '1,';// SEQPROPOSTA
  (*                O IDTITULAR será o do participante FALECIDO                 *)
          sSql := sSql + qryIDPESSOA.AsString +',';
  (*    O IDDEPENDENTE será o do PENSIONISTA - Responsável do Núcleo Familiar   *)
          sSql := sSql + qryIDRESPONSAVEL.AsString +',';
  (*      FLGATIVO - 0 - NÃO Ativo                                              *)
  (*                 1 - ATIVO                                                  *)
  (*     Este flag será sempre 1 - Ativo pois o participante esta sendo inserido*)
  (*     No cancelamento do participante este flag deve ser 0 - Não Ativo       *)
          sSql := sSql + '1,';
  (*         RESPONSAVELPAG - 0 - NÃO Responsável                               *)
  (*                          1 - Responsável pelo pagamento                    *)
  (*        Como o Participante É pensionista e É BENEFICIÁRIO do plano         *)
  (*        Este flag será 1 - Responsável pelo pagamento pois é ele(PENSIONISTA*)
  (*        quem pagará as contribuições dele próprio e dos seus dependentes    *)
          sSql := sSql + '1)';
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSql);
          try
  (*                           Inserção na BENEFASS                             *)
            qryAux.ExecSQL;
          except
            Showmessage('Erro na Inclusão do Titular no novo plano.');
            Exit;
          end;

          (* Pega as contribuições selecionadas *)
          AbreQryContribass;

          (* Query que seleciona os plano relacionado ao participante *)
          qryPlanosPart.Close;
          qryPlanosPart.ParamByName('IDPESSOA').Value := qryIDPESSOA.AsString;
          qryPlanosPart.ParamByName('IDPLANASS').Value:= sPlano ;
          qryPlanosPart.Open;

  (*                           Inserção na CONTASS                              *)
  (*           Escreve-se a query dentro do laço das contribuições              *)
          while not qryContribAss.EOF do
           begin
            sSql := 'INSERT INTO CONTASS                '+
                    ' (IDPLANASS,                       '+
                    '  IDTITULAR,                       '+
                    '  IDDEPENDENTE,                    '+
                    '  IDPLANOPREV,                     '+
                    '  IDPESSJUR,                       '+
                    '  IDCONTASS,                       '+
                    '  FLGATIVO,                        '+
                    '  RECPAG,                          '+
                    '  CODPORTFORMA,                    '+
                    '  FLGCOBCARNE,                     '+
                    '  IDPAGADOR,                       '+
                    '  SEQPROPOSTA)                     '+
                    'VALUES      (                      '+
                    sPlano                           +','+
                    qryIDPESSOA.AsString             +','+
                    qryIDRESPONSAVEL.AsString        +','+
                    qryIDPLANOPREV.AsString          +','+
                    qryIDPESSJUR.AsString            +','+
                    qryContribAssIDCONTASS.AsString  +','+
                    '1                                 ,'+
                    'R                                 ,';

            if (CmbCobra.ItemIndex = 1)And(Not qryPlanosPart.IsEmpty) then
             sSql:=sSql+qryPlanosPart.FieldByName('CodportForma').AsString+', '
            else sSql := sSql+'NULL, ';
            sSql := sSql+'NULL, ';
          (* PAGADOR - C = Contribuinte isto é o participante pensionista       *)
          (*           P = Patrocinadora                                        *)
            If qryContribAss.FieldByName('PAGADOR').AsString = 'C'
          (* Será usado o ID do pensionista pois o pagador será ele             *)
            Then sSql := sSql+qryIDRESPONSAVEL.AsString+','
          (* Será usado ID da patrocinadora pois o pagador será a Patrocinadora *)
            Else sSql := sSql+qryIDPESSJUR.AsString+',';
            sSql := sSql+'1)';
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(sSql);
            try
  (*                           Inserção na CONTASS                              *)
             qryAux.ExecSQL;
            except
             Showmessage('Erro na Inclusão do Titular no novo plano.');
             Exit;
            end;
            qryContribAss.Next;
           end;(* while *)
          qryContribAss.Close;
          qryPlanosPart.Close;
        end; (* FIM do Pensionista BENEFICIÁRIO *)
      end; (* if qryIDNUCLEO *)
  (*     Se o checkbox estiver assinalado deverá abrir a tela de cadastro de    *)
  (*     beneficiários para novos cadastros.                                    *)
      if chkBenef.Checked Then
       Begin
         With qryPart do
         Begin
          SQL.Clear;
          sSQL := 'SELECT '+#13+
                  '  PA.IDPESSOA,       '+#13+
                  '  PA.IDPLANASS,      '+#13+
                  '  PA.IDPLANOPREV,    '+#13+
                  '  PA.IDPESSJUR,      '+#13+
                  '  EL.IDESTAB,        '+#13+
                  '  EL.MATRICULA,      '+#13+
                  '  PV.INSCRICAONUMERO '+#13+
                  'FROM'+#13+
                  '   PESSOA          PE,'+#13+
                  '   PESSOA          PJ,'+#13+
                  '   PLANASS         PN,'+#13+
                  '   PARTASS         PA,'+#13+
                  '   PLANPREV        PN,'+#13+
                  '   PARTPREVPLAN    PV,'+#13+
                  '   ELEGPATRO       EL,'+#13+
                  '   PESSOA          FI '+#13+
                  'WHERE '+#13+
                  '   (PV.INSCRICAONUMERO = '''+qryINSCRICAONUMERO.asString+''')       AND'+#13+
                  '   (PN.FLGATIVO        = 1)               AND'+#13+
                  '   (EL.IDPESSOA        = PE.IDPESSOA)     AND'+#13+
                  '   (EL.IDPESSJUR       = PJ.IDPESSOA)     AND'+#13+
                  '   (PA.IDPESSOA        = EL.IDPESSOA)     AND'+#13+
                  '   (PA.IDPESSJUR       = EL.IDPESSJUR)    AND'+#13+
                  '   (PA.IDPLANASS       = PN.IDPLANASS)    AND'+#13+
                  '   (PA.IDPLANOPREV     = PN.IDPLANOPREV)  AND'+#13+
                  '   (PV.IDPESSOA        = PA.IDPESSOA)     AND'+#13+
                  '   (PV.IDPESSJUR       = PA.IDPESSJUR)    AND'+#13+
                  '   (PV.IDPLANOPREV     = PA.IDPLANOPREV)  AND'+#13+
                  '   (FI.IDPESSOA(+)     = EL.IDESTAB)';
          SQL.Add(sSQL);
          DataBaseName:='BaseDados';
          Open;
         End;
  //
        iIdTitular      := qryPart.FieldByName('IDPESSOA').AsInteger;
        iIdPlanAss      := qryPart.FieldByName('IDPLANASS').AsInteger;
        iIdPlanoPrev    := qryPart.FieldByName('IDPLANOPREV').AsInteger;
        iIdPessJur      := qryPart.FieldByName('IDPESSJUR').AsInteger;
        if qryPart.FieldByName('IDESTAB').AsString <> ''
         then iIdFilial := qryPart.FieldByName('IDESTAB').AsInteger;
        sMatricula      := qryPart.FieldByName('MATRICULA').AsString;
        sInscricao      := qryPart.FieldByName('INSCRICAONUMERO').AsString;
  //
        AbrirForm(frmCadDepTitPlanAss, TfrmCadDepTitPlanAss, false);
       End;

     (* "Comita" a transação *)

      if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
  end;
  dbLkPlano.Text:='';
  cmbCobra.ItemIndex:=-1;
  cBBenef.Text:='';

  (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
  FazerInsertFiario(qryIDPESSOA.AsInteger,qryIDPESSOA.AsInteger,Sistema.IdUsuario,
                     Sistema.IdModulo,'INCLUSÃO DE PARTICIPANTE EM PLANO ASSISTENCIAL');

  (* Pega a Lista de Contribuições registradas no Assistencial *)
  PegaListaContrib;
  (* Limpa os campos atraves da rotina de cancelamento *)
  bbtnCancelarClick(Self);
end;

procedure TFrmInserePart.bbtnCancelarClick(Sender: TObject);
Var I: Integer;
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Rollback;
  (* Limpa todos os edits do form *)
  For I:=0 to ComponentCount-1 do
  If Components[I] is TEdit then TEdit(Components[I]).Text:='';
  bbtnConfirmar.Enabled:=False;
  bbtnCancelar.Enabled:=False;
end;

procedure TFrmInserePart.FormShow(Sender: TObject);
begin
  inherited;
  DTInscricao.Date:=Now;
end;

procedure TFrmInserePart.dblkPlanoChange(Sender: TObject);
begin
  inherited;
  EdOpcaoB.Text:=qryPlanosOPCAOAIDENT.AsString;
  ChkOpcaoA.Checked:=False;
  grbCobDif.Visible:=(qryPlanosOPCAOBDIF.AsString='1');
end;

end.
