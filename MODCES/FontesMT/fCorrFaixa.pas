{*******************************************************
RESPONSÁVEL.: William Santana
Nº SOL......: 199707
Nº KINTANA..: 1922320
Data........: 05/08/2013
Descrição...: Alteração na forma de Correção das Faixas Salariais.
******************************************************* }

unit fCorrFaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, DBTables, TEdNum, TB97, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, Wwdatsrc, wwdblook, wwdbdatetimepicker, CMDateTimePicker, TREdit,
  DBClient, uCMClientDataSet, ComCtrls, uCtrlGlobalRH, uCtrlMotivo, uCtrlCorrecaoFaixaSal,
  uCtrlIntegraPrevRH,
  uCtrlFaixaSal, DBCtrls, Wwquery, Provider, Grids, Wwdbigrd, Wwdbgrid,
  fcButton, fcImgBtn, fcShapeBtn;

type
  TfrmCorrFaixa = class(TfrmSairAjuda)
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    CdsTipoEv: TCMClientDataSet;
    gbxCondicoes: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    edData: TCMDateTimePicker;
    ednPerc: TRealEdit;
    ednParcela: TRealEdit;
    rgTipoArre: TRadioGroup;
    gbxTipoEv: TGroupBox;
    dblcTipoEv: TwwDBLookupCombo;
    rgAtualizaSalFunc: TRadioGroup;
    lblMsg: TLabel;
    prgbProgresso: TProgressBar;
    //William Santana SOL: 199707 - KINTANA: 1922320
    Notebook1: TNotebook;
    LabelFaixaSalarial: TLabel;
    DBGrid1: TwwDBGrid;
    DataSetProvider1: TDataSetProvider;
    wwQuery1: TwwQuery;
    CdsGrid: TCMClientDataSet;
    DSGrid: TwwDataSource;
    btnContinuar: TfcShapeBtn;
    DBGrid1IButton: TwwIButton;
    CheckBox1: TCheckBox;
    //END - William Santana
    procedure FormCreate(Sender: TObject);
    procedure edDataChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1FieldChanged(Sender: TObject; Field: TField);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure CdsGridAfterOpen(DataSet: TDataSet);
  private
    CtrlCorrecaoFaixaSal: TCtrlCorrecaoFaixaSal;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlMotivo: TCtrlMotivo;
    CtrlIntegraPrevRH: TCtrlIntegraPrevRH;

    procedure Progresso(Arg: array of variant);
  end;

var
  frmCorrFaixa: TfrmCorrFaixa;

  flgchkbox : boolean;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCtrlUsoGeralRH, dCds;

{$R *.DFM}

procedure TfrmCorrFaixa.FormCreate(Sender: TObject);
// var
 //
begin
  inherited;
  CtrlCorrecaoFaixaSal := TCtrlCorrecaoFaixaSal.Create(Sistema.IdEmpresa,
  CtrlUsoGeralRH.UsuXFilial, CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlCorrecaoFaixaSal.InitializeAs(Padroes);
  CtrlCorrecaoFaixaSal.Progresso := Progresso;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlIntegraPrevRH := TCtrlIntegraPrevRH.Create;
  CtrlIntegraPrevRH.InitializeAs(Padroes);

  //William Santana SOL: 199707 - KINTANA: 1922320
  {Trecho de cógigo movido para ação do botão Continuar
  edData.Date := Date;
  ednPerc.Text := '0';
  ednParcela.Text := '0';
  lblMsg.Caption := '';

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGNIVELINDIV');
  iFlgNivelIndiv := dmCds.Cds.FieldByName('FLGNIVELINDIV').asInteger;

  rgAtualizaSalFunc.Visible := (iFlgNivelIndiv = 1);
  gbxTipoEv.Visible := (iFlgNivelIndiv = 1);

  if (iFlgNivelIndiv = 1) then
  begin
    lblMsg.Top := 171;
    prgbProgresso.Top := 188;
    Self.Height := 286;
    CdsTipoEv.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('A');
  end
  else
  begin
    lblMsg.Top := 123;
    prgbProgresso.Top := 140;
    Self.Height := 241;
  end;
   }
  //William Santana SOL: 199707 - KINTANA: 1922320
  bbtnConfirmar.enabled := false;

  Notebook1.ActivePage := 'Select Grid';

  CdsGrid.data := CtrlCorrecaoFaixaSal.ListFaixaSalGrid;
  flgchkbox := true;
  //END William Santana

end;

procedure TfrmCorrFaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlCorrecaoFaixaSal);
  FreeAndNil(CtrlIntegraPrevRH);
  inherited;
end;

procedure TfrmCorrFaixa.edDataChange(Sender: TObject);
begin
  bbtnConfirmar.Enabled := (edData.Text <> '');
end;

procedure TfrmCorrFaixa.bbtnConfirmarClick(Sender: TObject);
var
  bOk: boolean;
  sMsg: string;
  dIdTipoEvento: double;
  codsIn: String; //William Santana SOL: 199707 - KINTANA: 1922320 -- codigos para usar com 'where in'
begin
  if (gbxTipoEv.Visible) and (Trim(dblcTipoEv.Text) = '') then
  begin
    MsgDlg('Falta Indicar o Tipo de Evento.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dblcTipoEv.SetFocus;
  end
  else
  if (ednPerc.Value = 0) and (ednParcela.Value = 0) then
  begin
    MsgDlg('Falta Indicar Percentual e/ou Valor de Correção.', 'Aviso', mtWarning,
      [mbOk, mbHelp], 0);
    ednPerc.SetFocus;
  end
  else
  begin
    if (rgAtualizaSalFunc.ItemIndex = 0) then
      sMsg := ' e Salários dos Empregados'
    else
      sMsg := '';

    if (MsgDlg('Confirma a Correção das Faixas' +sMsg+ '?', 'Confirmação',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      if (CdsTipoEv.Active) then
        dIdTipoEvento := CdsTipoEv.FieldByName('IDMOTIVO').asFloat
      else
        dIdTipoEvento := 0;

    //William Santana SOL: 199707 - KINTANA: 1922320
    codsIn:= '';
    cdsgrid.first;
    while not(cdsgrid.Eof) do
     begin
      if (cdsgrid.FieldByName('Selected').asInteger = 1) then
       begin
       codsIn := codsIn + cdsgrid.FieldByName('CODIGO').asString + ',';
       end;
      cdsgrid.next;
     end;
     codsIn := '('+ codsIn +'0)';

      CtrlCorrecaoFaixaSal.CreateThreadProgresso;
      bOk := CtrlCorrecaoFaixaSal.CorrigirFaixasSal(edData.Date, ednPerc.Value,
        ednParcela.Value, rgTipoArre.ItemIndex, rgAtualizaSalFunc.ItemIndex = 0,
        dIdTipoEvento,codsIn);

     { CtrlCorrecaoFaixaSal.CreateThreadProgresso;
      bOk := CtrlCorrecaoFaixaSal.CorrigirFaixasSal(edData.Date, ednPerc.Value,
        ednParcela.Value, rgTipoArre.ItemIndex, rgAtualizaSalFunc.ItemIndex = 0,
        dIdTipoEvento);  adicionado parametro codsIn}
     //END - William Santana

      CtrlCorrecaoFaixaSal.FreeThreadProgresso;

      if (bOk) then
        MsgDlg(CtrlCorrecaoFaixaSal.MessageInfo, 'Aviso', mtInformation, [mbOk, mbHelp], 0)
      else
        raise Exception.Create(CtrlCorrecaoFaixaSal.MessageInfo);

      // Chama a rotina de integraçao dos sistemas previdenciarios com os sistemas
      // de RH e Folha de Pagamento de uma Fundação
      if (bOk) and (CtrlCorrecaoFaixaSal.TipoEmpresa = 'P') then
      begin
        lblMsg.Caption := 'Atualizando o Histórico das Faixas';
        prgbProgresso.Position := 0;

        if not(CtrlIntegraPrevRH.AtualizaFaixasSalariais(Sistema.IdEmpresa)) then
          raise Exception.Create(CtrlIntegraPrevRH.MessageInfo);
      end;
    end;

    lblMsg.Caption := '';
    prgbProgresso.Position := 0;
  end;
end;

procedure TfrmCorrFaixa.Progresso(Arg: array of variant);
begin
  if (Arg[0] <> '') then
    lblMsg.Caption := Arg[0];

  if (Arg[1] > 0) then
    prgbProgresso.Max := Arg[1];

  if (Arg[2] > 0) then
    prgbProgresso.StepIt;

  Self.Repaint;  
end;

//William Santana SOL: 199707 - KINTANA: 1922320

procedure TfrmCorrFaixa.btnContinuarClick(Sender: TObject);
var
  iFlgNivelIndiv: integer;
  iFlgChkItems: boolean;

begin
  inherited;
  iFlgChkItems := false;
  cdsgrid.DisableControls;

  while not(cdsgrid.Eof) do
   begin
    if (cdsgrid.FieldByName('Selected').asInteger = 1) then
     begin
       iFlgChkItems := true;
       break;
     end;
    cdsgrid.next;
   end;             

  cdsgrid.EnableControls;
  
  if (iFlgChkItems = false) then
  begin
   cdsgrid.first;
   MsgDlg('Selecione ao menos uma Faixa Salarial.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
  end
  else
   begin

    Notebook1.ActivePage := 'Correção de Faixas';
    bbtnConfirmar.Enabled := true;

    edData.Date := Date;
    ednPerc.Text := '0';
    ednParcela.Text := '0';
    lblMsg.Caption := '';

    dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGNIVELINDIV');
    iFlgNivelIndiv := dmCds.Cds.FieldByName('FLGNIVELINDIV').asInteger;

    rgAtualizaSalFunc.Visible := (iFlgNivelIndiv = 1);
    gbxTipoEv.Visible := (iFlgNivelIndiv = 1);

    if (iFlgNivelIndiv = 1) then
    begin
      lblMsg.Top := 171;
      prgbProgresso.Top := 188;
      Self.Height := 286;
      CdsTipoEv.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('A');
    end
    else
    begin
      lblMsg.Top := 123;
      prgbProgresso.Top := 140;
      Self.Height := 241;
    end;
  end;

end;

procedure TfrmCorrFaixa.CheckBox1Click(Sender: TObject);
begin
  inherited;
 btnContinuar.Enabled:= true;
 if (flgchkbox = true) then
 begin
  cdsgrid.DisableControls;

  CdsGrid.First;
   while not(CdsGrid.eof) do
    begin
    CdsGrid.edit;
     if (CheckBox1.Checked) then
       CdsGrid.FieldByName('SELECTED').asInteger := 1
     else
       CdsGrid.FieldByName('SELECTED').asInteger := 0;
    CdsGrid.post;
    cdsGrid.next;
    end;
  CdsGrid.first;
  cdsgrid.EnableControls;
 end;
end;

procedure TfrmCorrFaixa.DBGrid1FieldChanged(Sender: TObject;
  Field: TField);
begin
  inherited;
   flgchkbox := false;
   if (CdsGrid.FieldByName('SELECTED').AsInteger = 0) then
    CheckBox1.Checked := false;

   btnContinuar.Enabled:= true;
    
   flgchkbox := true;
end;
//William Santana SOL: 199707 - KINTANA: 1922320
procedure TfrmCorrFaixa.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
   DBGrid1.fields[0].Alignment:= taCenter  ;
   DBGrid1.fields[1].Alignment:= taCenter  ;
end;

procedure TfrmCorrFaixa.CdsGridAfterOpen(DataSet: TDataSet);
 var
 i: integer;
begin
  inherited;
   for i:= 1 to 20 do
   TFloatField(CdsGrid.FieldByName('nivel'+inttostr(i))).DisplayFormat  := ',0.00';

end;
 //END- William Santana SOL: 199707 - KINTANA: 1922320
end.
