unit fExcluiParcelaMT;
// -----------------------------------------------------------------------------
//
//      EXCLUSÃO DE PARCELAS SEM MEDIÇÃO  ( MT )
//
//      Módulo          :  Contratos e Projetos
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  28/07/2003
//      Data de Término :  29/07/2003
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mContrato, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, uCtrlGeracaoContrato, Db, DBClient,
  uCMClientDataSet, uCmSqlParams;

type
  TfrmExcluiParcelaMT = class(TfrmOkCancelar)
    Panel1: TPanel;
    molContrato1: TmolContrato;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    edtDtIni: TCMDateTimePicker;
    edtDtFim: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    cdsParcela: TCMClientDataSet;
    dsParcela: TDataSource;
    CMSqlParams1: TCMSqlParams;
    btnSelecionar: TBitBtn;
    GroupBox2: TGroupBox;
    edtDataGera: TCMDateTimePicker;
    cdsParcelaCHKBOX: TFloatField;
    cdsParcelaIDCONTRATO: TFloatField;
    cdsParcelaIDPARCELA: TFloatField;
    cdsParcelaIDITEM: TFloatField;
    cdsParcelaIDOBJETO: TFloatField;
    cdsParcelaPLNCODIGO: TFloatField;
    cdsParcelaCODDOCUMENTO: TFloatField;
    cdsParcelaDATAVENCPARCELA: TDateTimeField;
    cdsParcelaVLRMOEDACORRENTE: TFloatField;
    cdsParcelaNOMECONTRATO: TStringField;
    dbgParcelas: TwwDBGrid;
    cdsParcelaNODOCUMENTO: TStringField;
    cdsParcelaNOMEOBJETO: TStringField;
    cdsParcelaNOME_ITEM: TStringField;
    btnSeleciona: TSpeedButton;
    btnLimpa: TSpeedButton;
    btnEstorno: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure dbgParcelasDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgParcelasCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgParcelasTopRowChanged(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnLimpaClick(Sender: TObject);
    procedure btnEstornoClick(Sender: TObject);
  private
    { Private declarations }
    CtrlGerContrato : TCtrlGeracaoContrato;
    sFiltro : String;
    dIni, dFim, dGera : TDateTime;

    function  VerificaPreenchimento : Boolean;
    procedure Progresso ( vParams: Array of variant );
  public
    { Public declarations }
  end;

var
  frmExcluiParcelaMT: TfrmExcluiParcelaMT;

implementation

uses dBaseDados, uSistema, uMensErro, fProgresso, dMS;

{$R *.DFM}

procedure TfrmExcluiParcelaMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGerContrato := TCtrlGeracaoContrato.Create(Sistema.IdEmpresa,
                                                 Sistema.IdModulo,
                                                 Sistema.IdUsuario,
                                                 Sistema.IdEspAcesso,
                                                 Sistema.UsaPlanoPatro);

  CtrlGerContrato.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer,True);

  // Associa a função local de Progresso a que será chamada pelo CtrlObject
  CtrlGerContrato.Progresso := Progresso;

  // Limpa a tela e abre o grid em branco
  bbtnCancelarClick( Self );

  // Filtra os Contratos - apenas os ativos
  sFiltro := dtmMS.MS_Contrato.Filtro.Text;
  dtmMS.MS_Contrato.Filtro.Add('FLGFIMCONTRATO = ''S'' ');
end;


procedure TfrmExcluiParcelaMT.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  if edtDtIni.Text <> '' then
       dIni := edtDtIni.Date
  else dIni := -1;
  if edtDtFim.Text <> '' then
       dFim := edtDtFim.Date
  else dFim := -1;
  if edtDataGera.Text <> '' then
       dGera := edtDataGera.Date
  else dGera := -1;
  cdsParcela.Data := CtrlGerContrato.ListParcelaGerada(molContrato1.iContrato, True, dIni, dFim, dGera);
end;

procedure TfrmExcluiParcelaMT.dbgParcelasDblClick(Sender: TObject);
var Bookmark: TBookmark;
    iCodDocumento : Integer;
begin
   inherited;
   // Marca ou Desmarca as parcelas para exclusão
   if not cdsParcela.IsEmpty then begin
      Bookmark := cdsParcela.GetBookmark;
      cdsParcela.DisableControls;
      iCodDocumento := cdsParcela.FieldByName('CODDOCUMENTO').AsInteger;
      cdsParcela.First;
      while not cdsParcela.Eof do begin
         if cdsParcela.FieldByName('CODDOCUMENTO').AsInteger = iCodDocumento then begin
            cdsParcela.Edit;
            cdsParcela.FieldByName('CHKBOX').AsInteger := (cdsParcela.FieldByName('CHKBOX').AsInteger Xor 1);
            cdsParcela.Post;
         end;
         cdsParcela.Next;
      end;
      cdsParcela.GotoBookmark(Bookmark);
      cdsParcela.EnableControls;
      cdsParcela.FreeBookmark(Bookmark);
   end;
end;


procedure TfrmExcluiParcelaMT.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  CtrlGerContrato.Free;
  dtmMS.MS_Contrato.Filtro.Text := sFiltro;
  inherited;
end;


function TfrmExcluiParcelaMT.VerificaPreenchimento: Boolean;
begin
   Result := False;
   // Verifica se foram selecionadas parcelas para exclusão
   cdsParcela.DisableControls;
   cdsParcela.First;
   while not cdsParcela.Eof do begin
     if cdsParcela.FieldByName('CHKBOX').AsInteger = 1 then Result := True;
     cdsParcela.Next;
   end;
   cdsParcela.First;
   cdsParcela.EnableControls;
   if not Result then MsgDlg('Marque as parcelas para exclusão','Aviso',mtWarning,[mbOk],0);
end;


procedure TfrmExcluiParcelaMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if VerificaPreenchimento then begin
     if MsgDlg('Confirma a Exclusão das parcelas selecionadas ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
        try
           CtrlGerContrato.CreateThreadProgresso;

           // Exibe caixa de dialogo com a barra de progresso
           frmProgresso.MostraFormProgresso('Excluindo Parcelas...',False,False);
           Application.ProcessMessages;

           if CtrlGerContrato.ExcluiParcela( cdsParcela.Data,
                                             CtrlGerContrato.ProgressFileName ) then begin
              cdsParcela.Data := CtrlGerContrato.ListParcelaGerada(molContrato1.iContrato, True, dIni, dFim, dGera);
           end else begin
              MsgDlg(CtrlGerContrato.MessageInfo,'Erro',mtError,[mbOK],0);
           end;
        finally
           CtrlGerContrato.FreeThreadProgresso;
           frmProgresso.EscondeFormProgresso;
        end;
     end;
  end;
end;

procedure TfrmExcluiParcelaMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  molContrato1.btnLimpaContratoClick( Self );
  edtDataGera.Clear;
  edtDtIni.Clear;
  edtDtFim.Clear;
  cdsParcela.Data := CtrlGerContrato.ListParcelaGerada( -2, False);  // Abre vazio
end;


procedure TfrmExcluiParcelaMT.dbgParcelasCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmExcluiParcelaMT.dbgParcelasTopRowChanged(Sender: TObject);
begin
  inherited;
  // acerta as cores quando muda a linha da grid
  (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExcluiParcelaMT.Progresso(vParams: array of variant);
begin
  frmProgresso.AndaFormProgresso( vParams[2], vParams[3] );
end;


procedure TfrmExcluiParcelaMT.btnSelecionaClick(Sender: TObject);
begin
   inherited;
   // Seleciona todas as parcelas
   cdsParcela.DisableControls;
   cdsParcela.First;
   while not cdsParcela.eof do begin
      cdsParcela.Edit;
      cdsParcelaCHKBOX.AsInteger := 1;
      cdsParcela.Post;
      cdsParcela.Next;
   end;
   cdsParcela.First;
   cdsParcela.EnableControls;
end;

procedure TfrmExcluiParcelaMT.btnLimpaClick(Sender: TObject);
begin
  inherited;
   // Seleciona todas as parcelas
   cdsParcela.DisableControls;
   cdsParcela.First;
   while not cdsParcela.eof do begin
      cdsParcela.Edit;
      cdsParcelaCHKBOX.Clear;
      cdsParcela.Post;
      cdsParcela.Next;
   end;
   cdsParcela.First;
   cdsParcela.EnableControls;

end;

procedure TfrmExcluiParcelaMT.btnEstornoClick(Sender: TObject);
begin
  inherited;
  if VerificaPreenchimento then begin
     if MsgDlg('Confirma o Estorno das parcelas selecionadas ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
        try
           CtrlGerContrato.CreateThreadProgresso;

           // Exibe caixa de dialogo com a barra de progresso
           frmProgresso.MostraFormProgresso('Estornando Parcelas...',False,False);
           Application.ProcessMessages;

           if CtrlGerContrato.EstornaParcela( cdsParcela.Data,
                                             CtrlGerContrato.ProgressFileName ) then begin
              cdsParcela.Data := CtrlGerContrato.ListParcelaGerada(molContrato1.iContrato, True, dIni, dFim, dGera);
           end else begin
              MsgDlg(CtrlGerContrato.MessageInfo,'Erro',mtError,[mbOK],0);
           end;
        finally
           CtrlGerContrato.FreeThreadProgresso;
           frmProgresso.EscondeFormProgresso;
        end;
     end;
  end;
end;

end.
