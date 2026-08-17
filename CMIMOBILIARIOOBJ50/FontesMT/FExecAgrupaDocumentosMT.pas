{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Pendência   : 26527
Responsável : Daniel Simões
Data        : 15/10/2007
Descrição   : Passa a agrupar ou não pela Mensagem de Boleto Padrão do Contrato.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecAgrupaDocumentosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  Db, uCmSqlParams, DBClient, uCMClientDataSet, mLocatario,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, mResponsavel, mContrato,
  Grids, Wwdbigrd, Wwdbgrid, uCtrlAgrupaDocumento, uCtrlPadroes, Spin;

type

  TListaReceita = Record
     Receita : String;
     Valor   : Extended;
  end;

  TfrmAgrupaDocumentosMT = class(TfrmWizardMT)
    cdsDocumentos: TCMClientDataSet;
    sqlDocumentos: TCMSqlParams;
    cdsPortadorForma: TCMClientDataSet;
    sqlPortadorForma: TCMSqlParams;
    cdsMensagens: TCMClientDataSet;
    dsDocumentos: TDataSource;
    dsPortadorForma: TDataSource;
    Label22: TLabel;
    molContrato: TmolContrato;
    MolResponsavel: TmolResponsavel;
    DBcboPortadorForma: TwwDBLookupCombo;
    molLocatario: TmolLocatario;
    grbMsgBoleto: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    edtln1: TEdit;
    edtln2: TEdit;
    edtln4: TEdit;
    edtln5: TEdit;
    edtln6: TEdit;
    edtln7: TEdit;
    edtln3: TEdit;
    edtln8: TEdit;
    edtln9: TEdit;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Panel1: TPanel;
    fcLabel2: TfcLabel;
    wwDBGrid1: TwwDBGrid;
    gbDatas: TGroupBox;
    edtDataIni: TCMDateTimePicker;
    Label5: TLabel;
    edtDataFim: TCMDateTimePicker;
    Label1: TLabel;
    chkEmisBloq: TCheckBox;
    chkAgrupaReceita: TCheckBox;
    cboMes: TComboBox;
    spnAno: TSpinEdit;
    Label2: TLabel;
    cbMsgContrato: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure cbMsgContratoClick(Sender: TObject);
  private
    { Private declarations }
    CtrlAgrupaDocumento : TCtrlAgrupaDocumento;
    aListaReceita  : array of TListaReceita;

    procedure HabilitaBotoes;
    function VerificaPreenchimento: boolean;
    procedure AgrupaReceitas;
  public
    { Public declarations }
  end;

var
  frmAgrupaDocumentosMT: TfrmAgrupaDocumentosMT;

implementation

{$R *.DFM}


uses
   USistema, UMensErro, UDatabase, UComunsImobiliario, uVerificaPreenchimento, UDiasInUteis,
   uFuncoesImob, uMolduras, DMS, uModuloImobiliario,   FProgresso, fAguarde, dBaseDados;



procedure TfrmAgrupaDocumentosMT.FormCreate(Sender: TObject);
var
   iAno, iMes, iDia : Word;
begin
   inherited;
   CtrlAgrupaDocumento := TCtrlAgrupaDocumento.Create;
   CtrlAgrupaDocumento.InitializeAs(Padroes);

   CtrlAgrupaDocumento.cdsDocumentos := cdsDocumentos;
   CtrlAgrupaDocumento.cdsMensagens  := cdsMensagens;
   sqlPortadorForma.Open;

   DecodeDate(Date,iAno, iMes, iDia);

   cboMes.ItemIndex := iMes-1;
   cboMes.Text      := cboMes.Items[iMes-1];
   spnAno.Value     := iAno;

   grbMsgBoleto.Enabled := not cbMsgContrato.Checked; // Daniel - 26527
end;



procedure TfrmAgrupaDocumentosMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil( CtrlAgrupaDocumento );
   inherited;
end;



procedure TfrmAgrupaDocumentosMT.btnConfirmarClick(Sender: TObject);
begin
   inherited;
   cdsMensagens.Data := CtrlAgrupaDocumento.LookupMensagem;
   cdsMensagens.Insert;
   cdsMensagens.FieldByName('TEXTOLINHA_1').AsString := edtln1.Text;
   cdsMensagens.FieldByName('TEXTOLINHA_2').AsString := edtln2.Text;
   cdsMensagens.FieldByName('TEXTOLINHA_3').AsString := edtln3.Text;
   cdsMensagens.FieldByName('TEXTOLINHA_4').AsString := edtln4.Text;
   cdsMensagens.FieldByName('TEXTOLINHA_5').AsString := edtln5.Text;
   cdsMensagens.FieldByName('TEXTOLINHA_6').AsString := edtln6.Text;
   cdsMensagens.FieldByName('TEXTOLINHA_7').AsString := edtln7.Text;
   cdsMensagens.FieldByName('TEXTOLINHA_8').AsString := edtln8.Text;
   cdsMensagens.FieldByName('TEXTOLINHA_9').AsString := edtln9.Text;
   cdsMensagens.Post;
   cdsMensagens.First;

   if not CtrlAgrupaDocumento.AgrupaDocumentos(chkAgrupaReceita.Checked,cboMes.ItemIndex+1,spnAno.Value,cbMsgContrato.Checked) then
        MsgDlg(CtrlAgrupaDocumento.MessageInfo,Sistema.NomeModulo,mtError,[mbOK],0)
   else MsgDlg('Agrupamento efetuado com sucesso',Sistema.NomeModulo,mtInformation,[mbOK],0);

   PagControle.ActivePageIndex := 0;
   HabilitaBotoes;
end;



procedure TfrmAgrupaDocumentosMT.btnContinuarClick(Sender: TObject);
var
   sEmis : String;
begin
   PagControle.ActivePageIndex := PagControle.ActivePageIndex + 1;

   if PagControle.ActivePageIndex = 1 then
   begin
      if not VerificaPreenchimento then
      begin
         btnVoltarClick(Self);
         Exit;
      end;

      edtln1.Color   := clWindow;
      edtln2.Color   := clWindow;
      edtln3.Color   := clWindow;
      edtln4.Color   := clWindow;
      edtln5.Color   := clWindow;
      edtln6.Color   := clWindow;

      edtln1.ReadOnly := False;
      edtln2.ReadOnly := False;
      edtln3.ReadOnly := False;
      edtln4.ReadOnly := False;
      edtln5.ReadOnly := False;
      edtln6.ReadOnly := False;

      edtln1.Clear;
      edtln2.Clear;
      edtln3.Clear;
      edtln4.Clear;
      edtln5.Clear;
      edtln6.Clear;

      if not chkEmisBloq.Checked then sEmis := 'S'
      else                            sEmis := 'N';

      cdsDocumentos.Data := CtrlAgrupaDocumento.LookupDocumentos(Sistema.IDModulo,
                                                                 edtDataIni.Date,
                                                                 edtDataFim.Date,
                                                                 sEmis,
                                                                 StrToInt(DBcboPortadorForma.LookupValue),
                                                                 molContrato.iContrato,
                                                                 molLocatario.iLocatario,
                                                                 MolResponsavel.iResponsavel);

      TFloatField(cdsDocumentos.FieldByName('VALOR_LANC')).DisplayFormat := ',0.00';
      TFloatField(cdsDocumentos.FieldByName('VALOR_LANC')).EditFormat    := ',0.00';

      if chkAgrupaReceita.Checked then AgrupaReceitas;
   end;
   HabilitaBotoes;
end;



procedure TfrmAgrupaDocumentosMT.HabilitaBotoes;
begin
   btnVoltar.Enabled    := PagControle.ActivePageIndex > 0;
   btnContinuar.Enabled := PagControle.ActivePageIndex < 2;
   btnConfirmar.Enabled := PagControle.ActivePageIndex = 2;
end;



procedure TfrmAgrupaDocumentosMT.btnVoltarClick(Sender: TObject);
begin
   PagControle.ActivePageIndex := PagControle.ActivePageIndex -1;
   HabilitaBotoes;
end;



function TfrmAgrupaDocumentosMT.VerificaPreenchimento: boolean;
begin
   Result := False;
   try
      if ( DBcboPortadorForma.Text = '' ) then
         raise EValidacao.CreateVal('É necessário indicar a forma de cobrança!', DBcboPortadorForma);
      if ( edtDataIni.Text = '' ) then
         raise EValidacao.CreateVal('É necessário indicar a data inicial!', edtDataIni);
      if ( edtDataFim.Text = '' ) then
         raise EValidacao.CreateVal('É necessário indicar a data final!', edtDataFim);
      if edtDataFim.Date < edtDataIni.Date then
         raise EValidacao.CreateVal('Data inicial não pode ser maior que data final!', edtDataIni);
   except
      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TfrmAgrupaDocumentosMT.AgrupaReceitas;
var iIndice       : Integer;
    iContador     : Integer;
    sLinha        : String;
    stLista       : TStringList;
begin
   stLista := TStringList.Create;
   aListaReceita := nil;

   cdsDocumentos.DisableControls;
   cdsDocumentos.First;
   while not cdsDocumentos.eof do
   begin
      iIndice := stLista.IndexOf(cdsDocumentos.FieldByName('DESCCUSTORECIMO').AsString);
      if iIndice = -1 then
      begin
         stLista.Add(cdsDocumentos.FieldByName('DESCCUSTORECIMO').AsString);
         SetLength(aListaReceita, stLista.Count);
         aListaReceita[Length(aListaReceita)-1].Receita := cdsDocumentos.FieldByName('DESCCUSTORECIMO').AsString;
         aListaReceita[Length(aListaReceita)-1].Valor   := cdsDocumentos.FieldByName('VALOR_LANC').AsFloat;
      end
      else
      begin
         aListaReceita[iIndice].Valor   := aListaReceita[iIndice].Valor + cdsDocumentos.FieldByName('VALOR_LANC').AsFloat;
      end;
      cdsDocumentos.Next;
   end;
   stLista.Free;

   for iContador := 0 to length(aListaReceita)-1 do
   begin
       sLinha := aListaReceita[iContador].Receita + ': ' + FormatFloat('#,##0.00',aListareceita[iContador].Valor);

       case iContador of
          0 : begin
                 edtln1.Text     := sLinha;
                 edtln1.Color    := $00A0FEF2;
                 edtln1.ReadOnly := True;
              end;
          1 : begin
                 edtln2.Text     := sLinha;
                 edtln2.Color    := $00A0FEF2;
                 edtln2.ReadOnly := True;
              end;
          2 : begin
                 edtln3.Text     := sLinha;
                 edtln3.Color    := $00A0FEF2;
                 edtln3.ReadOnly := True;
              end;
          3 : begin
                 edtln4.Text     := sLinha;
                 edtln4.Color    := $00A0FEF2;
                 edtln4.ReadOnly := True;
              end;
          4 : begin
                 edtln5.Text     := sLinha;
                 edtln5.Color    := $00A0FEF2;
                 edtln5.ReadOnly := True;
              end;
          5 : begin
                 edtln6.Text     := sLinha;
                 edtln6.Color    := $00A0FEF2;
                 edtln6.ReadOnly := True;
              end;
       end;
   end;
   cdsDocumentos.First;
   cdsDocumentos.EnableControls;
end;

procedure TfrmAgrupaDocumentosMT.cbMsgContratoClick(Sender: TObject);
begin
  inherited;

  grbMsgBoleto.Enabled := not cbMsgContrato.Checked; // Daniel - 26527
end;

end.
