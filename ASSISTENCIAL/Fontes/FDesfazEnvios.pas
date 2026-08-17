// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Hugo Luna
// Data        : 05/11/2007
// Pendencia   : 26793
// Rotina      : MontaSelect
// Alteração   : Adicionando condição no MontaSelect.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 31/09/2005
// Pendencia   : 19265
// Rotina      : FormShow, rgTipoClick, rdgCobrancasClick, btnLocalizarClick
// Alteração   : Criar rotina de Desfazer Individual
//------------------------------------------------------------------------------
unit FDesfazEnvios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, CheckLst, wwdblook, Spin, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables,
  Wwquery, ComCtrls, MontaSelect, UCtrlDocumento, UCtrlLancamento,
  uSistema;

type
  TfrmDesfazEnvios = class(TfrmOkCancelar)
    grpMesAnoRef: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    GrDatas: TGroupBox;
    DBLKDatas: TwwDBLookupCombo;
    rdgCobrancas: TRadioGroup;
    qryPatro: TwwQuery;
    qryDatasPreparos: TwwQuery;
    qryDatasPreparosDATA: TStringField;
    qryPatroIDPESSOA: TFloatField;
    qryPatroNOME: TStringField;
    qryBuscaLanc: TwwQuery;
    qryDesfaz: TwwQuery;
    qryPlanos: TwwQuery;
    qryPlanosIDPLANASS: TFloatField;
    qryPlanosPLANO: TStringField;
    pnlOpcoes: TPanel;
    pnlColetivo: TPanel;
    pnlIndividual: TPanel;
    GrPatros: TGroupBox;
    chklstPatro: TCheckListBox;
    ProgressBar: TProgressBar;
    GroupBox1: TGroupBox;
    chklstPlanos: TCheckListBox;
    rgTipo: TRadioGroup;
    Label1: TLabel;
    edtNomeParticip: TEdit;
    btnLocalizar: TBitBtn;
    edtNomePatro: TEdit;
    Label2: TLabel;
    edtMatricula: TEdit;
    Label3: TLabel;
    edtNomePlanoPrev: TEdit;
    Label4: TLabel;
    edtNumInscricao: TEdit;
    Label5: TLabel;
    edtNomePlanAss: TEdit;
    Label6: TLabel;
    MontaSelect: TMontaSelect;
    procedure cmbMesCobChange(Sender: TObject);
    procedure spedAnoCobChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure rdgCobrancasClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
    lstPatro, lstPlanos : TStringlist;

    // Gleyber - 31/08/2005 - Pendência 19265 - Início
    iIdPessoa,
    iIdPessjur,
    iIdPlanoPrev,
    iIdPlanAss,
    iSeqProposta  : Integer;
    // Gleyber - 31/08/2005 - Pendência 19265 - Fim

    CtrlDocumento           : TCtrlDocumento;
    CtrlLancamento          : TCtrlLancamento;


    function pegaMesCobranca : string;
    function pegaPatros : string;
    function pegaPlanos : string;
    function ApagaEnvioCorancaBancaria(data : TDateTime) : Boolean;
    function ApagaEnvioFolhaPagamentosBen(FlgPag, FlgBen : boolean) : Boolean;
  public
    { Public declarations }
  end;

const MinCommit = 10;

var
  FrmDesfazEnvios: TFrmDesfazEnvios;

implementation

uses DBaseDados, UMensErro;

{$R *.DFM}

{ TFrmDesfazEnvios }

function TfrmDesfazEnvios.pegaMesCobranca: string;
begin
  result :=  intTostr(spedAnoCob.Value) + '/' + stringofchar('0', 2 - length(intToStr(cmbMesCob.ItemIndex + 1))) + intToStr(cmbMesCob.ItemIndex + 1);
end;

procedure TfrmDesfazEnvios.cmbMesCobChange(Sender: TObject);
begin
  inherited;
  qryDatasPreparos.close;
  qryDatasPreparos.ParamByName('DATA').asString := pegaMesCobranca;
  qryDatasPreparos.Open;
end;

procedure TfrmDesfazEnvios.spedAnoCobChange(Sender: TObject);
begin
  inherited;
  qryDatasPreparos.close;
  qryDatasPreparos.ParamByName('DATA').asString := pegaMesCobranca;
  qryDatasPreparos.Open;
end;

procedure TfrmDesfazEnvios.FormCreate(Sender: TObject);
var wdia, wmes, wano : word;
begin
  inherited;
  decodeDate(now, wano, wmes, wdia);
  cmbMesCob.ItemIndex := wmes - 1;
  spedAnoCob.Value    := wAno;
  spedAnoCobChange(self);

  (* Preencher chkList da Patrocinadora *)
  lstPatro := TStringlist.Create;
  qryPatro.Close;
  qryPatro.Open;
  qryPatro.First;
  chkLstPatro.Items.Clear;
  lstPatro.Clear;
  while not qryPatro.EOF do
  begin
    lstPatro.Add(qryPatro.FieldByName('IDPESSOA').AsString);
    chkLstPatro.Items.Add(qryPatro.FieldByName('NOME').AsString);
    qryPatro.Next;
  end;(* while *)

 (* Preencher chkList de Planos *)
  lstPlanos := TStringlist.Create;
  qryPlanos.Close;
  qryPlanos.Open;
  qryPlanos.First;
  chkLstPlanos.Items.Clear;
  lstPlanos.Clear;
  while not qryPlanos.EOF do
  begin
    lstPlanos.Add(qryPlanos.FieldByName('IDPLANASS').AsString);
    chkLstPlanos.Items.Add(qryPlanos.FieldByName('PLANO').AsString);
    qryPlanos.Next;
  end;(* while *)


  Try
   CtrlDocumento := TCtrlDocumento.Create;
   CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                             True,
                             Sistema.ConnectionType,
                             Sistema.ConnectionSide,
                             Sistema.AppRemoteServer,
                             True );
  Except
   MsgDlg('Erro ao criar Controle de Documentos.','Erro',mtError,[mbOK],0);
   Abort;
  End;

  Try
   CtrlLancamento := TCtrlLancamento.Create;
   CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                             True,
                             Sistema.ConnectionType,
                             Sistema.ConnectionSide,
                             Sistema.AppRemoteServer,
                             True );
  Except
   MsgDlg('Erro ao criar Controle de Lançamento Contábil.','Erro',mtError,[mbOK],0);
   Abort;
  End;
end;



procedure TfrmDesfazEnvios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( CtrlDocumento );
  FreeAndNil( CtrlLancamento );
  lstPatro.Free;
  lstPlanos.Free;
  inherited;
end;

function TfrmDesfazEnvios.pegaPatros: string;
var
  strPatros : string;
  i : integer;
  temPatro : boolean;
begin
  temPatro := false;
  strPatros :='(';
  for i:=0 to chklstPatro.items.count-1 do
  begin
    if chklstPatro.checked[I] then
    begin
      strPatros := strPatros + lstPatro[I] + ',';
      temPatro := true
    end;
  end;
  if temPatro = false then
    strPatros := ''
  else
    strPatros[length(strPatros)] := ')';

  result := strPatros;
end;


function TfrmDesfazEnvios.pegaPlanos: string;
var
  strPlanos : string;
  i : integer;
  temPlano : boolean;
begin
  temPlano := false;
  strPlanos :='(';
  for i:=0 to chklstPlanos.items.count-1 do
  begin
    if chklstPlanos.checked[I] then
    begin
      strPlanos := strPlanos + lstPlanos[I] + ',';
      temPlano := true
    end;
  end;
  if temPlano = false then
    strPlanos := ''
  else
    strPlanos[length(strPlanos)] := ')';

  result := strPlanos;
end;




function TfrmDesfazEnvios.ApagaEnvioCorancaBancaria(data: TDateTime): Boolean;
var strPatros, strPlanos : string;
    contaBoleto, contCommit : integer;
begin
   contCommit := 0;
   strPatros := '';
   strPlanos := '';
   Result := false;
   strPatros := PegaPatros;
   strPlanos := PegaPlanos;
   If not dtmBaseDados.dbBaseDados.Intransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;
   qryBuscaLanc.Close;
   qryBuscaLanc.Sql.Clear;
   qryBuscaLanc.Sql.Add(' SELECT DISTINCT H.CODDOCPREV, H.MES, H.IDTITULAR, L.NUMLANCTO ');
   qryBuscaLanc.Sql.Add(' FROM HSTCONTRIBASS H, LANCTODOCUM L ');
   qryBuscaLanc.Sql.Add(' WHERE H.CODDOCPREV IS NOT NULL  AND H.FLGCOBCARNE = 1 AND H.MES = ' + QuotedStr(pegaMesCobranca));
   if (trim(dblkDatas.text) <> '') and (dblkDatas.lookupValue <> '') then
     qryBuscaLanc.Sql.Add(' AND TO_CHAR(H.TRGDTINCLUSAO, ''DD/MM/YYYY'') = ' + quotedStr(dblkDatas.lookupValue));

   // Gleyber - 31/08/2005 - Pendência 19265 - Início
   If rgTipo.ItemIndex = 0
    Then Begin
      if strPatros <> '' then
        qryBuscaLanc.Sql.Add(' AND H.IDPESSJUR IN '+ strPatros);
      if strPlanos <> '' then
        qryBuscaLanc.Sql.Add(' AND H.IDPLANASS IN '+ strPlanos);
    End
    Else Begin
      qryBuscaLanc.Sql.Add(' AND H.SEQPROPOSTA = '+IntToStr(iSeqProposta));
      qryBuscaLanc.Sql.Add(' AND H.IDPLANASS   = '+IntToStr(iIdPlanAss));
      qryBuscaLanc.Sql.Add(' AND H.IDPLANOPREV = '+IntToStr(iIdPlanoPrev));
      qryBuscaLanc.Sql.Add(' AND H.IDPESSJUR   = '+IntToStr(iIdPessjur));
      qryBuscaLanc.Sql.Add(' AND H.IDTITULAR   = '+IntToStr(iIdPessoa));
    End;

    qryBuscaLanc.Sql.Add(' AND H.CODDOCPREV  = L.CODDOCUMENTO');
    qryBuscaLanc.Sql.Add(' AND H.SITRECEBIMENTO = 1');
   // Gleyber - 31/08/2005 - Pendência 19265 - Fim

   qryBuscaLanc.Open;
   qryBuscaLanc.First;

   ProgressBar.Max := qryBuscaLanc.RecordCount;
   ProgressBar.Step := 1;


   if qryBuscaLanc.IsEmpty then
   begin
     showMessage('Não Há Lançamentos de Cobrança Bancária Para o Mês Selecionado.');
     exit;
   end;

   if Result = false then
   begin
     try
        (*  exclui documentos da HSTCONTRIBASS  *)
      qryBuscaLanc.First;
      contaBoleto := 1;

      qryBuscaLanc.First;
      while not qryBuscaLanc.Eof do
      begin
        try
          application.processMessages;
          ProgressBar.StepIt;
          ProgressBar.Update;

          CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);

          CtrlDocumento.CodDocumento := qryBuscaLanc.fieldByName('CODDOCPREV').AsInteger;
          CtrlDocumento.Lanctodocum.NumLancto := qryBuscaLanc.fieldByName('NUMLANCTO').AsInteger;

          If Not CtrlDocumento.Delete
            Then Begin
              MsgDlg('Erro ao apagar o documento '+qryBuscaLanc.fieldByName('CODDOCPREV').AsString+'.'+#13+#10+
                     '['+CtrlDocumento.MessageInfo+']','Erro', mtError, [mbOk], 0);
              Abort;
            End;

          qryDesfaz.Close;
          qryDesfaz.SQL.Add('UPDATE HSTCONTRIBASS ');
          qryDesfaz.SQL.Add('SET SITRECEBIMENTO = 0, ');
          qryDesfaz.SQL.Add('    CODDOCPREV     = NULL ');
          qryDesfaz.SQL.Add('WHERE CODDOCPREV = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString);
          qryDesFaz.ExecSql;
          application.processMessages;

{          qryDesfaz.Close;
          qryDesfaz.sql.text := ' DELETE FROM HSTCONTRIBASS WHERE CODDOCPREV = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString;
          qryDesFaz.ExecSql;
          application.processMessages;

         (* exclui as msgs CNAB (se houver) *)
          qryDesfaz.Close;
          qryDesfaz.sql.text := ' DELETE FROM MENSAGENSCNAB WHERE CODDOCUMENTO = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString;
          qryDesFaz.ExecSql;
          application.processMessages;

           // -------------------------------------------------------------------------------------------------

           (* exclui os RecbtoPagto *)

          qryDesfaz.Close;
          qryDesfaz.sql.text := ' DELETE FROM RECBTOPAGTO WHERE CODDOCUMENTO = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString;
          qryDesFaz.ExecSql;
          application.processMessages;

           (* exclui os LoteXDocum *)


         qryDesfaz.Close;
         qryDesfaz.sql.text := ' DELETE FROM LOTEXDOCUM WHERE CODDOCUMENTO = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString;
         qryDesFaz.ExecSql;
         application.processMessages;

           (* exclui os RateioDocum *)
         qryDesfaz.Close;
         qryDesfaz.sql.text := ' DELETE FROM RATEIODOCUM WHERE CODDOCUMENTO = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString;
         qryDesFaz.ExecSql;
         application.processMessages;

           (* exclui os LanctoDocum *)
         qryDesfaz.Close;
         qryDesfaz.sql.text := ' DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString;
         qryDesFaz.ExecSql;
         application.processMessages;

           (* exclui o Documento *)
         qryDesfaz.Close;
         qryDesfaz.sql.text := ' DELETE FROM DOCUMENTO WHERE CODDOCUMENTO = '+ qryBuscaLanc.fieldByName('CODDOCPREV').asString;
         qryDesFaz.ExecSql;
         application.processMessages; }
       except
         dtmBaseDados.dbBaseDados.Rollback;
         showMessage('Não Foi Possível Excluir o Envio de Coranças Banárias');
         exit;
       end;
       qryBuscaLanc.Next;

       // commita se atingir o mínimo de registros
       if contCommit = MinCommit then
       begin
         contCommit := 0;
         dtmBaseDados.dbBaseDados.Commit;
         If not dtmBaseDados.dbBaseDados.Intransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;
       end
       else
       begin
         contCommit := contCommit + 1;
       end;


       contaBoleto := contaBoleto + 1;
     end; //while
    finally
       dtmBaseDados.dbBaseDados.Commit;
       result := true;
       showMessage('Envio excluído com sucesso');
    end;
  end;
end;

procedure TfrmDesfazEnvios.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if trim(DBLKDatas.text) = '' then
  begin
    showMessage('Selecione a Data de Envio.');
    if DBLKDatas.Canfocus then DBLKDatas.SetFocus;
    exit;
  end;

  if trim(cmbMesCob.text) = '' then
  begin
    showMessage('Selecione o Mês de Cobrança.');
    if cmbMesCob.Canfocus then cmbMesCob.SetFocus;
    exit;
  end;

  // Gleyber - 31/08/2005 - Pendência 19265 - Início
  If (rgTipo.ItemIndex > 0) And
     (Trim(edtNomeParticip.Text) = '')
   Then Begin
      MsgDlg('É necessário escolher o participante antes de iniciar a operação.',
             'Informação',mtInformation,[mbOk],0);
      btnLocalizar.SetFocus;
      Exit;
   End;

  case rdgCobrancas.ItemIndex of
    0: begin
         if Application.MessageBox('Deseja Realmente Excluir Todos os Envios para a Data Selecionada?','Desfazer',Mb_YesNo + Mb_IConQuestion) = Id_Yes then
         begin
           bbtnCancelar.Enabled := false;
           bbtnsair.Enabled     := false;
           ApagaEnvioFolhaPagamentosBen(true, true);
           ApagaEnvioCorancaBancaria(strToDate(dblkDatas.LookupValue));
           bbtnCancelar.Enabled := true;
           bbtnsair.Enabled     := true;
         end;
       end;
    1: begin
         if Application.MessageBox('Deseja Realmente Excluir Todos os Envios para a Folha de Pagamento para Data Selecionada?','Desfazer',Mb_YesNo + Mb_IConQuestion) = Id_Yes then
         begin
           bbtnCancelar.Enabled := false;
           bbtnsair.Enabled     := false;
           ApagaEnvioFolhaPagamentosBen(true, false);
           bbtnCancelar.Enabled := true;
           bbtnsair.Enabled     := true;
         end;
       end;
    2: begin
         if Application.MessageBox('Deseja Realmente Excluir Todos os Envios para a Folha de Benefícios para Data Selecionada?','Desfazer',Mb_YesNo + Mb_IConQuestion) = Id_Yes then
         begin
           bbtnCancelar.Enabled := false;
           bbtnsair.Enabled     := false;
           ApagaEnvioFolhaPagamentosBen(false, true);
           bbtnCancelar.Enabled := true;
           bbtnsair.Enabled     := true;
         end;
       end;
    3: Begin
         if Application.MessageBox('Deseja Realmente Excluir Todos os Envios de Cobranças Bancárias para Data Selecionada?','Desfazer',Mb_YesNo + Mb_IConQuestion) = Id_Yes then
         begin
           bbtnCancelar.Enabled := false;
           bbtnsair.Enabled     := false;
           ApagaEnvioCorancaBancaria(strToDate(dblkDatas.LookupValue));
           bbtnCancelar.Enabled := true;
           bbtnsair.Enabled     := true;
         end;
       end;
  end; //case
end;

function TfrmDesfazEnvios.ApagaEnvioFolhaPagamentosBen(FlgPag, FlgBen : boolean) : Boolean;
var strPatros, strPlanos : string;
    contaReg, contCommit, totReg : integer;
begin
   contaReg   := 0;
   contCommit := 0;
   totReg     := 0;
   strPatros := '';
   strPlanos := '';
   Result := false;
   strPatros := PegaPatros;
   strPlanos := PegaPlanos;
   If not dtmBaseDados.dbBaseDados.Intransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;
   qryBuscaLanc.Close;
   qryBuscaLanc.Sql.Clear;
   // !!! Atenção: Não deve haver distinct na query se a rotina de desfazer tratar IDpessoa indivialmente !!

   // Gleyber - 31/08/2005 - Pendência 19265 - Início
   If rgTipo.ItemIndex = 0
    Then qryBuscaLanc.Sql.Add(' SELECT DISTINCT TD.IDLOTE, HT.IDPESSJUR, HT.IDPLANASS ')
    Else qryBuscaLanc.Sql.Add(' SELECT TD.IDLOTE, HT.IDPESSJUR, HT.IDPLANASS ');
   qryBuscaLanc.Sql.Add(' FROM HSTCONTRIBASS HT, TMPDESC TD ');

   if FlgPag and FlgBen then
     qryBuscaLanc.Sql.Add(' WHERE TD.FLGDESCFOLHA IN (''P'', ''B'') AND               ')
   else
   begin
     if flgPag then
       qryBuscaLanc.Sql.Add(' WHERE TD.FLGDESCFOLHA = ''P''  AND                      ');
     if flgBen then
       qryBuscaLanc.Sql.Add(' WHERE TD.FLGDESCFOLHA = ''B''  AND                      ');
   end;

   qryBuscaLanc.Sql.Add('       TD.IDMODULO = 17                   AND                ');
   qryBuscaLanc.Sql.Add('       HT.MESCOBRANCA = ' + QuotedStr(pegaMesCobranca)+ ' AND');
   qryBuscaLanc.Sql.Add('       TD.MESCOBRANCA = HT.MESCOBRANCA    AND                ');
   qryBuscaLanc.Sql.Add('       TD.IDTITULAR   = HT.IDTITULAR      AND                ');
   qryBuscaLanc.Sql.Add('       TD.IDPLANOPREV = HT.IDPLANOPREV    AND                ');
   qryBuscaLanc.Sql.Add('       TD.IDDESCONTO  = HT.IDCONTASS      AND                ');
   qryBuscaLanc.Sql.Add('       HT.IDPESSJUR   = TD.IDPESSJUR      AND                ');
   qryBuscaLanc.Sql.Add('       HT.IDPLANASS   = TD.IDPLANASS      AND                ');
   qryBuscaLanc.Sql.Add('       HT.IDLOTE      = TD.IDLOTE         AND                ');
   qryBuscaLanc.Sql.Add('       HT.FLGCOBCARNE <> 1                AND                ');
   qryBuscaLanc.Sql.Add('       HT.SITRECEBIMENTO = 1             AND                ');
   qryBuscaLanc.Sql.Add('       NVL(TD.SITENVIO, 0) = 0                               ');

   if (trim(dblkDatas.text) <> '') and (dblkDatas.lookupValue <> '') then
     qryBuscaLanc.Sql.Add(' AND TO_CHAR(TD.TRGDTINCLUSAO, ''DD/MM/YYYY'') = ' + quotedStr(dblkDatas.lookupValue));

   // Gleyber - 31/08/2005 - Pendência 19265 - Início
   If rgTipo.ItemIndex = 0
    Then Begin
      if strPatros <> '' then
        qryBuscaLanc.Sql.Add(' AND HT.IDPESSJUR IN '+ strPatros);
      if strPlanos <> '' then
        qryBuscaLanc.Sql.Add(' AND HT.IDPLANASS IN '+ strPlanos);
    End
    Else Begin
      qryBuscaLanc.Sql.Add(' AND HT.SEQPROPOSTA = '+IntToStr(iSeqProposta));
      qryBuscaLanc.Sql.Add(' AND HT.IDPLANASS   = '+IntToStr(iIdPlanAss));
      qryBuscaLanc.Sql.Add(' AND HT.IDPLANOPREV = '+IntToStr(iIdPlanoPrev));
      qryBuscaLanc.Sql.Add(' AND HT.IDPESSJUR   = '+IntToStr(iIdPessjur));
      qryBuscaLanc.Sql.Add(' AND HT.IDTITULAR   = '+IntToStr(iIdPessoa));
    End;
   // Gleyber - 31/08/2005 - Pendência 19265 - Fim
   qryBuscaLanc.Open;
   qryBuscaLanc.First;

   TotReg := qryBuscaLanc.RecordCount;
   ProgressBar.Max := TotReg;
   ProgressBar.Step := 1;

   if qryBuscaLanc.isempty then
   begin
     showMessage('Não Há Envios a Serem Excluídos Com Esses Parâmetros.');
     exit;
   end;

   try
     If not dtmBaseDados.dbBaseDados.Intransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;
     contaReg := 1;
     while not qryBuscaLanc.Eof do
     begin
       application.processMessages;
       ProgressBar.StepIt;
       ProgressBar.Update;

       try
         // Gleyber - 31/08/2005 - Pendência 19265 - Início
         qryDesfaz.Close;
         qryDesfaz.SQL.Clear;
         //qryDesfaz.SQL.Add('DELETE FROM HSTCONTRIBASS ');
         qryDesfaz.SQL.Add('UPDATE HSTCONTRIBASS ');
         qryDesfaz.SQL.Add('SET SITRECEBIMENTO = 0 ');
         qryDesfaz.SQL.Add('WHERE IDLOTE = '+ qryBuscaLanc.FieldByName('IDLOTE').asString);
         If rgTipo.ItemIndex = 0
          Then Begin
            If strPatros <> ''
             Then qryDesfaz.Sql.Add(' AND IDPESSJUR = ' + qryBuscaLanc.FieldByName('IDPESSJUR').asString);
            If strPlanos <> ''
             Then qryDesfaz.Sql.Add(' AND IDPLANASS = '+ qryBuscaLanc.FieldByName('IDPLANASS').asString);
          End Else Begin
            qryDesfaz.Sql.Add(' AND SEQPROPOSTA = '+IntToStr(iSeqProposta));
            qryDesfaz.Sql.Add(' AND IDPLANASS   = '+IntToStr(iIdPlanAss));
            qryDesfaz.Sql.Add(' AND IDPLANOPREV = '+IntToStr(iIdPlanoPrev));
            qryDesfaz.Sql.Add(' AND IDPESSJUR   = '+IntToStr(iIdPessjur));
            qryDesfaz.Sql.Add(' AND IDTITULAR   = '+IntToStr(iIdPessoa));
          End;
         qryDesFaz.ExecSql;
         application.processMessages;
         qryDesfaz.Close;
         qryDesfaz.SQL.Clear;
         qryDesfaz.SQL.Add('DELETE FROM TMPDESC ');
         qryDesfaz.SQL.Add('WHERE IDLOTE = '+ qryBuscaLanc.FieldByName('IDLOTE').asString);
         If rgTipo.ItemIndex = 0
          Then Begin
            If strPatros <> ''
             Then qryDesfaz.Sql.Add(' AND IDPESSJUR = ' + qryBuscaLanc.FieldByName('IDPESSJUR').asString);
            If strPlanos <> ''
             Then qryDesfaz.Sql.Add(' AND IDPLANASS = '+ qryBuscaLanc.FieldByName('IDPLANASS').asString);
          End Else Begin
            qryDesfaz.Sql.Add(' AND SEQPROPOSTA = '+IntToStr(iSeqProposta));
            qryDesfaz.Sql.Add(' AND IDPLANASS   = '+IntToStr(iIdPlanAss));
            qryDesfaz.Sql.Add(' AND IDPLANOPREV = '+IntToStr(iIdPlanoPrev));
            qryDesfaz.Sql.Add(' AND IDPESSJUR   = '+IntToStr(iIdPessjur));
            qryDesfaz.Sql.Add(' AND IDTITULAR   = '+IntToStr(iIdPessoa));
          End;
         // Gleyber - 31/08/2005 - Pendência 19265 - Fim

         qryDesFaz.ExecSql;
       except
         dtmBaseDados.dbBaseDados.Rollback;
         showMessage('Não Foi Possível Excluir o Envio');
         exit;
       end;
       qryBuscaLanc.Next;
       contaReg := contaReg + 1;

       // commita se atingir o mínimo de registros
       if contCommit = MinCommit then
       begin
         contCommit := 0;
         dtmBaseDados.dbBaseDados.Commit;
         If not dtmBaseDados.dbBaseDados.Intransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;
       end
       else
       begin
         contCommit := contCommit + 1;
       end;

     end;
   finally
     dtmBaseDados.dbBaseDados.Commit;
     result := true;
     showMessage('Envio excluído com sucesso');
   end;
  end;

// Gleyber - 31/08/2005 - Pendência 19265 - Início
procedure TfrmDesfazEnvios.FormShow(Sender: TObject);
begin
  inherited;
  pnlColetivo.BringToFront;

  rgTipo.ItemIndex := 0;
  iIdPessoa        := 0;
  iIdPessjur       := 0;
  iIdPlanoPrev     := 0;
  iIdPlanAss       := 0;
  iSeqProposta     := 0;

  edtNomeParticip.Text  := '';
  edtNomePatro.Text     := '';
  edtMatricula.Text     := '';
  edtNomePlanoPrev.Text := '';
  edtNumInscricao.Text  := '';
  edtNomePlanAss.Text   := '';
end;

procedure TfrmDesfazEnvios.rgTipoClick(Sender: TObject);
begin
  inherited;
  Case rgTipo.ItemIndex Of
   0 : pnlColetivo.BringToFront;
   1 : Begin
        If rdgCobrancas.ItemIndex > 0
         Then pnlIndividual.BringToFront
         Else Begin
           MsgDlg('Desfazer Individual só funciona para formas de cobranca:'+#13+#10+
                  '- Folha de Pagamento'+#13+#10+
                  '- Folha de BenefícioPagamento'+#13+#10+
                  '- Cobrança Bancária','Informação',mtInformation,[mbOk],0);
           rgTipo.ItemIndex :=0;
         End;
       End;
  End;
end;

procedure TfrmDesfazEnvios.rdgCobrancasClick(Sender: TObject);
begin
  inherited;
  If rdgCobrancas.ItemIndex = 0
   Then Begin
     rgTipo.ItemIndex := 0;
     pnlColetivo.BringToFront;
   End;
end;

procedure TfrmDesfazEnvios.btnLocalizarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;

  If MontaSelect.RetornouValor
   Then Begin
     iIdPessoa             := StrToInt(MontaSelect.ValoresChave[0]);
     iIdPessjur            := StrToInt(MontaSelect.ValoresChave[1]);
     iIdPlanoPrev          := StrToInt(MontaSelect.ValoresChave[2]);
     iIdPlanAss            := StrToInt(MontaSelect.ValoresChave[3]);
     iSeqProposta          := StrToInt(MontaSelect.ValoresChave[4]);

     edtNomeParticip.Text  := MontaSelect.ValoresChave[5];
     edtNomePatro.Text     := MontaSelect.ValoresChave[6];
     edtMatricula.Text     := MontaSelect.ValoresChave[7];
     edtNomePlanoPrev.Text := MontaSelect.ValoresChave[8];
     edtNumInscricao.Text  := MontaSelect.ValoresChave[9];
     edtNomePlanAss.Text   := MontaSelect.ValoresChave[10];
   End;
end;
// Gleyber - 31/08/2005 - Pendência 19265 - Fim

end.
