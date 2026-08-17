unit fMTObraCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCadastroMestreDetMT, MontaSelect, DB, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwriched, TREdit, Mask, wwdbedit, uCmSqlParams,
  uCMTypes, uCtrlPadroes, uCtrlCafObra, IvEMulti;

type
  TfrmMTObraCad = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dbeDescObra: TwwDBRichEdit;
    dbeDtaInicioObra: TCMDateTimePicker;
    Label2: TLabel;
    cdsDet: TCMClientDataSet;
    dbeCentroCusto: TwwDBEdit;
    bbtnSelCCusto: TBitBtn;
    Label3: TLabel;
    Label13: TLabel;
    dbeDescCCusto: TwwDBEdit;
    Label14: TLabel;
    dbeParticipacao: TDBRealEdit;
    Label7: TLabel;
    MSCentroCusto: TMontaSelect;
    sqlDet: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure bbtnSelCCustoClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
  private
    { Private declarations }
    Obra : TCtrlCafObra;
    procedure SelObra(fIdPessoa, fIdCafObra : Extended);
  public
    { Public declarations }
  end;

var
  frmMTObraCad: TfrmMTObraCad;

implementation

{$R *.dfm}

Uses uMensErro, uSistema;

procedure TfrmMTObraCad.FormCreate(Sender: TObject);
begin
   inherited;
   Obra := TCtrlCafObra.Create;
   Obra.InitializeAs(Padroes);
   Obra.cds := cds;
   Obra.cdsCafObraRateio := cdsDet;
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('CAFOBRA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   MSCentroCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
   SelObra(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TFrmMTObraCad.SelObra(fIdPessoa, fIdCafObra : Extended);
begin
   cds.Data := Obra.ListaCafObra(fIdPessoa, fIdCafObra);
   if not cds.IsEmpty then
   begin
      cdsDet.Data := Obra.ListaCafObraRateio(cds.FieldByName('IDPESSOA').AsFloat,
                                             cds.FieldByName('IDCAFOBRA').AsFloat);
   end else
   begin
      cdsDet.Data := Obra.ListaCafObraRateio(Sistema.IdEmpresa,0);
   end;
end;
//========================================================================================
procedure TfrmMTObraCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Obra.Free;
end;
//========================================================================================
procedure TfrmMTObraCad.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Obra.AplicaOperacao('S');
end;
//========================================================================================
procedure TfrmMTObraCad.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Obra.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTObraCad.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Obra.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTObraCad.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if trim(Obra.MessageInfo) <> '' then
      MsgDlg(Obra.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTObraCad.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelObra(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTObraCad.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTObraCad.CmeCadastroInsert(Sender: TObject);
begin
   SelObra(Sistema.IdEmpresa, 0);
   inherited;
end;
//========================================================================================
procedure TfrmMTObraCad.CmeCadastroDelete(Sender: TObject);
begin
   if not Obra.LancamentosnaObra(cds.FieldByName('IDPESSOA').AsFloat,
                                 cds.FieldByName('IDCAFOBRA').AsFloat) then
   begin
      cdsDet.First;
      while not cdsDet.EOF do
         cdsDet.Delete;
      inherited;
   end else
   begin
      MsgDlg(Obra.MessageInfo,'Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
procedure TfrmMTObraCad.bbtnSelCCustoClick(Sender: TObject);
begin
   inherited;
   MSCentroCusto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSCentroCusto.RetornouValor then
   begin
      cdsDet.FieldByName('CODCENTROCUSTO').AsString := trim(MSCentroCusto.ValoresChave[0]);
      cdsDet.FieldByName('IDEMPRESA').AsInteger     := strtoint(MSCentroCusto.ValoresChave[1]);
      cdsDet.FieldByName('DESCCCUSTO').AsString     := trim(MSCentroCusto.ValoresChave[2]);
   end;
end;
//========================================================================================
procedure TfrmMTObraCad.CmeDetalheConfirma(Sender: TObject);
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if cdsDet.State in [dsInsert,dsEdit] then
      begin
         if (trim(dbeCentroCusto.Text) = '') Then
         begin
            MsgDlg('Centro de Custo não foi Selecionado','Erro',mtError,[mbOK],0);
            bbtnSelCCusto.SetFocus;
            exit;
         end else
         if (dbeParticipacao.Value = 0) then
         begin
            MsgDlg('Percentual não foi preenchido','Erro',mtError,[mbOK],0);
            dbeParticipacao.SetFocus;
            exit;
         end;
         //-------------------------------------------------------------------------------
         if cdsDet.State = dsInsert then
         begin
            cdsDet.FieldByName('IDPESSOA').AsFloat  := Sistema.IdEmpresa;
            cdsDet.FieldByName('IDEMPRESA').AsFloat := Sistema.IdEmpresa;
         end;
      end;
   end;
   inherited;
end;
//========================================================================================
procedure TfrmMTObraCad.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
var
   fTotPerc : Extended;

begin
   Accept := True;
   if (trim(dbeDescObra.Text) = '') then
   begin
      MsgDlg('Descrição da Obra não foi preenchida','Erro',mtError,[mbOK],0);
      dbeDescObra.SetFocus;
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeDtaInicioObra.Text) = '') then
   begin
       MsgDlg('Data de Inicio da Obra não foi preenchida','Erro',mtError,[mbOK],0);
       dbeDtaInicioObra.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   begin
      fTotPerc := 0;
      cdsDet.First;
      while not cdsDet.EOF do
      begin
         fTotPerc := fTotPerc + cdsDet.FieldByName('PARTICIPACAO').asFloat;
         cdsDet.Next;
      end;
      if fTotperc <> 100 then
      begin
         MsgDlg('Soma dos Rateios de Custo está em ' + FloatToStr(fTotPerc) +
                '% e deve ser 100% ','Erro',mtError,[mbOK],0);
         Accept := False;
      end;
   end;
   //-------------------------------------------------------------------------------------
   if Accept and (cds.State = dsInsert) then
   begin
      cds.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
      cds.FieldByName('IDMODULO').AsFloat := Sistema.IdModulo;
      cds.FieldByName('FLGOBRA').AsFloat  := 0;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
end;
//========================================================================================
procedure TfrmMTObraCad.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;

begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   if OldOperacao = opApagar then
      SelObra(Sistema.IdEmpresa,0);
end;
//========================================================================================
procedure TfrmMTObraCad.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   SelObra(Sistema.IdEmpresa,0);
end;
//========================================================================================
procedure TfrmMTObraCad.dbgrdDetDblClick(Sender: TObject);
begin
   //inherited;
end;

end.
