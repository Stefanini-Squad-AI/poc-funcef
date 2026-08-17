{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902
Nº KINTANA..: 1577381
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FDesfazIntegracaoContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls,
  mContrato, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, Grids, Wwdbigrd,
  Wwdbgrid, uCtrlPadroes, uCtrlHistMovImob, uCmSqlParams, Db, DBClient,
  uCMClientDataSet,
  // Helen - SOL: 172902 KTN: 1577381
  uCtrlContab;

type
  TfrmDesfazIntegracaoContabil = class(TfrmWizardMT)
    rdgTipoEvento: TRadioGroup;
    grpDatas: TGroupBox;
    Label5: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    TabSheet2: TTabSheet;
    fcLabel2: TfcLabel;
    Panel5: TPanel;
    grdLancamentos: TwwDBGrid;
    panDetalhes: TPanel;
    grdDetalhes: TwwDBGrid;
    Panel2: TPanel;
    grdLancamentosNao: TwwDBGrid;
    panDetalhesNao: TPanel;
    grdDetalhesNao: TwwDBGrid;
    Label2: TLabel;
    edtNumContrato: TEdit;
    edtNomeContrato: TEdit;
    Label3: TLabel;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    cdsHistMovImob: TCMClientDataSet;
    dsHistMovImob: TDataSource;
    CMSqlParams1: TCMSqlParams;
    cdsContratos: TCMClientDataSet;
    dsContratos: TDataSource;
    sqlContratos: TCMSqlParams;
    cdsHistMovImobNOME: TStringField;
    cdsHistMovImobIDCONTRATOIMOVEL: TFloatField;
    cdsHistMovImobCONNUMERO: TStringField;
    cdsHistMovImobCONNOME: TStringField;
    cdsHistMovImobDESCCUSTORECIMO: TStringField;
    cdsHistMovImobIDHISTMOVIMOB: TFloatField;
    cdsHistMovImobIDCONDPAGIMOVEL: TFloatField;
    cdsHistMovImobIDTIPOCUSTORECIMO: TFloatField;
    cdsHistMovImobIDITEMCENTRALIZA: TFloatField;
    cdsHistMovImobHMIDATAMOV: TDateTimeField;
    cdsHistMovImobHMIVALOR: TFloatField;
    cdsHistMovImobHMIDOCUMENTO: TFloatField;
    cdsHistMovImobHMITIPOEVENTO: TFloatField;
    cdsHistMovImobPLNCODIGO: TFloatField;
    cdsContratosIDCONTRATOIMOVEL: TFloatField;
    cdsContratosCONNUMERO: TStringField;
    cdsContratosCONNOME: TStringField;
    cdsContratosIDCONDPAGIMOVEL: TFloatField;
    cdsContratosNOME: TStringField;
    cdsHistMovAux: TCMClientDataSet;
    dsHistMovAux: TDataSource;
    cdsAux: TCMClientDataSet;
    CMSqlParams2: TCMSqlParams;
    cdsHistMovAuxNOME: TStringField;
    cdsHistMovAuxIDCONTRATOIMOVEL: TFloatField;
    cdsHistMovAuxCONNUMERO: TStringField;
    cdsHistMovAuxCONNOME: TStringField;
    cdsHistMovAuxDESCCUSTORECIMO: TStringField;
    cdsHistMovAuxIDHISTMOVIMOB: TFloatField;
    cdsHistMovAuxIDCONDPAGIMOVEL: TFloatField;
    cdsHistMovAuxIDTIPOCUSTORECIMO: TFloatField;
    cdsHistMovAuxIDITEMCENTRALIZA: TFloatField;
    cdsHistMovAuxHMIDATAMOV: TDateTimeField;
    cdsHistMovAuxHMIVALOR: TFloatField;
    cdsHistMovAuxHMIDOCUMENTO: TFloatField;
    cdsHistMovAuxHMITIPOEVENTO: TFloatField;
    cdsHistMovAuxPLNCODIGO: TFloatField;
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure cdsContratosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    iContratoSelecao : Integer;

    CtrlHistMovImob  : TCtrlHistMovImob;
    CtrlContab       : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381
  public
    { Public declarations }
  end;

var
  frmDesfazIntegracaoContabil: TfrmDesfazIntegracaoContabil;

implementation

{$R *.DFM}

uses
  uDataBase, uSistema, uMensErro, uVerificaPreenchimento, dMS;


procedure TfrmDesfazIntegracaoContabil.btnBuscaContratoClick(Sender: TObject);
var
   sFiltro : String;
begin
   inherited;
   sFiltro := 'C.IDRESPONSAVEL = PR.IDPESSOA(+) ' + #13 +
              'C.IDLOCATARIO = PL.IDPESSOA(+)'    + #13 +
              'C.IDRESPONSAVEL = U.IDUSUARIO(+)'  + #13 +
              'C.FLGTIPOCONTRATO = ''D''';

   dtmMS.MS_Contrato.Filtro.Text := sFiltro;
   dtmMS.MS_Contrato.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Contrato.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iContratoSelecao     := StrToInt(dtmMS.MS_Contrato.ValoresChave[0]);
      edtNumContrato.Text  := dtmMS.MS_Contrato.ValoresChave[1];
      edtNomeContrato.Text := dtmMS.MS_Contrato.ValoresChave[2];
      Screen.Cursor        := crDefault;
   end;

   btnBuscaContrato.SetFocus;
end;



procedure TfrmDesfazIntegracaoContabil.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   iContratoSelecao  := -1;
   edtNumContrato.Clear;
   edtNomeContrato.Clear;
end;



procedure TfrmDesfazIntegracaoContabil.FormCreate(Sender: TObject);
begin
   inherited;
   iContratoSelecao := -1;
   CtrlHistMovImob  := TCtrlHistMovImob.Create;
   CtrlHistMovImob.iEmpresa       := Sistema.IdEmpresa;
   CtrlHistMovImob.iModulo        := Sistema.IdModulo;
   CtrlHistMovImob.iUsuario       := sistema.IdUsuario;
   CtrlHistMovImob.UsaPlanoPatro  := Sistema.UsaPlanoPatro;
   CtrlHistMovImob.InitializeAs(Padroes);
   CtrlHistMovImob.CdsHistMovImob := CdsHistMovImob;
   CtrlHistMovImob.CdsItensCalc   := cdsAux;
   // Helen - SOL: 172902 KTN: 1577381
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(Padroes);
end;



procedure TfrmDesfazIntegracaoContabil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(CtrlHistMovImob);
   FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381
   inherited;
end;



procedure TfrmDesfazIntegracaoContabil.btnContinuarClick(Sender: TObject);
var
   iTipoEvento : Integer;
   iPlanilha   : Integer;
begin
   if PagControle.ActivePage = tabSelecao then
   begin
      // Helen - SOL: 172902 KTN: 1577381 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataIni.text) then
      begin
          MsgDlg('Período contábil bloqueado.','Aviso',mtWarning,[mbOk],0);
          edtDataIni.SetFocus;
          Exit;
      end;
      // Helen - SOL: 172902 KTN: 1577381 - Fim
      cdsContratos.Close;
      sqlContratos.Open;
      if rdgTipoEvento.ItemIndex = 4 then iTipoEvento := -1
      else                                iTipoEvento := rdgTipoEvento.ItemIndex;

      cdsHistMovImob.Data := CtrlHistMovImob.LookupHistMovImob(-1,-1,iTipoEvento,-3,-1,edtDataIni.Date,edtDataFim.Date,iContratoSelecao);
      cdsHistMovAux.Data  := cdsHistMovImob.Data;
      while not cdsHistMovImob.eof do
      begin
         if not cdsContratos.Locate('IDCONTRATOIMOVEL;IDCONDPAGIMOVEL',
                                     VarArrayOf([cdsHistMovImob.FieldByName('IDCONTRATOIMOVEL').AsInteger,cdsHistMovImob.FieldByName('IDCONDPAGIMOVEL').AsInteger]),
                                     []) then
         begin
            cdsContratos.Append;
            cdsContratos.FieldByName('IDCONTRATOIMOVEL').AsInteger := cdsHistMovImob.FieldByName('IDCONTRATOIMOVEL').AsInteger;
            cdsContratos.FieldByName('CONNUMERO').AsString         := cdsHistMovImob.FieldByName('CONNUMERO').AsString;
            cdsContratos.FieldByName('CONNOME').AsString           := cdsHistMovImob.FieldByName('CONNOME').AsString;
            cdsContratos.FieldByName('NOME').AsString              := cdsHistMovImob.FieldByName('NOME').AsString;
            cdsContratos.FieldByName('IDCONDPAGIMOVEL').AsInteger  := cdsHistMovImob.FieldByName('IDCONDPAGIMOVEL').AsInteger;
            cdsContratos.Post;
         end;
         cdsHistMovImob.Next;
      end;
      cdsHistMovImob.First;
      cdsContratos.First;
   end;

   if PagControle.ActivePage = TabSheet1 then
   begin
      CtrlHistMovImob.OpenTransaction := False;
      try
         StartTransacao;
         cdsHistMovImob.First;
         while not cdsHistMovImob.eof do
         begin

            iPlanilha := cdsHistMovImob.FieldByName('PLNCODIGO').AsInteger;
            
            cdsHistMovImob.Edit;
            cdsHistMovImob.FieldByName('PLNCODIGO').Clear;
            cdsHistMovImob.Post;

            if not CtrlHistMovImob.GravaHistMovImob then
               Raise Exception.Create(CtrlHistMovImob.MessageInfo);

            if not CtrlHistMovImob.DesfazContabilizacao(Sistema.IdUsuario,
                                                        iPlanilha,
                                                        Sistema.IdModulo,
                                                        0,
                                                        Sistema.UsaPlanoPatro,
                                                        True,
                                                        False) then
               Raise Exception.Create(CtrlHistMovImob.MessageInfo);

            cdsHistMovImob.Next;
         end;
         CommitTransacao;
      except
         on E : Exception do
         begin
            RollbackTransacao;
            MsgDlg(E.Message,'Aviso',mtWarning,[mbOK],0);
         end;
      end;

      cdsContratos.Close;
      sqlContratos.Open;
      if rdgTipoEvento.ItemIndex = 4 then iTipoEvento := -1
      else                                iTipoEvento := rdgTipoEvento.ItemIndex;

      cdsHistMovImob.Data := CtrlHistMovImob.LookupHistMovImob(-1,-1,iTipoEvento,-3,-1,edtDataIni.Date,edtDataFim.Date,iContratoSelecao);
      cdsHistMovAux.Data  := cdsHistMovImob.Data;
      while not cdsHistMovImob.eof do
      begin
         if not cdsContratos.Locate('IDCONTRATOIMOVEL;IDCONDPAGIMOVEL',
                                     VarArrayOf([cdsHistMovImob.FieldByName('IDCONTRATOIMOVEL').AsInteger,cdsHistMovImob.FieldByName('IDCONDPAGIMOVEL').AsInteger]),
                                     []) then
         begin
            cdsContratos.Append;
            cdsContratos.FieldByName('IDCONTRATOIMOVEL').AsInteger := cdsHistMovImob.FieldByName('IDCONTRATOIMOVEL').AsInteger;
            cdsContratos.FieldByName('CONNUMERO').AsString         := cdsHistMovImob.FieldByName('CONNUMERO').AsString;
            cdsContratos.FieldByName('CONNOME').AsString           := cdsHistMovImob.FieldByName('CONNOME').AsString;
            cdsContratos.FieldByName('NOME').AsString              := cdsHistMovImob.FieldByName('NOME').AsString;
            cdsContratos.FieldByName('IDCONDPAGIMOVEL').AsInteger  := cdsHistMovImob.FieldByName('IDCONDPAGIMOVEL').AsInteger;
            cdsContratos.Post;
         end;
         cdsHistMovImob.Next;
      end;
      cdsHistMovImob.First;
      cdsContratos.First;
   end;

   inherited;
end;



procedure TfrmDesfazIntegracaoContabil.cdsContratosAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if cdsContratos.Active then
   begin
      if not cdsContratos.IsEmpty then
      begin
         if (not cdsContratos.FieldByName('IDCONTRATOIMOVEL').IsNull) and (not cdsContratos.FieldByName('IDCONDPAGIMOVEL').IsNull) then
         begin
            cdsHistMovAux.Filter   := 'IDCONTRATOIMOVEL = ' + cdsContratos.FieldByName('IDCONTRATOIMOVEL').AsString + ' AND ' +
                                      'IDCONDPAGIMOVEL = ' + cdsContratos.FieldByName('IDCONDPAGIMOVEL').AsString;
            cdsHistMovAux.Filtered := True;
         end;
      end;
   end;
end;





end.
