unit fExecEstorno;

{ --------------------------------------------------------------------------------------------------
Rotina    : Processa
Data      : 21/02/2006
Autor     : Marchetti
Pendência : 17552
Descrição : Utilização dos métodos em 3 camadas na CtrlLancamentosImovel
---------------------------------------------------------------------------------------------------}

// ------------------------------------------------------------------------------------------------
//
//	   Executa o Estorno das Parcelas Já integradas
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  01/10/2001
//	Data de Término   :  07/10/2001
//
// -------------------------------------------------------------------------------------------------
{--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8221
Nº KINTANA..: 1577344
Data........: 20/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, mResponsavel,
  wwdbdatetimepicker, CMDateTimePicker, fcButton, fcImgBtn, fcShapeBtn,
  mComprador, mProposta, fcLabel, DBTables, Db, Wwdatsrc, Wwquery,
  mAdministradora, uCtrlLancamentosImovel, uCtrlPadroes, uSistema,
  // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab;

type
  TfrmExecEstorno = class(TfrmSairAjudaImob)
    ntbEstorno: TNotebook;
    lblTitulo: TfcLabel;
    molProposta1: TmolProposta;
    molComprador1: TmolComprador;
    btnContinua1: TfcShapeBtn;
    GroupBox1: TGroupBox;
    cbGerada: TCheckBox;
    cbSinal: TCheckBox;
    cbAmort: TCheckBox;
    cbProj: TCheckBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edDataI: TCMDateTimePicker;
    edDataF: TCMDateTimePicker;
    molResponsavel1: TmolResponsavel;
    GroupBox3: TGroupBox;
    edtDataIntegra: TCMDateTimePicker;
    Panel1: TPanel;
    btnSeleciona: TSpeedButton;
    btnLimpa: TSpeedButton;
    btnContinua2: TfcShapeBtn;
    btnCancela2: TfcShapeBtn;
    Panel4: TPanel;
    grdParc: TwwDBGrid;
    qryParc: TwwQuery;
    qryParcCODDOCUMENTO: TFloatField;
    qryParcDATAVENCIMENTO: TDateTimeField;
    qryParcRAZAOSOCIAL: TStringField;
    qryParcVALOR: TFloatField;
    qryParcNUMCONTRATO: TStringField;
    qryParcCAL_TIPO: TStringField;
    qryParcNOMECONTRATO: TStringField;
    qryParcNUMPARCELA: TFloatField;
    qryParcIDCONTRATOIMOVEL: TFloatField;
    qryParcIDPARCFINANCIMOV: TFloatField;
    qryParcIDCONDPAGIMOVEL: TFloatField;
    qryParcIDPESSOA: TFloatField;
    qryParcPLNCODIGO: TFloatField;
    qryParcFLGTIPOLANC: TFloatField;
    qryParcPRAZO: TStringField;
    qryParcPERIODO: TFloatField;
    dsParc: TwwDataSource;
    UpdParc: TUpdateSQL;
    qryParcFLGESTORNO: TFloatField;
    Label3: TLabel;
    Label4: TLabel;
    qryParcDATALANCINTEGRA: TDateTimeField;
    qryParcFLGLANCINTEGRA: TFloatField;
    cbExtra: TCheckBox;
    cbVista: TCheckBox;
    cbAntec: TCheckBox;
    cbResiduo: TCheckBox;
    molAdministradora1: TmolAdministradora;
    procedure FormShow(Sender: TObject);
    procedure ntbEstornoPageChanged(Sender: TObject);
    procedure btnContinua1Click(Sender: TObject);
    procedure btnCancela2Click(Sender: TObject);
    procedure qryParcCalcFields(DataSet: TDataSet);
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnLimpaClick(Sender: TObject);
    procedure grdParcDblClick(Sender: TObject);
    procedure btnContinua2Click(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure grdParcCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdParcTopRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela

  private

    { Private declarations }
    CtrlContab   : TCtrlContab; // Helen - SOL: 172902/8221 KTN: 1577344

    //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
    procedure Sel;                                       // Seleciona as parcelas para estornar
    procedure Processa;                                  // Executa o Estorno da parcela

  public
    { Public declarations }
  end;

var
  frmExecEstorno: TfrmExecEstorno;

implementation

uses uMensErro, uDataBase, UFuncoesImob, dBaseDados, fAguarde,
  DFinanciamento, UFuncAlienacao;

{$R *.DFM}

procedure TfrmExecEstorno.FormShow(Sender: TObject);
begin
   inherited;
   ntbEstorno.ActivePage := 'Selecao';
end;

procedure TfrmExecEstorno.ntbEstornoPageChanged(Sender: TObject);
begin
   inherited;
   if ntbEstorno.ActivePage = 'Selecao' then begin
      lblTitulo.Caption := '  Estorno de Parcelas Integradas [Seleção]';
   end else begin
      lblTitulo.Caption := '  Estorno de Parcelas Integradas [Confirmação]';
   end;
end;

procedure TfrmExecEstorno.btnContinua1Click(Sender: TObject);
begin
   inherited;
   if edDataF.Date < edDataI.Date then begin
      MsgDlg('A data final não pode ser menor que a data inicial','Erro',mtError,[mbOk],0);
      EdDataF.SetFocus;
      Exit;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   if edDataI.Text <> '' then
   begin
       if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edDataI.Text) then
       begin
          MsgDlg('Período contábil bloqueado.','Erro',mtError,[mbOk],0);
          edDataI.SetFocus;
          Exit;
       end;
   end;
   if edtDataIntegra.Text <> '' then
   begin
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataIntegra.Text) then
      begin
        MsgDlg('Período contábil bloqueado.','Erro',mtError,[mbOk],0);
        edtDataIntegra.SetFocus;
        Exit;
      end;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Fim
   ntbEstorno.ActivePage  := 'Confirma';
   btnContinua2.Enabled   := False;
   btnCancela2.Enabled    := False;

   // Seleciona as parcelas disponiveis para estorno
   Sel;
   btnCancela2.Enabled    := True;
   if not qryParc.IsEmpty then begin
      btnContinua2.Enabled := True;
   end;
   grdParc.SetFocus;
end;

procedure TfrmExecEstorno.btnCancela2Click(Sender: TObject);
begin
   inherited;
   ntbEstorno.ActivePage := 'Selecao';
end;

procedure TfrmExecEstorno.Sel;
begin
   // Define filtros do SQL e abre as parcelas disponiveis para estorno
   LimpaParametros(qryParc);
   if edtDataIntegra.Text <> '' then
      qryParc.ParamByName('pDATAINTEGRA').AsDateTime := edtDataIntegra.Date;
   if edDataI.Text <> '' then
      qryParc.ParamByName('pDATAI').AsDateTime := edDataI.Date;
   if edDataF.Text <> '' then
      qryParc.ParamByName('pDATAF').AsDateTime := edDataF.Date;
   if molproposta1.iProposta > 0 then
      qryParc.ParamByName('pIDCONTRATO').AsFloat := molproposta1.iProposta;
   if molComprador1.iComprador > 0 then
      qryParc.ParamByName('pIDPESSOA').AsFloat := molComprador1.iComprador;
   if molResponsavel1.iResponsavel > 0 then
      qryParc.ParamByName('pIDRESPONSAVEL').AsFloat := molResponsavel1.iResponsavel;
   if molAdministradora1.iAdministradora > 0 then
      qryParc.ParamByName('pIDADMINIMOVEL').AsFloat := molAdministradora1.iAdministradora;
   if cbSinal.Checked   then qryParc.ParamByName('pSINAL').AsString := 'S';
   if cbGerada.Checked  then qryParc.ParamByName('pGERA').AsString  := 'S';
   if cbProj.Checked    then qryParc.ParamByName('pPROJ').AsString  := 'S';
   if cbAmort.Checked   then qryParc.ParamByName('pAMORT').AsString := 'S';
   if cbExtra.Checked   then qryParc.ParamByName('pEXTRA').AsString := 'S';
   if cbVista.Checked   then qryParc.ParamByName('pVISTA').AsString := 'S';
   if cbAntec.Checked   then qryParc.ParamByName('pANTEC').AsString := 'S';
   if cbResiduo.Checked then qryParc.ParamByName('pRESID').AsString := 'S';
   qryParc.Open;
end;


procedure TfrmExecEstorno.qryParcCalcFields(DataSet: TDataSet);
begin
   inherited;
   // Carrega o tipo de parcela
   qryParcCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryParcFLGTIPOLANC.AsInteger, -1);
end;

procedure TfrmExecEstorno.btnSelecionaClick(Sender: TObject);
var bOk : Boolean;
    dPagto : TDateTime;
begin
   inherited;
   bOk := True;

   // Marca todas as parcelas possíveis de serem estornadas
   qryParc.DisableControls;
   qryParc.First;
   while not qryParc.eof do begin

      // Checa se a parcela já foi paga e não permite o estorno
      if not FuncAlienacao.VerificaPagto(qryParcCODDOCUMENTO.AsInteger,dPagto) then begin
         qryParc.Edit;
         qryParcFLGESTORNO.AsInteger := 1;
         qryParc.Post;
      end else begin
         bOk := False;
      end;

      qryParc.Next;
   end;
   qryParc.First;
   qryParc.EnableControls;
   if not bOk then begin
      MsgDlg('Existem Documentos que já foram pagos. Estes não podem mais ser estornado','Atenção',mtWarning,[mbOk],0);
   end;
end;

procedure TfrmExecEstorno.btnLimpaClick(Sender: TObject);
begin
   inherited;
   // Desmarca todas as parcelas selecionadas
   qryParc.DisableControls;
   qryParc.First;
   while not qryParc.eof do begin
      qryParc.Edit;
      qryParcFLGESTORNO.Clear;
      qryParc.Post;
      qryParc.Next;
   end;
   qryParc.First;
   qryParc.EnableControls;
end;

procedure TfrmExecEstorno.grdParcDblClick(Sender: TObject);
var dPagto : TDateTime;
begin
   inherited;
   // Marca a parcela para ser estornada
   if not qryParc.IsEmpty then begin

      // Verifica se a parcela já foi paga
      if not FuncAlienacao.VerificaPagto(qryParcCODDOCUMENTO.AsInteger,dPagto) then begin
         qryParc.Edit;
         qryParcFLGESTORNO.AsInteger := (qryParcFLGESTORNO.AsInteger Xor 1);
         qryParc.Post;
      end else begin
         MsgDlg('O Documento selecionado foi pago em ' + DateToStr(dPagto) +
                '. Não pode mais ser estornado','Atenção',mtWarning,[mbOk],0);
      end;
   end;
end;

procedure TfrmExecEstorno.btnContinua2Click(Sender: TObject);
begin
   inherited;
   if qryParc.IsEmpty then begin
      MsgDlg('Não ha parcelas para estornar','Atenção',mtWarning,[mbOk],0);
   end else begin
      // Executa o estorno das parcelas selecionadas
      Processa;
      Sel;
   end;
end;


procedure TfrmExecEstorno.Processa;
var sMens      : String;
    iDocumento, iPlanilha, iPos : Integer;
    dDataInt   : TDateTime;
    //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
    CtrlLancamentosImovel : TCtrlLancamentosImovel;    
begin
    FrmAguarde.Min := 0;
    FrmAguarde.Max := qryParc.RecordCount;
    FrmAguarde.Pos := 0;
    FrmAguarde.Mostra('Aguarde Processando...');
    Application.ProcessMessages;

    //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
    CtrlLancamentosImovel := TCtrlLancamentosImovel.Create(Sistema.IdEmpresa,Sistema.IDModulo, Sistema.IdUsuario, Sistema.IdEspAcesso,Sistema.UsaPlanoPatro);
    CtrlLancamentosImovel.InitializeAs(Padroes);

    // Executa o estorno para todas as parcelas selecionadas
    qryParc.First;
    qryParc.DisableConstraints;
    try
       try
          StartTransacao;
          while not qryParc.Eof do begin
             if qryParcFLGESTORNO.AsInteger > 0 then begin

                // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
                if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,qryParcDATAVENCIMENTO.AsString) then
                begin
                      MsgDlg('Período contábil bloqueado - Data Vencimento.', 'Erro', mtError, [mbOk], 0);
                      if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
                       Break;
                end;
                // Helen - SOL: 172902/8221 KTN: 1577344 - Fim
                if not qryParcCODDOCUMENTO.IsNull then
                     FrmAguarde.Mostra('Aguarde Processando Doc. ' + IntToStr(qryParcCODDOCUMENTO.AsInteger))
                else FrmAguarde.Mostra('Aguarde Processando...');
                iPos := iPos + 1;
                FrmAguarde.Pos := iPos;
                Application.ProcessMessages;

                if not CtrlLancamentosImovel.Excluir(qryParcCODDOCUMENTO.AsInteger,False, qryParcPLNCODIGO.AsInteger) then
                begin
                   MsgDlg(CtrlLancamentosImovel.MessageInfo,'Erro',mtError,[mbOk],0);
                   if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
                   Break;
                end;
             end;
             qryParc.Next;
          end;
          if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
          ntbEstorno.PageIndex := 0;
       except
          RollBackTransacao;
          raise;
       end;
    finally
       qryParc.EnableConstraints;
    end;

    FrmAguarde.Apaga;
    //Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela
    FreeAndNil(CtrlLancamentosImovel);    
end;


procedure TfrmExecEstorno.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(2,True,Sender);
end;

procedure TfrmExecEstorno.grdParcCalcCellColors(Sender: TObject;
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

procedure TfrmExecEstorno.grdParcTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

//Ricardo Cristiano - SOL : 167206 Kintana : 1465690 - Alteração para melhorar performance na entrada da tela

procedure TfrmExecEstorno.FormCreate(Sender: TObject);
begin
  inherited;
  // Helen - SOL: 172902/8221 KTN: 1577344
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
end;

procedure TfrmExecEstorno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlContab); // Helen - SOL: 172902/8221 KTN: 1577344
end;

end.
