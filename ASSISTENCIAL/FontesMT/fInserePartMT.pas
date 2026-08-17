unit fInserePartMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, URegra,
  ComCtrls, wwdblook, DBTables, Wwquery, UCmCustomCdbObject, uCtrlInserePart,
  MConnect, SConnect, Provider;

type
  TFrmInserePart = class(TFrmCadastroMT)
    Label1: TLabel;
    lblFalecido: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdNome: TEdit;
    EdNumInsc: TEdit;
    EdMat: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdPatro: TEdit;
    EdSituacao: TEdit;
    EdEstCivil: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    EdNascimento: TEdit;
    EdSexo: TEdit;
    EdPlano: TEdit;
    EdDataInsc: TEdit;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EdDepend: TEdit;
    EdBanco: TEdit;
    EdConta: TEdit;
    Label14: TLabel;
    EdEndereco: TEdit;
    Label48: TLabel;
    dblkPlano: TwwDBLookupCombo;
    Label16: TLabel;
    EdOpcaoB: TEdit;
    Label15: TLabel;
    CmbCobra: TComboBox;
    Label44: TLabel;
    CbBenef: TComboBox;
    Label49: TLabel;
    DTInscricao: TDateTimePicker;
    ChkOpcaoA: TCheckBox;
    chkBenef: TCheckBox;
    RegraADM: TRegra;
    CdsContribass: TCMClientDataSet;
    CdsPlanos: TCMClientDataSet;
    CdsIdRegra: TCMClientDataSet;
    CdsRegraAdm: TCMClientDataSet;
    CdsPlanosPart: TCMClientDataSet;
    CdsParticipante: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    Skt: TSocketConnection;
    qry: TwwQuery;
    qryRegraADM: TwwQuery;
    DataSetProvider1: TDataSetProvider;
    DataSetProvider2: TDataSetProvider;
    CdsIDPESSOA: TFloatField;
    CdsMATRICULA: TStringField;
    CdsINSCRICAONUMERO: TFloatField;
    CdsIDPESSJUR: TFloatField;
    CdsSITUACAO: TStringField;
    CdsNOME: TStringField;
    CdsDATANASC: TDateTimeField;
    CdsIDADE: TFloatField;
    CdsSEXO: TStringField;
    CdsIDRESPONSAVEL: TFloatField;
    CdsRESPONSAVEL: TStringField;
    CdsESTCIVIL: TStringField;
    CdsPATROCINADORA: TStringField;
    CdsDEPENDENTE: TStringField;
    CdsDEPENDENCIA: TStringField;
    CdsLEGAL: TStringField;
    CdsIDPLANOPREV: TFloatField;
    CdsPREVIDENCIARIO: TStringField;
    CdsINSCRICAODATA: TDateTimeField;
    CdsENDERECO: TStringField;
    CdsCONTA: TStringField;
    CdsBANCO: TStringField;
    CdsIDNUCLEO: TFloatField;
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dblkPlanoChange(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
    CtrlInserePart: TCtrlInserePart;
    MessageInfo: TOnMessageInfo;
  protected
    procedure Mensagem(sMensagem: String);

  public
    { Public declarations }
    iIdTitular, iIdPlanAss, iIdPlanoPrev, iIdPessJur, iIdFilial  : Integer;
    sMatricula, sInscricao, sOpcao                               : String;
  end;

var
  FrmInserePart: TFrmInserePart;

implementation

uses UMensErro, DBaseDados, USistema, UAdmAss, FTelaAut, FCadGeralPart,
  FCadGrupoFamiliarass, fCadDepTitPlanAss;

{$R *.DFM}

procedure TFrmInserePart.Mensagem(sMensagem: String);
begin
   MsgDlg(sMensagem,'Atenção',MtInformation,[mbOk],0);
end;

procedure TFrmInserePart.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  If sOpcao = 'PART' Then MontaSelect.Executar;
  CmeCadastroFind(Self);
  sbtnInserir.Down:=False;
  bbtnConfirmar.Enabled:=True;
  bbtnCancelar.Enabled:=True;
  pnlFundo.Enabled:=True;
  dblkPlano.SetFocus;
end;

procedure TFrmInserePart.bbtnCancelarClick(Sender: TObject);
Var I: Integer;
begin
  inherited;
  (* Limpa todos os edits do form *)
  For I:=0 to ComponentCount-1 do
  If Components[I] is TEdit then TEdit(Components[I]).Text:='';
  bbtnConfirmar.Enabled:=False;
  bbtnCancelar.Enabled:=False;
end;

procedure TFrmInserePart.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlInserePart:= TCtrlInserePart.Create;

  CtrlInserePart.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                           MessageInfo);

  CtrlInserePart.CdsPartPrev:= Cds;
  CtrlInserePart.CdsParticipante:= CdsParticipante;
  CtrlInserePart.CdsRegraAdm:= CdsRegraAdm;

  CtrlInserePart.OnMessageInfo := Mensagem;

  Cds.Open;

    sOpcao:=frmCadGeralPart.sOpcao;
  If sOpcao = 'PLAN' Then CmeCadastroFind(Self);
end;

procedure TFrmInserePart.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If (MontaSelect.RetornouValor) or (sOpcao = 'PLAN') Then
  begin
     (* Analise se o participante é falecido e cadastra responsavel NF *)
     If MontaSelect.RetornouValor Then
        If (MontaSelect.ValoresChave[2] = '') and (MontaSelect.ValoresChave[3] <> '') Then
         Begin
           MsgDlg('O participante é falecido e não tem responsável'+#13+
                  'pelo grupo  familiar  cadastrado. É  necessário'+#13+
                  'primeiro cadastrar NUCLEO FAMILIAR.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
           WindowState:=wsMinimized;
   {ver}{} AbrirForm(FrmCadGrupoFamiliarass, TFrmCadGrupoFamiliarass, false);
           Abort;
         End;
     (* Query de busca ==> Acha o participante (vivo ou falecido) *)
     Cds.Close;
     If sOpcao = 'PLAN' then Cds.Params[0].Value := frmCadGeralPart.vIdPessoa
     else Cds.Params[0].Value:=StrToIntDef(MontaSelect.ValoresChave[0],0);
     Cds.Open;

     (* Query de plano ==> Acha os planos que o participante ainda não tem *)
     CdsPlanos.Close;
     If sOpcao = 'PLAN' Then
      CdsPlanos.Data := CtrlInserePart.SelPlanos(IntToStr(frmCadGeralPart.vIdPessoa))
     Else CdsPlanos.Data:= CtrlInserePart.SelPlanos(MontaSelect.ValoresChave[1]);
     CdsPlanos.Open;
     (* se quantidade de registros na qryPlanos for = 0 então avisa ao *)
     (* usuário que não há mais planos disponíveis para o participante *)
     If CdsPlanos.RecordCount = 0 Then
     Begin
       MsgDlg('Não há mais planos disponíveis para este participante.','Erro',
               mtError,[mbOk,mbHelp],0);
       If sOpcao = 'PLAN' Then bbtnSairClick(Self);
     End;
     (* Verifica se o grupo familiar possui um responsável *)
     (* Tabela para Referencia : GrupoFamAss               *)
     lblFalecido.Caption:='';
     If Cds.FieldByName('IDRESPONSAVEL').AsString <> '' then
     Begin
       lblFalecido.Caption:='Participante Falecido: '+Cds.FieldByName('NOME').AsString;
       lblFalecido.Visible:=True;
       EdNome.Text:=Cds.FieldByName('RESPONSAVEL').AsString;
     End
     Else
     Begin
       lblFalecido.Visible:=False;
       EdNome.Text:=Cds.FieldByName('NOME').AsString;
     End;
     EdNumInsc.Text:=Cds.FieldByName('INSCRICAONUMERO').AsString;
     EdMat.Text:=Cds.FieldByName('MATRICULA').AsString;
     EdPatro.Text:=Cds.FieldByName('PATROCINADORA').AsString;
     EdSituacao.Text:=Cds.FieldByName('SITUACAO').AsString;
     EdEstCivil.Text:=Cds.FieldByName('ESTCIVIL').AsString;
     EdNascimento.Text:=Cds.FieldByName('DATANASC').AsString+' ('+
                         Cds.FieldByName('IDADE').AsString+' Anos)';
     If Cds.FieldByName('IDPESSOA').AsString<>'' then
     begin
       If Cds.FieldByName('SEXO').AsString='M' then EdSexo.Text:='MASCULINO'
       else If Cds.FieldByName('SEXO').AsString<>'' then EdSexo.Text:='FEMININO';
     end;
     EdDepend.Text:=UpperCase(Cds.FieldByName('DEPENDENCIA').AsString);
     EdPlano.Text:=Cds.FieldByName('PREVIDENCIARIO').AsString;
     EdDataInsc.Text:=Cds.FieldByName('INSCRICAODATA').AsString;
     EdBanco.Text:=Cds.FieldByName('BANCO').AsString;
     EdConta.Text:=Cds.FieldByName('CONTA').AsString;
     EdEndereco.Text:=Cds.FieldByName('ENDERECO').AsString;
  end;
end;

procedure TFrmInserePart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlInserePart.Free;
  FrmCadGeralPart.WindowState:=wsMaximized;
end;

procedure TFrmInserePart.FormShow(Sender: TObject);
begin
  inherited;
  DTInscricao.Date:=Now;
end;

procedure TFrmInserePart.dblkPlanoChange(Sender: TObject);
begin
  inherited;
  EdOpcaoB.Text:=CdsPlanos.FieldByName('OPCAOAIDENT').AsString;
  ChkOpcaoA.Visible:=(CdsPlanos.FieldByName('OPCAOBDIF').AsString='1');
end;

Procedure TFrmInserePart.CmeCadastroConfirma(Sender: TObject);
var sPlano,sIdSitPart,sMes,sData : String;
    Ano,Mes,Dia                  : Word;
    bExiste, bConfirmaInclusao   : Boolean;

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
begin
  CdsAux.Data:=CtrlInserePart.SelAssocPlanPrev(Cds.FieldByName('IDPESSJUR').AsString,
                sPlano, Cds.FieldByName('IDPLANOPREV').AsString);
  If CdsAux.IsEmpty then MsgDlg('Falta associação de plano previdenciário com plano assistencial, '+
                            '(MENU PRINCIPAL - CADASTROS - INTEGRAÇÃO - PREVIDENCIÁRIO).',
                             'Erro',mtError,[mbOk,mbHelp],0);
  Result:=CdsAux.IsEmpty;
end;

begin
  inherited;
  iIdTitular   := 0;
  iIdPlanAss   := 0;
  iIdPlanoPrev := 0;
  iIdPessJur   := 0;
  iIdFilial    := 0;
  sMatricula   := '';
  sInscricao   := '';
  bConfirmaInclusao:=False;

  If Cds.FieldByName('IDPESSOA').AsString='' then Abort;

  CdsAux.Data:=CtrlInserePart.SelPartExiste(Cds.FieldByName('IDPESSOA').AsString);
  bExiste:= Not CdsAux.IsEmpty;
  If bExiste then
  begin
    MsgDlg('Participante foi incluido anteriormente','Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;

 (* Avalia se os campos estão preenchidos *)
  If ExisteErro then Abort;

  sPlano := dblkPlano.LookupValue;

 (* Verifica se houve erro na PlanPrevAss *)
  If ErroPlanPrevAss then Abort;

  decodedate(DTInscricao.Date,Ano,Mes,Dia);
  sMes := FloattoStr(Mes);
  if strtoint(sMes) < 10 then sMes := '0'+sMes;
  sMes := FloatToStr(Ano)+'/'+sMes;

  (* IdSitPlanoAss da Tabela SitPlanoAss *)
  if CbBenef.ItemIndex = 0
   then sIdSitPart := '1'  (* Normal           *)
   else sIdSitPart := '8'; (* Não Beneficiário *)

  sData := DatetoStr(DTInscricao.Date);

  (* Testa Regra de Admissão dos Planos  *)
  CdsIdRegra.Data:=CtrlInserePart.SelIdRegra(sPlano);

  CdsRegraAdm.Close;
  if sIdSitPart = '1' then // beneficiário:SIM
     (* Parametro FLGPARTBENEF *)
    CdsRegraAdm.Params[0].Value:=1
  else CdsRegraAdm.Params[0].Value:=0;

  If CdsIdRegra.FieldByName('IDREGRAADMISSAO').AsString <> '' then
  begin
    RegraADM.RuleName := CdsIdRegra.FieldByName('IDREGRAADMISSAO').AsString;
    (* Parametro PMESREF *)
    CdsRegraAdm.Params[1].Value:=sMES;
    (* Parametro IDPLANOPREV *)
    CdsRegraAdm.Params[2].Value:= Cds.FieldByName('IDPLANOPREV').Value;
    (* Parametro IDPESSJUR *)
    CdsRegraAdm.Params[3].Value:= Cds.FieldByName('IDPESSJUR').Value;
    (* Parametro IDPESSOA *)
    CdsRegraAdm.Params[4].Value:= Cds.FieldByName('IDPESSOA').Value;
    CdsRegraAdm.Open;
    RegraADM.execute;
    If (RegraADM.result = 'False') or (regraADM.result = '')  then
    begin
      MsgDlg('Não pode ser cadastrado como participante, pois não atende Regra de admissão do plano!','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
    end;
  end;

  (* PARTASS *)
  CtrlInserePart.DbPartass.IDPESSJUR.Value:=Cds.FieldByName('IDPESSJUR').Value;
  CtrlInserePart.DbPartass.SEQPROPOSTA.Value:='1';
  CtrlInserePart.DbPartass.IDPLANOPREV.Value:=Cds.FieldByName('IDPLANOPREV').Value;
  CtrlInserePart.DbPartass.IDPESSOA.Value:=Cds.FieldByName('IDPESSOA').Value;
  CtrlInserePart.DbPartass.IDPLANASS.Value:=sPlano;
  CtrlInserePart.DbPartass.IDSITPART.Value:=sIdSitPart;
  CtrlInserePart.DbPartass.DATAENTRADA.Value:=StrToDate(sData);{Ver} {}
  CtrlInserePart.DbPartass.TIPOFORNSERV2.Value:='';
  CtrlInserePart.DbPartass.OPCAOBDIF.Value:='';
  CtrlInserePart.DbPartass.DATACANCELAMENTO.Value:='';
  CtrlInserePart.DbPartass.INSCRICAOTIPO.Value:='';
  CtrlInserePart.DbPartass.OBSCANCEL.Value:='';
  CtrlInserePart.DbPartass.IDFORNSERV2.Value:=0;
  CtrlInserePart.DbPartass.COMISSFORN.Value:=0;
  CtrlInserePart.DbPartass.COMISSFUND.Value:=0;
  CtrlInserePart.DbPartass.FLGOPCAOA.Value:=0;
  CtrlInserePart.DbPartass.FLGOPCAOB.Value:=0;
  CtrlInserePart.DbPartass.IDNUCLEO.Value:=0;
  CtrlInserePart.DbPartass.OPCAOAIDENT.Value:='';
  CtrlInserePart.DbPartass.FLGINSCRICAOCANC.Value:=0;
  CtrlInserePart.DbPartass.INSCRICAONUMERO.Value:='';
  CtrlInserePart.DbPartass.FLGPARTBENEF.Value:='';
  CtrlInserePart.DbPartass.OPCAOA.Value:='';
  CtrlInserePart.DbPartass.OPCAOB.Value:='';

  If Cds.FieldByName('IDRESPONSAVEL').AsString = '' then
  begin
(*   *****************************************************************            *)
(*      O Participante NÃO É PENSIONISTA                                          *)
(*   *****************************************************************            *)
    if sIdSitPart = '1' then
    begin
(*       =============================================================            *)
(*       É BENEFICIÁRIO do plano ( 1 - FLGPARTBENF)                               *)
(*       =============================================================            *)
      CtrlInserePart.DbPartass.FLGPARTBENEF.Value:='1';
(*         FLGINSCRICAOCANC - 0 - Inscrição Não Cancelada                         *)
(*                            1 - Inscrição CANCELADA                             *)
(*       temos 4 situações:                                                       *)
(*       Titular Benefeciário                                                     *)
(*         -> Dependentes Beneficiários NÃO Cancelados ----> FLGINSCRICAOCANC = 0 *)
(*         -> Dependentes NÃO Beneficiários OU Cancelados -> FLGINSCRICAOCANC = 0 *)
(*       Titular NÃO Beneficiário                                                 *)
(*         -> Dependentes Beneficiários NÃO Cancelados ----> FLGINSCRICAOCANC = 0 *)
(*         -> Dependentes NÃO Beneficiários OU Cancelados -> FLGINSCRICAOCANC = 1 *)
      CtrlInserePart.DbPartass.FLGINSCRICAOCANC.Value:='0';
(*         Participante NÃO Pensionista - IDNUCLEO nulo                       *)
      CtrlInserePart.DbPartass.IDNUCLEO.Value:=0; {Null}
(*         Participante NÃO Pensionista - Identificador do plano escolhido    *)
      CtrlInserePart.DbPartass.OPCAOB.Value:= EdOpcaoB.Text;
(*         Participante NÃO Pensionista - Seleciona cobrança diferenciada     *)
      If (ChkOpcaoA.Visible) and (ChkOpcaoA.Checked) then
        CtrlInserePart.DbPartass.OPCAOA.Value:='1'
      else CtrlInserePart.DbPartass.OPCAOA.Value:='0';
(*         Participante NÃO Pensionista - Número da inscrição do participante *)
      CtrlInserePart.DbPartass.INSCRICAONUMERO.Value:=Cds.FieldByName('INSCRICAONUMERO').AsString;

      (* INSERÇÃO NA PARTASS *)
      Case CmeCadastro.Operacao Of
        opInserir : bConfirmaInclusao := CtrlInserePart.Inserir('P');
      end;

      If Not bConfirmaInclusao Then
      Begin
        Mensagem(CtrlInserePart.MessageInfo);
        Abort;
      End;

      (* BENEFASS *)
      CtrlInserePart.DbBenefass.IDTITULAR.Value:= Cds.FieldByName('IDPESSOA').AsString;
      CtrlInserePart.DbBenefass.IDPESSJUR.Value:= Cds.FieldByName('IDPESSJUR').AsString;
      CtrlInserePart.DbBenefass.IDPLANOPREV.Value:= Cds.FieldByName('IDPLANOPREV').AsString;
      CtrlInserePart.DbBenefass.IDPLANASS.Value:= sPlano;
      CtrlInserePart.DbBenefass.IDDEPENDENTE.Value:= Cds.FieldByName('IDPESSOA').AsString;
      CtrlInserePart.DbBenefass.DATAENTRADA.Value:= StrToDate(sData);
      CtrlInserePart.DbBenefass.SEQPROPOSTA.Value:= 1;
      (*  FLGATIVO - 0 - NÃO Ativo                                                  *)
      (*             1 - ATIVO                                                      *)
      (*   Este flag será sempre 1 - Ativo pois o participante esta sendo inserido  *)
      (*   No cancelamento do participante este flag deve ser 0 - Não Ativo         *)
      CtrlInserePart.DbBenefass.FLGATIVO.Value:= 1;
      (*   RESPONSAVELPAG - 0 - NÃO Responsável                                     *)
      (*                    1 - Responsável pelo pagamento                          *)
      (* Como o Participante Não é pensionista e É BENEFICIÁRIO do plano            *)
      (* Este flag será 1 - Responsável pelo pagamento pois é ele(participante) quem*)
      (* pagará as contribuições dele próprio e dos seus dependentes                *)
      CtrlInserePart.DbBenefass.RESPONSAVELPAG.Value:= 1;

      (* INSERÇÃO NA BENEFASS *)
      Case CmeCadastro.Operacao Of
        opInserir : bConfirmaInclusao := CtrlInserePart.Inserir('B');
      end;

      If Not bConfirmaInclusao Then
      Begin
        Mensagem(CtrlInserePart.MessageInfo);
        Abort;
      End;
      (* SELECIONA CONTRIBUIÇÃO *)
      CdsContribass.Data:=CtrlInserePart.SelContribuicao(sPlano);
      (* SELECIONA PLANOS RELACIONADOS AO PARTICIPANTE *)
      CdsPlanosPart.Data:=CtrlInserePart.SelPlanosPart(Cds.FieldByName('IDPESSOA').AsString,sPlano);

      (* CONTASS *)
      While not CdsContribass.EOF do
      begin
        CtrlInserePart.DbContass.IDPLANASS.Value:= sPlano;
        CtrlInserePart.DbContass.IDTITULAR.Value:= Cds.FieldByName('IDPESSOA').AsString;
        CtrlInserePart.DbContass.IDDEPENDENTE.Value:= Cds.FieldByName('IDPESSOA').AsString;
        CtrlInserePart.DbContass.IDPLANOPREV.Value:= Cds.FieldByName('IDPLANOPREV').AsString;
        CtrlInserePart.DbContass.IDPESSJUR.Value:= Cds.FieldByName('IDPESSJUR').AsString;
        CtrlInserePart.DbContass.IDCONTASS.Value:= CdsContribass.FieldByName('IDCONTASS').AsString;
        CtrlInserePart.DbContass.FLGATIVO.Value:= 1;
        CtrlInserePart.DbContass.RECPAG.Value:= 'R';
        (* Se for escolhido boleto bancário, pega codportforma da tabela Planass *)
        If (CmbCobra.ItemIndex = 1)And(Not CdsPlanosPart.IsEmpty) then
          CtrlInserePart.DbContass.CODPORTFORMA.Value:= CdsPlanosPart.FieldByName('CODPORTFORMA').AsString
        else CtrlInserePart.DbContass.CODPORTFORMA.Value:= '0'; {NULL}

        CtrlInserePart.DbContass.FLGCOBCARNE.Value:= '0'; {NULL}

        (* PAGADOR - C = Contribuinte, isto é, o próprio participante         *)
        (*           P = Patrocinadora                                        *)
        If CdsContribass.FieldByName('PAGADOR').AsString = 'C' then
        (* Será usado o ID do pensionista pois o pagador será ele             *)
          CtrlInserePart.DbContass.IDPAGADOR.Value:= Cds.FieldByName('IDPESSOA').AsString
        (* Será usado ID da patrocinadora pois o pagador será a Patrocinadora *)
        else CtrlInserePart.DbContass.IDPAGADOR.Value:= Cds.FieldByName('IDPESSJUR').AsString;

        CtrlInserePart.DbContass.SEQPROPOSTA.Value:= 1;

        (* INSERÇÃO NA CONTASS *)
        Case CmeCadastro.Operacao Of
          opInserir : bConfirmaInclusao := CtrlInserePart.Inserir('C');
        end;
        If Not bConfirmaInclusao Then
        Begin
          Mensagem(CtrlInserePart.MessageInfo);
          Abort;
        End;
        CdsContribass.Next;
      end;(* while *)
      CdsPlanosPart.Close;
      CdsContribass.Close;
    end
    else
    begin
(*   *****************************************************************        *)
(*    O Participante NÃO É PENSIONISTA                                        *)
(*   *****************************************************************        *)
(*       =============================================================        *)
(*       NÃO É BENEFICIÁRIO do plano ( 0 - FLGPARTBENF)                       *)
(*       =============================================================        *)
      CtrlInserePart.DbPartass.FLGPARTBENEF.Value:='0';

(*       FLGINSCRICAOCANC - 0 - Inscrição Não Cancelada                       *)
(*                          1 - Inscrição CANCELADA                           *)
(*      este flag será alterado para 0 quando for inserido                    *)
(*      um Dependente Beneficiário                                            *)
      CtrlInserePart.DbPartass.FLGINSCRICAOCANC.Value:='1';
(*      Participante NÃO Pensionista - IDNUCLEO nulo                          *)
      CtrlInserePart.DbPartass.IDNUCLEO.Value:=0; {NULL}
(*      Participante NÃO Pensionista - Identificador do plano escolhido       *)
      CtrlInserePart.DbPartass.OPCAOB.Value:=EdOpcaoB.Text;
(*      Participante NÃO Pensionista - Seleciona cobrança diferenciada        *)
      If (ChkOpcaoA.Visible) and (ChkOpcaoA.Checked) then
        CtrlInserePart.DbPartass.OPCAOA.Value:='1'
      else CtrlInserePart.DbPartass.OPCAOA.Value:='0';
(*      Participante NÃO Pensionista - Número da inscrição do participante    *)
      CtrlInserePart.DbPartass.INSCRICAONUMERO.Value:= Cds.FieldByName('INSCRICAONUMERO').AsString;

      (* INSERÇÃO NA PARTASS *)
      Case CmeCadastro.Operacao Of
        opInserir : bConfirmaInclusao := CtrlInserePart.Inserir('P');
      end;
      If Not bConfirmaInclusao Then
      Begin
        Mensagem(CtrlInserePart.MessageInfo);
        Abort;
      End;
    end;   (* if sIdSitPart = '1'                                   *)
  end      (* FIM do Participante NÃO É PENSIONISTA                 *)
   else
    begin
(*   ******************************************************************       *)
(*    O Participante É PENSIONISTA                                            *)
(*   *****************************************************************        *)
(*       ============================================================         *)
(*       INDEPENDENTE do PENSIONISTA ser BENEFICIÁRIO ou Não do plano         *)
(*       quem vai ser inserido na PARTASS é o participante falecido e         *)
(*       é lógico que o falecido não será beneficiário do plano               *)
(*       ---> NÃO é beneficiário do plano ( 0 - FLGPARTBENF)                  *)
(*       =============================================================        *)
      CtrlInserePart.DbPartass.FLGPARTBENEF.Value:='0';
(*       FLGINSCRICAOCANC - 0 - Inscrição Não Cancelada                       *)
(*                          1 - Inscrição CANCELADA                           *)
(*       Será 0 pois o pensionista será inserido, na sequencia, na BENEFASS   *)
      CtrlInserePart.DbPartass.FLGINSCRICAOCANC.Value:='0';
(*       Participante Pensionista - IDNUCLEO do Núcleo Familiar               *)
      CtrlInserePart.DbPartass.IDNUCLEO.Value:=StrToIntDef(Cds.FieldByName('IDNUCLEO').AsString,0);
(*       Participante Pensionista - Identificador do plano escolhido          *)
      CtrlInserePart.DbPartass.OPCAOB.Value:=EdOpcaoB.Text;
(*       Participante Pensionista - Seleciona cobrança diferenciada           *)
      If (ChkOpcaoA.Visible) and (ChkOpcaoA.Checked) then
          CtrlInserePart.DbPartass.OPCAOA.Value:='1'
      else CtrlInserePart.DbPartass.OPCAOA.Value:='0';
(*       Participante Pensionista - Número da inscrição do participante       *)
      CtrlInserePart.DbPartass.INSCRICAONUMERO.Value:= Cds.FieldByName('INSCRICAONUMERO').AsString;


      (* INSERÇÃO NA PARTASS *)
      Case CmeCadastro.Operacao Of
        opInserir : bConfirmaInclusao := CtrlInserePart.Inserir('P');
      end;
      If Not bConfirmaInclusao Then
      Begin
        Mensagem(CtrlInserePart.MessageInfo);
        Abort;
      End;

(*       Caso o Pensionista NÃO seja beneficiário ele só será inserido  na    *)
(*       PARTASS e sua implementação termina aqui. Caso o Pensionista seja    *)
(*       BENEFICIÁRIO deve ser inserido também na BENEFASS e CONTASS          *)

      if sIdSitPart = '1' then
      begin
(*       =============================================================        *)
(*       o PENSIONISTA É BENEFICIÁRIO do plano                                *)
(*       =============================================================        *)
        (* BENEFASS *)
(*                O IDTITULAR será o do participante FALECIDO                 *)
        CtrlInserePart.DbBenefass.IDTITULAR.Value:= Cds.FieldByName('IDPESSOA').AsString;
        CtrlInserePart.DbBenefass.IDPESSJUR.Value:= Cds.FieldByName('IDPESSJUR').AsString;
        CtrlInserePart.DbBenefass.IDPLANOPREV.Value:= Cds.FieldByName('IDPLANOPREV').AsString;
        CtrlInserePart.DbBenefass.IDPLANASS.Value:= sPlano;
(*    O IDDEPENDENTE será o do PENSIONISTA - Responsável do Núcleo Familiar   *)
        CtrlInserePart.DbBenefass.IDDEPENDENTE.Value:= Cds.FieldByName('IDRESPONSAVEL').AsString;
        CtrlInserePart.DbBenefass.DATAENTRADA.Value:= StrToDate(sData);
        CtrlInserePart.DbBenefass.SEQPROPOSTA.Value:= 1;
        (*  FLGATIVO - 0 - NÃO Ativo                                                  *)
        (*             1 - ATIVO                                                      *)
        (*   Este flag será sempre 1 - Ativo pois o participante esta sendo inserido  *)
        (*   No cancelamento do participante este flag deve ser 0 - Não Ativo         *)
        CtrlInserePart.DbBenefass.FLGATIVO.Value:= 1;
        (*   RESPONSAVELPAG - 0 - NÃO Responsável                                     *)
        (*                    1 - Responsável pelo pagamento                          *)
        (* Como o Participante Não é pensionista e É BENEFICIÁRIO do plano            *)
        (* Este flag será 1 - Responsável pelo pagamento pois é ele(participante) quem*)
        (* pagará as contribuições dele próprio e dos seus dependentes                *)
        CtrlInserePart.DbBenefass.RESPONSAVELPAG.Value:= 1;

        (* INSERÇÃO NA BENEFASS *)
        Case CmeCadastro.Operacao Of
          opInserir : bConfirmaInclusao := CtrlInserePart.Inserir('B');
        end;

        If Not bConfirmaInclusao Then
        Begin
          Mensagem(CtrlInserePart.MessageInfo);
          Abort;
        End;

        (* SELECIONA CONTRIBUIÇÃO *)
        CdsContribass.Data:=CtrlInserePart.SelContribuicao(sPlano);
        (* SELECIONA PLANOS RELACIONADOS AO PARTICIPANTE *)
        CdsPlanosPart.Data:=CtrlInserePart.SelPlanosPart(Cds.FieldByName('IDPESSOA').AsString,sPlano);

        (* CONTASS *)
        While not CdsContribass.EOF do
        begin
          CtrlInserePart.DbContass.IDPLANASS.Value:= sPlano;
          CtrlInserePart.DbContass.IDTITULAR.Value:= Cds.FieldByName('IDPESSOA').AsString;
          CtrlInserePart.DbContass.IDDEPENDENTE.Value:= Cds.FieldByName('IDRESPONSAVEL').AsString;
          CtrlInserePart.DbContass.IDPLANOPREV.Value:= Cds.FieldByName('IDPLANOPREV').AsString;
          CtrlInserePart.DbContass.IDPESSJUR.Value:= Cds.FieldByName('IDPESSJUR').AsString;
          CtrlInserePart.DbContass.IDCONTASS.Value:= CdsContribass.FieldByName('IDCONTASS').AsString;
          CtrlInserePart.DbContass.FLGATIVO.Value:= 1;
          CtrlInserePart.DbContass.RECPAG.Value:= 'R';

          (* Se for escolhido boleto bancário, pega codportforma da tabela Planass *)
          If (CmbCobra.ItemIndex = 1)And(Not CdsPlanosPart.IsEmpty) then
            CtrlInserePart.DbContass.CODPORTFORMA.Value:= CdsPlanosPart.FieldByName('CODPORTFORMA').AsString
          else CtrlInserePart.DbContass.CODPORTFORMA.Value:= '0'; {NULL}

          CtrlInserePart.DbContass.FLGCOBCARNE.Value:= 'O'; {NULL}

          (* PAGADOR - C = Contribuinte, isto é, o próprio participante         *)
          (*           P = Patrocinadora                                        *)
          If CdsContribass.FieldByName('PAGADOR').AsString = 'C' then
          (* Será usado o ID do pensionista pois o pagador será ele             *)
            CtrlInserePart.DbContass.IDPAGADOR.Value:= Cds.FieldByName('IDRESPONSAVEL').AsString
          (* Será usado ID da patrocinadora pois o pagador será a Patrocinadora *)
          else CtrlInserePart.DbContass.IDPAGADOR.Value:= Cds.FieldByName('IDPESSJUR').AsString;

          CtrlInserePart.DbContass.SEQPROPOSTA.Value:= 1;

          (* INSERÇÃO NA CONTASS *)
          Case CmeCadastro.Operacao Of
            opInserir : bConfirmaInclusao := CtrlInserePart.Inserir('C');
          end;

          If Not bConfirmaInclusao Then
          Begin
            Mensagem(CtrlInserePart.MessageInfo);
            Abort;
          End;
          CdsContribass.Next;
         end;(* while *)
        CdsContribass.Close;
        CdsPlanosPart.Close;
      end; (* FIM do Pensionista BENEFICIÁRIO *)
    end; (* if qryIDNUCLEO *)
(*     Se o checkbox estiver assinalado deverá abrir a tela de cadastro de    *)
(*     beneficiários para novos cadastros.                                    *)
    If chkBenef.Checked Then
     Begin
       CdsParticipante.Data:=CtrlInserePart.SelParticipante(Cds.FieldByName('INSCRICAONUMERO').AsString);
//
      iIdTitular      := CdsParticipante.FieldByName('IDPESSOA').AsInteger;
      iIdPlanAss      := CdsParticipante.FieldByName('IDPLANASS').AsInteger;
      iIdPlanoPrev    := CdsParticipante.FieldByName('IDPLANOPREV').AsInteger;
      iIdPessJur      := CdsParticipante.FieldByName('IDPESSJUR').AsInteger;
      if CdsParticipante.FieldByName('IDESTAB').AsString <> '' then
        iIdFilial := CdsParticipante.FieldByName('IDESTAB').AsInteger;
      sMatricula      := CdsParticipante.FieldByName('MATRICULA').AsString;
      sInscricao      := CdsParticipante.FieldByName('INSCRICAONUMERO').AsString;
//
      AbrirForm(frmCadDepTitPlanAss, TfrmCadDepTitPlanAss, false);
     End;

    dbLkPlano.Text:='';
    cmbCobra.ItemIndex:=-1;
    cBBenef.Text:='';

    (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
    FazerInsertFiario(Cds.FieldByName('IDPESSOA').AsInteger,
                      Cds.FieldByName('IDPESSOA').AsInteger,Sistema.IdUsuario,
                       Sistema.IdModulo,'INCLUSÃO DE PARTICIPANTE EM PLANO ASSISTENCIAL');

    (* Limpa os campos atraves da rotina de cancelamento *)

    bbtnCancelarClick(Self);
end;

end.
