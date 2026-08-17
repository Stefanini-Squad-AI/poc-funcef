// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : (.dfm) upd, qryAfterPost
// Autor(a)    : Edilaine
// Data        : 06/02/2026
// Pendência   : 31923
// Alteração   : Mudar modo de gravar campo BLOB
//------------------------------------------------------------------------------
// Autor(a)    : ClaudioR
// Data        : 11/08/2006
// Pendência   : 22942
// Alteração   : Criação do flgcancelamento para utilizar o desfazer somente na Funcef  
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 07/10/2003
// Pendência   : 14938
// Alteração   : Criação da rotina de carta por evento
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 16.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 30/09/2003
// Alteração   : Inclusão do campo FLGINCLUIHISTFUNC. Pend: 14855
//------------------------------------------------------------------------------
unit FCadEventoGerCS;

interface

{
CATEGORIAS DE EVENTO GERADOR (FLGINTERNO)
-----------------------------------------
'DP' = 'Demissão da Patrocinadora'
'DC' = 'Demissão com Cancelamento'
'DM' = 'Demissão com Manutenção de Contribuição'     *
'DS' = 'Demissão com Manutenção de Saldo de Conta'
'DA' = 'Demissão para Aposentadoria'
'MP' = 'Manutenção Parcial'                          *
'AF' = 'Afastamento com Manutenção'                  *
'AR' = 'Afastamento sem Manutenção'
'TS' = 'Tempo de Serviço'
'ID' = 'Idade'
'IN' = 'Invalidez'
'DO' = 'Doença'                                      *
'AC' = 'Acidente'                                    *
'OE' = 'Outros Eventos Temporários'                  *
'CP' = 'Cancelamento por Iniciativa do Participante'
'CI' = 'Cancelamento por Inadimplência'
'CD' = 'Cancelamento por Descumprimento de Prazo'
'RI' = 'Registro de Inadimplência'
'FL' = 'Falecimento'
'FR' = 'Função de Risco' // Acabou
'RP' = 'Resgate a Pedido'
'TR' = 'Transferência de Reserva'
'TP' = 'Transferência de Plano'
'RA' = 'Retorno de Mantido Para Ativo'               *
'IP' = 'Inscrição do Participante'                   *
'RM' = 'Reinscrição do Participante'                 *
'PD' = 'Programa de Demissão Voluntária'             *
'RC' = 'Reclusao'
'TE  = 'Transferência de Patrocinadora/Empresa
'AI' = 'Aposentadoria INSS'
'BI' = 'Falecimento INSS'
(*) = GERA SALARIO
}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBCtrls, wwdblook, Mask, wwdbedit,
  TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CmEventosCadastro,
  ImgList, ppDB, ppDBPipe, ppDBBDE, ppBands, ppCtrls, ppClass, ppVar,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppEndUsr,
  ppTmPlat, ppTypes;

type
  TfrmCadEventoGerCS = class(TfrmCadastroCS)
    Label1: TLabel;
    Label3: TLabel;
    dbedDescEventoGerador: TwwDBEdit;
    dbrgrpTpEvento: TDBRadioGroup;
    cbFlgInterno: TComboBox;
    gbSituacoes: TGroupBox;
    dbchkFLGSITFUNCIMEDIA: TDBCheckBox;
    dbchkFLGSITPLANOIMEDI: TDBCheckBox;
    dbchkFLGSITPARTIMEDIA: TDBCheckBox;
    qryAux: TwwQuery;
    qryPortForma: TwwQuery;
    dbrgrpEncerraBenef: TDBRadioGroup;
    dbrgrpPermiteRetorno: TDBRadioGroup;
    dbrgrpAltsitPatro: TDBRadioGroup;
    dbrgrpGeraSalVirtual: TDBRadioGroup;
    dbrgrpSimula: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    btnCarta: TBitBtn;
    qryModCarta: TwwQuery;
    dsModCarta: TwwDataSource;
    ppbModCarta: TppBDEPipeline;
    DsgnCM: TppDesigner;
    pprModCarta: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine1: TppLine;
    ppLabel7: TppLabel;
    ppFooterBand2: TppFooterBand;
    ppLine2: TppLine;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel9: TppLabel;
    ppLine3: TppLine;
    ppDBImage1: TppDBImage;
    ppLabel10: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    dbrgrpMantemInscricao: TDBRadioGroup;
    dbrgrpCancelamento: TDBRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure dsStateChange(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbFlgInternoChange(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure btnCartaClick(Sender: TObject);
    procedure qryAfterPost(DataSet: TDataSet);
private
    { Private declarations }
    bInsere: boolean;
    sCategoriaOld: String;
  public
    { Public declarations }
  end;

var
  frmCadEventoGerCS: TfrmCadEventoGerCS;

implementation

uses UMensErro, UDataBase, UAdmPrev, usistema;

{$R *.DFM}

// ROTINAS INTERNAS
procedure TfrmCadEventoGerCS.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     qry.Close;
     qry.ParamByName('ideventogerador').Value := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Open;
     dbrgrpSimula.Visible  := (qry.FieldByName('flginterno').AsString = 'TP');
     dbrgrpMantemInscricao.Visible := (qry.FieldByName('flginterno').AsString = 'TP');
  end;
end;

procedure TfrmCadEventoGerCS.CmeCadastroInsert(Sender: TObject);
begin
  
  sCategoriaOld := cbFlgInterno.Text;
  inherited;
  pnlFundo.Enabled := True;

  qry.FieldByName('FLGCOBRAULT13').AsInteger    := 0;
  qry.FieldByName('FLGRISCO').AsInteger         := 0;
  qry.FieldByName('FLGENCERRABENEFI').AsInteger := 1;

  qry.FieldByName('FLGSITFUNCIMEDIA').AsInteger := 0;
  qry.FieldByName('FLGSITPLANOIMEDI').AsInteger := 0;
  qry.FieldByName('FLGSITPARTIMEDIA').AsInteger := 0;


  dbrgrpTpEvento.ItemIndex     := 1;
  dbrgrpEncerraBenef.ItemIndex := 0;

  dbchkFLGSITFUNCIMEDIA.Checked  := False;
  dbchkFLGSITPLANOIMEDI.Checked  := False;
  dbchkFLGSITPARTIMEDIA.Checked  := False;

  dbedDescEventoGerador.SetFocus;
end;

procedure TfrmCadEventoGerCS.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled:=True;
  dbedDescEventoGerador.SetFocus;
  
  sCategoriaOld := cbFlgInterno.Text;
end;

procedure TfrmCadEventoGerCS.FormActivate(Sender: TObject);
begin
  inherited;


  qry.Close;
  qry.ParamByName('ideventogerador').Value := 0;
  qry.Open;

  qryPortForma.Close; qryPortForma.Open;
end;

procedure TfrmCadEventoGerCS.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qry.State in [dsInsert]
  then begin
     qry.FieldByName('IdEventoGerador').AsInteger := LeUltRegistro(qryAux,'EVENTOGERADOR');
     cbFlgInterno.Text := '';
  end;
  qry.FieldbyName('IDFUNDACAO').AsInteger := iIdFundacao;  
end;

procedure TfrmCadEventoGerCS.dsStateChange(Sender: TObject);
begin
  inherited;
  if ds.DataSet.State in [dsEdit,dsInsert] then
     dbedDescEventoGerador.SetFocus;

  if ds.DataSet.State in [dsInsert] then
     cbFlgInterno.Text := '';
end;

procedure TfrmCadEventoGerCS.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if qry.FieldByName('FLGINTERNO').AsString = 'DP' then
     cbFlgInterno.Text := 'Demissão da Patrocinadora'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'DC' then
     cbFlgInterno.Text := 'Demissão com Cancelamento'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'DM' then
     cbFlgInterno.Text := 'Demissão com Manutenção de Contribuição'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'DS' then
     cbFlgInterno.Text := 'Demissão com Manutenção de Saldo de Conta'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'DA' then
     cbFlgInterno.Text := 'Demissão para Aposentadoria'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'AI' then
     cbFlgInterno.Text := 'Aposentadoria INSS'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'BI' then
     cbFlgInterno.Text := 'Falecimento INSS'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'MP' then
     cbFlgInterno.Text := 'Manutenção Parcial'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'AF' then
     cbFlgInterno.Text := 'Afastamento com Manutenção'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'AR' then
     cbFlgInterno.Text := 'Afastamento sem Manutenção'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'TS' then
     cbFlgInterno.Text := 'Tempo de Serviço'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'ID' then
     cbFlgInterno.Text := 'Idade'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'IN' then
     cbFlgInterno.Text := 'Invalidez'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'DO' then
     cbFlgInterno.Text := 'Doença'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'AC' then
     cbFlgInterno.Text := 'Acidente'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'OE' then
     cbFlgInterno.Text := 'Outros Eventos Temporários'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'CP' then
     cbFlgInterno.Text := 'Cancelamento por Iniciativa do Participante'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'CI' then
     cbFlgInterno.Text := 'Cancelamento por Inadimplência'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'CD' then
     cbFlgInterno.Text := 'Cancelamento por Descumprimento de Prazo'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'RI' then
     cbFlgInterno.Text := 'Registro de Inadimplência'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'FL' then
     cbFlgInterno.Text := 'Falecimento'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'RP' then
     cbFlgInterno.Text := 'Resgate a Pedido'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'TR' then
     cbFlgInterno.Text := 'Transferência de Reserva'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'TP' then
     cbFlgInterno.Text := 'Transferência de Plano'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'RA' then
     cbFlgInterno.Text := 'Retorno de Mantido Para Ativo'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'IP' then
     cbFlgInterno.Text := 'Inscrição do Participante'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'RM' then
     cbFlgInterno.Text := 'Reinscrição do Participante'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'PD' then
     cbFlgInterno.Text := 'Programa de Demissão Voluntária'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'RC' then
     cbFlgInterno.Text := 'Reclusão'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'TE' then
     cbFlgInterno.Text := 'Transferência de Patrocinadora';

  if qry.FieldByName('FLGINTERNO').AsString = 'CI'
  then dbrgrpPermiteRetorno.Visible := True
  else dbrgrpPermiteRetorno.Visible := False;

  dbrgrpSimula.Visible  := (Trim(cbFlgInterno.Text) = 'Transferência de Plano');
  dbrgrpMantemInscricao.Visible := (Trim(cbFlgInterno.Text) = 'Transferência de Plano');
end;

procedure TfrmCadEventoGerCS.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  cbFlgInterno.Text := '';
  bInsere := True;
end;

procedure TfrmCadEventoGerCS.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  bInsere := False;
end;

procedure TfrmCadEventoGerCS.bbtnConfirmarClick(Sender: TObject);
begin
  if Trim(dbedDescEventoGerador.Text) = ''
  then begin
    MsgDlg('Descrição do Evento Gerador não preenchida','Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;

  if (cbFlgInterno.Text) = 'Demissão da Patrocinadora' then
      qry.FieldByName('FLGINTERNO').AsString := 'DP'
  else
  if (cbFlgInterno.Text) = 'Demissão com Cancelamento' then
      qry.FieldByName('FLGINTERNO').AsString := 'DC'
  else
  if (cbFlgInterno.Text) = 'Demissão com Manutenção de Contribuição' then
      qry.FieldByName('FLGINTERNO').AsString := 'DM'
  else
  if (cbFlgInterno.Text) = 'Demissão com Manutenção de Saldo de Conta' then
      qry.FieldByName('FLGINTERNO').AsString := 'DS'
  else
  if (cbFlgInterno.Text) = 'Demissão para Aposentadoria' then
      qry.FieldByName('FLGINTERNO').AsString := 'DA'
  else
  if (cbFlgInterno.Text) = 'Aposentadoria INSS' then
      qry.FieldByName('FLGINTERNO').AsString := 'AI'
  else
  if (cbFlgInterno.Text) = 'Falecimento INSS' then
      qry.FieldByName('FLGINTERNO').AsString := 'BI'
  else
  if (cbFlgInterno.Text) = 'Manutenção Parcial' then
      qry.FieldByName('FLGINTERNO').AsString := 'MP'
  else
  if (cbFlgInterno.Text) = 'Afastamento com Manutenção' then
      qry.FieldByName('FLGINTERNO').AsString := 'AF'
  else
  if (cbFlgInterno.Text) = 'Afastamento sem Manutenção' then
      qry.FieldByName('FLGINTERNO').AsString := 'AR'
  else
  if (cbFlgInterno.Text) = 'Tempo de Serviço' then
      qry.FieldByName('FLGINTERNO').AsString := 'TS'
  else
  if (cbFlgInterno.Text) = 'Idade' then
      qry.FieldByName('FLGINTERNO').AsString := 'ID'
  else
  if (cbFlgInterno.Text) = 'Invalidez' then
      qry.FieldByName('FLGINTERNO').AsString := 'IN'
  else
  if (cbFlgInterno.Text) = 'Doença' then
      qry.FieldByName('FLGINTERNO').AsString := 'DO'
  else
  if (cbFlgInterno.Text) = 'Acidente' then
      qry.FieldByName('FLGINTERNO').AsString := 'AC'
  else
  if (cbFlgInterno.Text) = 'Outros Eventos Temporários' then
      qry.FieldByName('FLGINTERNO').AsString := 'OE'
  else
  if (cbFlgInterno.Text) = 'Cancelamento por Iniciativa do Participante' then
      qry.FieldByName('FLGINTERNO').AsString := 'CP'
  else
  if (cbFlgInterno.Text) = 'Cancelamento por Inadimplência' then
      qry.FieldByName('FLGINTERNO').AsString := 'CI'
  else
  if (cbFlgInterno.Text) = 'Cancelamento por Descumprimento de Prazo' then
      qry.FieldByName('FLGINTERNO').AsString := 'CD'
  else
  if (cbFlgInterno.Text) = 'Registro de Inadimplência' then
      qry.FieldByName('FLGINTERNO').AsString := 'RI'
  else
  if (cbFlgInterno.Text) = 'Falecimento' then
      qry.FieldByName('FLGINTERNO').AsString := 'FL'
  else
  if (cbFlgInterno.Text) = 'Função de Risco' then
      qry.FieldByName('FLGINTERNO').AsString := 'FR'
  else
  if (cbFlgInterno.Text) = 'Resgate a Pedido' then
      qry.FieldByName('FLGINTERNO').AsString := 'RP'
  else
  if (cbFlgInterno.Text) = 'Transferência de Reserva' then
      qry.FieldByName('FLGINTERNO').AsString := 'TR'
  else
  if (cbFlgInterno.Text) = 'Transferência de Plano' then
      qry.FieldByName('FLGINTERNO').AsString := 'TP'
  else
  if (cbFlgInterno.Text) = 'Retorno de Mantido Para Ativo' then
      qry.FieldByName('FLGINTERNO').AsString := 'RA'
  else
  if (cbFlgInterno.Text) = 'Inscrição do Participante' then
      qry.FieldByName('FLGINTERNO').AsString := 'IP'
  else
  if (cbFlgInterno.Text) = 'Reinscrição do Participante' then
      qry.FieldByName('FLGINTERNO').AsString := 'RM'
  else
  if (cbFlgInterno.Text) = 'Programa de Demissão Voluntária' then
      qry.FieldByName('FLGINTERNO').AsString := 'PD'
  else
  if (cbFlgInterno.Text) = 'Reclusão' then
      qry.FieldByName('FLGINTERNO').AsString := 'RC'
  else
  if (cbFlgInterno.Text) = 'Transferência de Patrocinadora' then
      qry.FieldByName('FLGINTERNO').AsString := 'TE'
  else
     begin
          MsgDlg('Evento Gerador Inválido','Erro',mtError,[mbOk,mbHelp],0);
          cbFlgInterno.Text := '';
          cbFlgInterno.SetFocus;
          Abort;
     end;

  if dbrgrpTpEvento.ItemIndex = -1
  then begin
    MsgDlg('Tipo de Evento não selecionado','Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;

  inherited;

  TiraSQL(qryAux);
end;

procedure TfrmCadEventoGerCS.FormShow(Sender: TObject);
begin
  inherited;
  cbFlgInterno.Text     := '';
  dbrgrpSimula.Visible  := False;
  dbrgrpMantemInscricao.Visible := False; 
  MontaSelect.Filtro.Add('EVENTOGERADOR.IDFUNDACAO = '+IntToStr(iIdFundacao)); 
end;

procedure TfrmCadEventoGerCS.cbFlgInternoChange(Sender: TObject);
begin
  inherited;
  if Trim(cbFlgInterno.Text) = 'Cancelamento por Inadimplência'
  then dbrgrpPermiteRetorno.Visible := True
  else dbrgrpPermiteRetorno.Visible := False;

  dbrgrpSimula.Visible  := (Trim(cbFlgInterno.Text) = 'Transferência de Plano');
  dbrgrpMantemInscricao.Visible := (Trim(cbFlgInterno.Text) = 'Transferência de Plano');
end;

procedure TfrmCadEventoGerCS.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  
  cbFlgInterno.Text := sCategoriaOld;

end;

procedure TfrmCadEventoGerCS.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;


procedure TfrmCadEventoGerCS.btnCartaClick(Sender: TObject);
Var
  sNomeArqOrig,
  sNomeArqNovo    : String;
  fTemplateOrig,
  fTemplateNovo   : TStrings;
begin
  inherited;

    sNomeArqOrig     := Sistema.TempDir + 'EvOrig.tcm';
    sNomeArqNovo     := Sistema.TempDir + 'EvNovo.tcm';
    fTemplateOrig    := TStringList.Create;
    fTemplateNovo    := TStringList.Create;
    fTemplateOrig.Clear;
    fTemplateNovo.Clear;

    // Guarda a Template Original
    DsgnCM.Report.Template.FileName := sNomeArqOrig;
    DsgnCM.Report.Template.SaveToFile;
    fTemplateOrig.LoadFromFile(sNomeArqOrig);


    // Caso Haja template modificada carrega em um arquivo e deste para o Report
    If Not qry.FieldByName('TEMPLATE').IsNull
     Then Begin
        fTemplateNovo.Add(qry.FieldByName('TEMPLATE').AsString);
        fTemplateNovo.SaveToFile(sNomeArqNovo);

        pprModCarta.Template.DatabaseSettings.Name := dbedDescEventoGerador.Text;
        DsgnCM.Report.Template.FileName := sNomeArqNovo;
        DsgnCM.Report.Template.LoadFromFile;
     End;

    DsgnCM.ShowModal;

    DsgnCM.Report.Template.FileName := sNomeArqNovo;
    DsgnCM.Report.Template.SaveToFile;

    fTemplateNovo.Clear;
    fTemplateNovo.LoadFromFile(sNomeArqNovo);

    // Se houve modificações então grava no banco
    If MessageDlg('Deseja salvar a carta do evento no banco ?', mtConfirmation,[mbYes, mbNo],0) = mrYes
     Then qry.FieldByName('TEMPLATE').AsString := fTemplateNovo.Text;

    DsgnCM.Report.Template.FileName := sNomeArqOrig;
    DsgnCM.Report.Template.LoadFromFile;

    fTemplateOrig.Free;
    fTemplateNovo.Free;

    If FileExists(sNomeArqOrig) Then  DeleteFile(sNomeArqOrig);
    If FileExists(sNomeArqNovo) Then  DeleteFile(sNomeArqNovo);
end;


procedure TfrmCadEventoGerCS.qryAfterPost(DataSet: TDataSet);
var
  Texto: string;
  Stream: TStringStream;
begin
  inherited;
  //edilaine WO31923 - INICIO
  qry.ApplyUpdates();

  with qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' update EVENTOGERADOR   ' +
            ' set ' +
            ' TEMPLATE = :TEMPLATE' +
            ' where ' +
            ' IDEVENTOGERADOR = ' + qry.fieldbyname('IDEVENTOGERADOR').asstring);

      Texto := qry.FieldByName('TEMPLATE').AsString;
      Stream := TStringStream.Create(Texto);
    try
      ParamByName('TEMPLATE').LoadFromStream(Stream, ftBlob);
    finally
      Stream.Free;
    end;
    try
      ExecSQL;
    except
    on e: Exception do
     begin
        ShowMessage(e.Message);
     end;
    end;
  end;
  //edilaine WO31923- FIM

end;

end.







