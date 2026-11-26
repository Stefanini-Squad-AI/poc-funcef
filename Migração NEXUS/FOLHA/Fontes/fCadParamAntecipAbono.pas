unit fCadParamAntecipAbono;

// Alterações:
//***************************************************************************************************
//Alteração  : 
//Nº SIG.....: 26633
//Data.......: 13/04/2017
//Responsável: Andre Imakawa
//Descrição..: chkExcessoDebito e cbEXEC_SP_MAPA iniciam com check = False
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, TREdit, Spin, mRegraDB, wwdblook, IvDictio, IvMulti, IvEMulti;

type
  TTipoOperacao = (dsEdicao, dsReplicacao);

  TfrmCadParamAntecipAbono = class(TfrmCadastroCS)
    Label1: TLabel;
    cmbMes: TComboBox;
    spedAno: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtPercentual: TRealEdit;
    molRegra: TmolRegraDB;
    qryPatro: TwwQuery;
    qryPatroIDPESSOA: TFloatField;
    qryPatroNOME: TStringField;
    cboPatro: TwwDBLookupCombo;
    cboPlano: TwwDBLookupCombo;
    cboBeneficio: TwwDBLookupCombo;
    qryPlano: TwwQuery;
    qryBeneficio: TwwQuery;
    qryPlanoIDPLANOPREV: TFloatField;
    qryPlanoNOME: TStringField;
    qryBeneficioIDBENEFICIO: TFloatField;
    qryBeneficioNOME: TStringField;
    ToolbarButton971: TToolbarButton97;
    sbtnReplicar: TToolbarButton97;
    qryReplicacao: TwwQuery;
    qryInsertReplicacao: TwwQuery;
    qryBeneficioFLGREFERENCIA: TFloatField;
    qryReplicacaoIDBENEFICIO: TFloatField;
    gbxTipoReplicacao: TRadioGroup;
    qryMES: TStringField;
    qryIDPESSJUR: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDBENEFICIO: TFloatField;
    qryIDREGRA: TFloatField;
    qryPERCENTUAL: TFloatField;
    qryNOMEREGRA: TStringField;
    qryReplicacaoIDPESSJUR: TFloatField;
    qryReplicacaoIDPLANOPREV: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure cboPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cboPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure molRegrabtnBuscaRegraClick(Sender: TObject);
    procedure edtPercentualExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnReplicarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    TipoOperacao : TTipoOperacao;
   procedure LimpaParametros(const qry: TwwQuery);
   procedure VerificaParametros(var Accept: Boolean; pTipo: Integer);  // Andre Imakawa - SIG 26633
  public
    { Public declarations }
  end;

var
  frmCadParamAntecipAbono: TfrmCadParamAntecipAbono;

implementation

{$R *.DFM}

uses Umenserro, FSelecionaParamAntecipaAbono;



procedure TfrmCadParamAntecipAbono.LimpaParametros(const qry: TwwQuery);
var
   i: integer;
begin
   // fecha a query p/ evitar problemas
   qry.Close;

   // prepara a query se já não estiver preparada
   if not(qry.Prepared) then qry.Prepare;

   // zera os parâmetros
   for i := 0 to (qry.ParamCount - 1) do
   begin
      qry.Params[i].Bound := False;
      qry.Params[i].Clear;
      qry.Params[i].Bound := True;
   end;
end;

procedure TfrmCadParamAntecipAbono.FormShow(Sender: TObject);
var
   iAno, iMes, iDia : word;
begin
   inherited;
   DecodeDate(Date,iAno, iMes, iDia);
   cmbMes.ItemIndex := iMes - 1;
   spedAno.Value    := iAno;

   qryPatro.Open;
   TipoOperacao := dsEdicao;
end;

procedure TfrmCadParamAntecipAbono.cboPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   LimpaParametros(qryPlano);
   qryPlano.ParamByName('PIDPESSJUR').AsInteger := qryPatroIDPESSOA.AsInteger;
   qryPlano.Open;
   If Not qryPlano.IsEmpty Then
     cboPlano.Enabled := True;
end;

procedure TfrmCadParamAntecipAbono.cboPlanoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   LimpaParametros(qryBeneficio);
   qryBeneficio.ParamByName('PIDPESSJUR').AsInteger   := qryPatroIDPESSOA.AsInteger;
   qryBeneficio.ParamByName('PIDPLANOPREV').AsInteger := qryPlanoIDPLANOPREV.AsInteger;
   qryBeneficio.Open;
   If Not qryBeneficio.IsEmpty Then
     cboBeneficio.Enabled := True;
end;

procedure TfrmCadParamAntecipAbono.molRegrabtnBuscaRegraClick(Sender: TObject);
begin
   inherited;
   molRegra.btnBuscaRegraClick(Sender);
   if molRegra.iRegra > 0 then edtPercentual.Value := 0;
end;

procedure TfrmCadParamAntecipAbono.edtPercentualExit(Sender: TObject);
begin
   inherited;
   if edtPercentual.Value > 0 then molRegra.btnLimpaRegraClick(Self);
end;

procedure TfrmCadParamAntecipAbono.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept := True;
   VerificaParametros(Accept, 1); // Andre Imakawa - SIG 26633
   inherited;
end;

procedure TfrmCadParamAntecipAbono.sbtnReplicarClick(Sender: TObject);
var Accept: Boolean;
begin
  inherited;
  // Andre Imakawa - SIG 26633 - Inicio
  {
  TipoOperacao              := dsReplicacao;
  gbxTipoReplicacao.Visible := True;
  bbtnConfirmar.Enabled     := True;
  bbtnCancelar.Enabled      := True;
  }
  Accept := True;
  VerificaParametros(Accept, 0);
  if not Accept then Exit;
  Try
    if frmSelecionaParamAntecipaAbono = nil then
      frmSelecionaParamAntecipaAbono := TfrmSelecionaParamAntecipaAbono.Create(Application);
    frmSelecionaParamAntecipaAbono.iRegra        := molRegra.iRegra;
    frmSelecionaParamAntecipaAbono.iPercentual   := Trunc(edtPercentual.Value);
    frmSelecionaParamAntecipaAbono.sAno   := FormatFloat('0000',Trunc(spedAno.Value));
    frmSelecionaParamAntecipaAbono.sMes   := FormatFloat('00',cmbMes.ItemIndex + 1);
    frmSelecionaParamAntecipaAbono.ShowModal;
  finally
    FreeAndNil(frmSelecionaParamAntecipaAbono);
    sbtnReplicar.Down := False;
  end
  // Andre Imakawa - SIG 26633 - Fim
end;

procedure TfrmCadParamAntecipAbono.bbtnConfirmarClick(Sender: TObject);
Var
  bErro : Boolean;
  sSql : String;
begin
  if TipoOperacao = dsEdicao then
  begin
    sSql := ' SELECT * FROM PARAMANTECIPABONO '+
            ' WHERE IDPESSJUR ='+cboPatro.LookupValue+
              ' AND IDPLANOPREV ='+cboPlano.LookupValue+
              ' AND IDBENEFICIO ='+cboBeneficio.LookupValue+
              ' AND MES = '+QuotedStr(FormatFloat('0000',Trunc(spedAno.Value)) + '/' + FormatFloat('00',cmbMes.ItemIndex + 1));
    qryReplicacao.Sql.Clear;
    qryReplicacao.Sql.Add(sSql);
    qryReplicacao.Open;
    qryMes.AsString       := FormatFloat('0000',Trunc(spedAno.Value)) + '/' + FormatFloat('00',cmbMes.ItemIndex + 1);
    qryPERCENTUAL.AsFloat := edtPercentual.Value;
    If qry.State In [dsInsert] Then
    Begin
      If qryReplicacao.IsEmpty Then
        inherited
      Else
      Begin
        MsgDlg('Já existe registro com os campos desejados.', 'Informação', mtInformation, [mbOk], 0);
        Exit;
      End;
    End
    Else
      Inherited;  
  end
  else
  begin
    bErro := False;
    qryPlano.DisableControls;
    if gbxTipoReplicacao.ItemIndex = 0 then
    begin
      qryReplicacao.Sql.Clear;
      qryReplicacao.Sql.Add(' SELECT DISTINCT BPP.IDPESSJUR, BPP.IDPLANOPREV, BPP.IDBENEFICIO '+
                            ' FROM BENEFPLANPATRO BPP, BENEFPLANPREV BPL '+
                            ' WHERE BPL.FLGREFERENCIA = :PFLGREFERENCIA '+
                              ' AND BPP.IDBENEFICIO  <> :PIDBENEFICIO '+
                              ' AND BPL.FLGPOSSUIABONO = 1 '+
                              ' AND BPP.IDBENEFICIO = BPL.IDBENEFICIO '+
                              ' AND NOT EXISTS (SELECT * FROM PARAMANTECIPABONO '+
                              ' WHERE IDPESSJUR = BPP.IDPESSJUR '+
                                ' AND IDPLANOPREV = BPP.IDPLANOPREV '+
                                ' AND IDBENEFICIO = BPP.IDBENEFICIO)'+
                            ' UNION '+
                            ' SELECT DISTINCT BPP.IDPESSJUR, BPP.IDPLANOPREV, BPP.IDBENEFICIO '+
                            ' FROM BENEFPLANPATRO BPP,  BENEFPLANPREV BPL '+
                            ' WHERE BPL.FLGREFERENCIA = :PFLGREFERENCIA '+
                              ' AND BPP.IDBENEFICIO   = :PIDBENEFICIO '+
                              ' AND BPP.IDPESSJUR    <> :PIDPESSJUR '+
                              ' AND BPL.FLGPOSSUIABONO = 1 '+
                              ' AND BPP.IDBENEFICIO = BPL.IDBENEFICIO '+
                              ' AND NOT EXISTS (SELECT * FROM PARAMANTECIPABONO '+
                              ' WHERE IDPESSJUR = BPP.IDPESSJUR '+
                                ' AND IDPLANOPREV = BPP.IDPLANOPREV '+
                                ' AND IDBENEFICIO = BPP.IDBENEFICIO)');
      LimpaParametros(qryReplicacao);
      qryReplicacao.ParamByName('PIDPESSJUR').AsInteger     := qryPatroIDPESSOA.AsInteger;
      qryReplicacao.ParamByName('PFLGREFERENCIA').AsInteger := qryBeneficioFLGREFERENCIA.AsInteger;
      qryReplicacao.ParamByName('PIDBENEFICIO').AsInteger   := qryBeneficioIDBENEFICIO.AsInteger;
      qryReplicacao.Open;

      while not qryReplicacao.Eof do
      begin
        If molRegra.iRegra <> 0 Then
        Begin
          LimpaParametros(qryInsertReplicacao);
          qryInsertReplicacao.ParamByName('PMES').AsString          := FormatFloat('0000',Trunc(spedAno.Value)) + '/' + FormatFloat('00',cmbMes.ItemIndex + 1);
          qryInsertReplicacao.ParamByName('PIDPESSJUR').AsInteger   := qryReplicacaoIDPESSJUR.AsInteger;
          qryInsertReplicacao.ParamByName('PIDPLANOPREV').AsInteger := qryReplicacaoIDPLANOPREV.AsInteger;
          qryInsertReplicacao.ParamByName('PIDBENEFICIO').AsInteger := qryReplicacaoIDBENEFICIO.AsInteger;
          qryInsertReplicacao.ParamByName('PIDREGRA').AsInteger     := molRegra.iRegra;
          qryInsertReplicacao.ParamByName('PPERCENTUAL').AsFloat    := edtPercentual.Value;
        end
        Else
        Begin
          LimpaParametros(qryInsertReplicacao);
          qryInsertReplicacao.ParamByName('PMES').AsString          := FormatFloat('0000',Trunc(spedAno.Value)) + '/' + FormatFloat('00',cmbMes.ItemIndex + 1);
          qryInsertReplicacao.ParamByName('PIDPESSJUR').AsInteger   := qryReplicacaoIDPESSJUR.AsInteger;
          qryInsertReplicacao.ParamByName('PIDPLANOPREV').AsInteger := qryReplicacaoIDPLANOPREV.AsInteger;
          qryInsertReplicacao.ParamByName('PIDBENEFICIO').AsInteger := qryReplicacaoIDBENEFICIO.AsInteger;
          qryInsertReplicacao.ParamByName('PIDREGRA').IsNull;
          qryInsertReplicacao.ParamByName('PPERCENTUAL').AsFloat    := edtPercentual.Value;
        End;
        Try
          qryInsertReplicacao.ExecSql;
        Except
          on E:Exception do
          begin
            MsgDlg('Erro na replicação ', 'Informação', mtInformation, [mbOk], 0);
            bErro := True;
            Break;
          end
          else
          begin
            MsgDlg('Erro na replicação ', 'Informação', mtInformation, [mbOk], 0);
            bErro := True;
            Break;
          end;
        End;
        qryReplicacao.Next;
      End
    end
    else
    begin
      qryReplicacao.Sql.Clear;
      qryReplicacao.Sql.Add(' SELECT DISTINCT BPP.IDPESSJUR, BPP.IDPLANOPREV, BPP.IDBENEFICIO '+
                            ' FROM BENEFPLANPATRO BPP, BENEFPLANPREV BPL '+
                            ' WHERE BPL.FLGREFERENCIA = :PFLGREFERENCIA '+
                              ' AND BPP.IDBENEFICIO  <> :PIDBENEFICIO '+
                              ' AND BPP.IDPESSJUR     = :PIDPESSJUR '+
                              ' AND BPL.FLGPOSSUIABONO = 1 '+
                              ' AND BPP.IDBENEFICIO = BPL.IDBENEFICIO '+
                              ' AND NOT EXISTS (SELECT * FROM PARAMANTECIPABONO '+
                              ' WHERE IDPESSJUR = BPP.IDPESSJUR '+
                                ' AND IDPLANOPREV = BPP.IDPLANOPREV '+
                                ' AND IDBENEFICIO = BPP.IDBENEFICIO) '+
                            ' UNION '+
                            ' SELECT DISTINCT BPP.IDPESSJUR, BPP.IDPLANOPREV, BPP.IDBENEFICIO '+
                            ' FROM BENEFPLANPATRO BPP, BENEFPLANPREV BPL '+
                            ' WHERE BPL.FLGREFERENCIA = :PFLGREFERENCIA '+
                              ' AND BPP.IDBENEFICIO   = :PIDBENEFICIO '+
                              ' AND BPP.IDPLANOPREV   = :PIDPLANOPREV '+
                              ' AND BPP.IDBENEFICIO = BPL.IDBENEFICIO '+
                              ' AND BPP.IDPESSJUR     = :PIDPESSJUR '+
                              ' AND BPL.FLGPOSSUIABONO = 1 '+
                              ' AND NOT EXISTS (SELECT * FROM PARAMANTECIPABONO '+
                              ' WHERE IDPESSJUR   = BPP.IDPESSJUR '+
                                ' AND IDPLANOPREV = BPP.IDPLANOPREV '+
                                ' AND IDBENEFICIO = BPP.IDBENEFICIO)');
      LimpaParametros(qryReplicacao);
      qryReplicacao.ParamByName('PIDPESSJUR').AsInteger     := qryPatroIDPESSOA.AsInteger;
      qryReplicacao.ParamByName('PIDPLANOPREV').AsInteger   := qryPlanoIDPLANOPREV.AsInteger;
      qryReplicacao.ParamByName('PFLGREFERENCIA').AsInteger := qryBeneficioFLGREFERENCIA.AsInteger;
      qryReplicacao.ParamByName('PIDBENEFICIO').AsInteger   := qryBeneficioIDBENEFICIO.AsInteger;
      qryReplicacao.Open;

      while not qryReplicacao.Eof do
      begin
        If molRegra.iRegra <> 0 Then
        Begin
          LimpaParametros(qryInsertReplicacao);
          qryInsertReplicacao.ParamByName('PMES').AsString          := FormatFloat('0000',Trunc(spedAno.Value)) + '/' + FormatFloat('00',cmbMes.ItemIndex + 1);
          qryInsertReplicacao.ParamByName('PIDPESSJUR').AsInteger   := qryReplicacaoIDPESSJUR.AsInteger;
          qryInsertReplicacao.ParamByName('PIDPLANOPREV').AsInteger := qryReplicacaoIDPLANOPREV.AsInteger;
          qryInsertReplicacao.ParamByName('PIDBENEFICIO').AsInteger := qryReplicacaoIDBENEFICIO.AsInteger;
          qryInsertReplicacao.ParamByName('PIDREGRA').AsInteger     := molRegra.iRegra;
          qryInsertReplicacao.ParamByName('PPERCENTUAL').AsFloat    := edtPercentual.Value;
        End
        Else
        Begin
          LimpaParametros(qryInsertReplicacao);
          qryInsertReplicacao.ParamByName('PMES').AsString          := FormatFloat('0000',Trunc(spedAno.Value)) + '/' + FormatFloat('00',cmbMes.ItemIndex + 1);
          qryInsertReplicacao.ParamByName('PIDPESSJUR').AsInteger   := qryReplicacaoIDPESSJUR.AsInteger;
          qryInsertReplicacao.ParamByName('PIDPLANOPREV').AsInteger := qryReplicacaoIDPLANOPREV.AsInteger;
          qryInsertReplicacao.ParamByName('PIDBENEFICIO').AsInteger := qryReplicacaoIDBENEFICIO.AsInteger;
          qryInsertReplicacao.ParamByName('PIDREGRA').IsNull;
          qryInsertReplicacao.ParamByName('PPERCENTUAL').AsFloat    := edtPercentual.Value;
        End;
        Try
          qryInsertReplicacao.ExecSql;
        Except
          on E:Exception do
          begin
            MsgDlg('Erro na replicação ', 'Informação', mtInformation, [mbOk], 0);
            bErro := True;
            Break;
          end
          else
          begin
            MsgDlg('Erro na replicação ', 'Informação', mtInformation, [mbOk], 0);
            bErro := True;
            Break;
          end;
        End;
        qryReplicacao.Next;
      end;
    end;
    If qryReplicacao.IsEmpty Then
      MsgDlg('Nenhum registro para replicar!', 'Informação', mtInformation, [mbOk], 0)
    Else
      If (Not bErro) Then
        MsgDlg('Replicação feita com sucesso!', 'Informação', mtInformation, [mbOk], 0);
    qryPlano.EnableControls;
    sbtnReplicar.Down         := False;
    gbxTipoReplicacao.Visible := False;
    TipoOperacao              := dsEdicao;
    bbtnCancelarClick(Self);
  end;
end;

procedure TfrmCadParamAntecipAbono.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      LimpaParametros(qry);
      qry.ParamByName('PMES').AsString          := MontaSelect.ValoresChave[0];
      qry.ParamByName('PIDPESSJUR').AsInteger   := StrToInt(MontaSelect.ValoresChave[1]);
      qry.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[2]);
      qry.ParamByName('PIDBENEFICIO').AsInteger := StrToInt(MontaSelect.ValoresChave[3]);
      qry.Open;

      qryPlano.Close;
      qryPlano.ParamByName('PIDPESSJUR').AsInteger := StrToInt(CboPatro.LookupValue);
      qryPlano.Open;
      qryPlano.Locate('IDPLANOPREV', qry.FieldByName('IDPLANOPREV').AsString, []);
      cboPlano.LookupValue := qryPlano.FieldByName('IDPLANOPREV').AsString;

      qryBeneficio.Close;                                   
      qryBeneficio.ParamByName('PIDPESSJUR').AsInteger   := StrToInt(CboPatro.LookupValue);
      qryBeneficio.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(CboPlano.LookupValue);
      qryBeneficio.Open;
      qryBeneficio.Locate('IDBENEFICIO', qry.FieldByName('IDBENEFICIO').AsString, []);
      cboBeneficio.LookupValue := qryBeneficio.FieldByName('IDBENEFICIO').AsString;

      spedAno.Value        := StrToInt(Copy(qryMES.AsString,1,4));
      cmbMes.ItemIndex     := StrToInt(Copy(qryMES.AsString,6,2)) - 1;

      molRegra.iRegra      := qryIDREGRA.AsInteger;
      molRegra.sRegra      := qryNOMEREGRA.AsString;

      edtPercentual.Value  := qryPERCENTUAL.AsFloat;
      sbtnReplicar.Enabled := True;
   end;
end;

procedure TfrmCadParamAntecipAbono.sbtnInserirClick(Sender: TObject);
begin
  qry.Close;
  qry.ParamByName('PMES').AsString          := '2003/10';
  qry.ParamByName('PIDPESSJUR').AsInteger   := -1;
  qry.ParamByName('PIDPLANOPREV').AsInteger := -1;
  qry.ParamByName('PIDBENEFICIO').AsInteger := -1;
  qry.Open;
  inherited;
end;

procedure TfrmCadParamAntecipAbono.sbtnAlterarClick(Sender: TObject);
begin
  cboPlano.Enabled     := True;
  cboBeneficio.Enabled := True;
  inherited;
end;

procedure TfrmCadParamAntecipAbono.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  gbxTipoReplicacao.Visible := False;
  sbtnReplicar.Down         := False;
  TipoOperacao              := dsEdicao;
end;

// Andre Imakawa - SIG 26633 - Inicio
procedure TfrmCadParamAntecipAbono.VerificaParametros(var Accept: Boolean; pTipo: Integer);
begin
  // pTipo = 0 Utlizado na Replicação e 1 Utilizado na funcionalidade normal
  if (cboPatro.Value = '') and (pTipo > 0) then
   begin
      MsgDlg('Favor selecionar a patrocinadora.','Atenção',mtWarning,[mbOk,mbHelp],0);
      Accept := False;
      Exit;
   end;

   if (cboPlano.Value = '') and (pTipo > 0) then
   begin
      MsgDlg('Favor selecionar o plano.','Atenção',mtWarning,[mbOk,mbHelp],0);
      Accept := False;
      Exit;
   end;

   if (cboBeneficio.Value = '') and (pTipo > 0) then
   begin
      MsgDlg('Favor selecionar o benefício.','Atenção',mtWarning,[mbOk,mbHelp],0);
      Accept := False;
      Exit;
   end;

   if (molRegra.iRegra <= 0) and (edtPercentual.Value = 0) and (pTipo >= 0) then
   begin
      MsgDlg('Favor informar a Regra ou o percentual.','Atenção',mtWarning,[mbOk,mbHelp],0);
      Accept := False;
      Exit;
   end;

   if (molRegra.iRegra <= 0) and (edtPercentual.Value <= 0) and (pTipo >= 0) then
   begin
      MsgDlg('Favor informar percentual válido.','Atenção',mtWarning,[mbOk,mbHelp],0);
      Accept := False;
      Exit;
   end;

   if (molRegra.iRegra <= 0) and (edtPercentual.Value > 100) and (pTipo >= 0) then
   begin
      MsgDlg('Favor informar percentual válido.','Atenção',mtWarning,[mbOk,mbHelp],0);
      Accept := False;
      Exit;
   end;
end;
// Andre Imakawa - SIG 26633 - Fim
end.
