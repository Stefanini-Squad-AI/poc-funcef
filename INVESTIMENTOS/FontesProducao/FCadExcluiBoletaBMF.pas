//******************************************************************************
// Data      : 12/11/2006
// Código    : AL_2
// Pendencia : 26852
// Desc      : Acerto na exclusao
//******************************************************************************
// Data      : 18/07/2006
// Código    : AL_1
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************

unit FCadExcluiBoletaBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, ComCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCadExcluiBoletaBMF = class(TfrmCadastroCS)
    dblCorretora: TwwDBLookupCombo;
    dDataRef: TCMDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    lblBoleta: TLabel;
    updOrdMovInv: TwwQuery;
    QryDelDespOperInvest: TwwQuery;
    QryDelHistcartInv: TwwQuery;
    QryDelOperInvest: TwwQuery;
    QrySelDespOper: TwwQuery;
    QrySelDespOperIDOPERACAOINVEST: TFloatField;
    QryBuscaBoletas: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    dsBuscaBoletas: TwwDataSource;
    QryBuscaPlnCodigo: TwwQuery;
    QryBuscaPlnCodigoPLNCODIGO: TFloatField;
    QryBuscaPlnCodigoCODDOCUMENTO: TFloatField;
    QryBuscaPlnCodigoPLANO: TFloatField;
    QryDelIrLitigio: TwwQuery;
    lblDocumento: TLabel;
    QryBuscaBoletasNUMDOCUMENTO: TStringField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dDataRefExit(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure Habilita;
    procedure Desabilita;
    procedure dblCorretoraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblCorretoraExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadExcluiBoletaBMF: TfrmCadExcluiBoletaBMF;
  DataProc : TDateTime;

implementation

{$R *.DFM}

uses  DBaseDados, UMensErro, UOperComum, UDiasUteisInv, UBibliotecaInvest,
   //AL_1
   uCtrlInvContab;

procedure TfrmCadExcluiBoletaBMF.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
   Begin
     CmeCadastroAtualizaBotoes(Sender);
     If MontaSelect.ValoresChave[0] <> '' Then
     Begin
        lblBoleta.Caption := 'Boleta : ' + MontaSelect.ValoresChave[0];
        lblDocumento.Caption := 'Documento : ' + MontaSelect.ValoresChave[3];
        dblCorretora.Text := MontaSelect.ValoresChave[1];
        dDataRef.Text     := MontaSelect.ValoresChave[2];
        QryBuscaBoletas.Close;
        QryBuscaBoletas.ParamByName('dDataRef').AsString := dDataRef.Text;
        QryBuscaBoletas.Open;
     End
   End
   Else
   begin
      dblCorretora.Text := '';
      lblBoleta.Caption := 'Boleta : ';
      lblDocumento.Caption := 'Documento : ';
      dDataRef.Text     := '';
   end;
end;

procedure TfrmCadExcluiBoletaBMF.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if (lblBoleta.Caption <> '') and (dDataRef.Text <> '') then
   begin
      //AL_1
      if not CtrlInvContab.TestaPeriodo(dDataRef.Text, 8) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
         Exit;
      end;

      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      Try
         with updOrdMovInv do
         begin
             Close;
             ParamByName('sIdLote').AsString := QryBuscaBoletas.FieldByName('IDLOTE').AsString;
             ParamByName('dDataRef').AsString := dDataRef.Text;
             ExecSql;
             Close;
         end;
         //AL_2
         // Exclui contabilidade e financeiro
         with QryBuscaPlnCodigo do
         begin
             Close;
             ParamByName('sIdLote').AsString  := QryBuscaBoletas.FieldByName('IDLOTE').AsString;
             ParamByName('dDataRef').AsString := dDataRef.Text;
             Open;
             with QryDelHistcartInv do
             begin
                 Close;
                 ParamByName('sIdLote').AsString := QryBuscaBoletas.FieldByName('IDLOTE').AsString;
                 ParamByName('dDataRef').AsString := dDataRef.Text;
                 ExecSql;
                 Close;
             end;
             while not EOF do
             begin
                if not OperComum.ProcExclui(QryBuscaPlnCodigo.FieldByName('CODDOCUMENTO').AsInteger,
                                            QryBuscaPlnCodigo.FieldByName('PLNCODIGO').AsInteger,
                                            QryBuscaPlnCodigo.FieldByName('PLANO').AsInteger,
                                            8,DataProc,True) then
                begin
                   DtmBaseDados.dbBaseDados.Rollback;
                   Exit;
                end;
                Next;
             end;
         end;
         with QrySelDespOper do
         begin
             Close;
             ParamByName('sIdLote').AsString := QryBuscaBoletas.FieldByName('IDLOTE').AsString;
             ParamByName('dDataRef').AsString := dDataRef.Text;
             Open;
             while not Eof do
             begin
                with QryDelDespOperInvest do
                begin
                    Close;
                    ParamByName('dDataRef').AsString := dDataRef.Text;
                    ParamByName('iIdOperacaoInvest').AsInteger := QrySelDespOper.FieldByName('IDOPERACAOINVEST').AsInteger;
                    ExecSql;
                    Close;
                end;
                with QryDelIrLitigio do
                begin
                    Close;
                    ParamByName('dDataRef').AsString   := dDataRef.Text;
                    ParamByName('iIdOperacaoInvest').AsInteger := QrySelDespOper.FieldByName('IDOPERACAOINVEST').AsInteger;
                    ExecSql;
                    Close;
                end;
                Next;
             end;
         end;
         with QryDelOperInvest do
         begin
             Close;
             ParamByName('sIdLote').AsString  := QryBuscaBoletas.FieldByName('IDLOTE').AsString;
             ParamByName('dDataRef').AsString := dDataRef.Text;
             ExecSql;
             Close;
         end;

         // Remonta Boletas
         QryBuscaBoletas.Close;
         QryBuscaBoletas.ParamByName('dDataRef').AsString := dDataRef.Text;
         QryBuscaBoletas.Open;
         lblBoleta.Caption := 'Boleta : ';
         lblDocumento.Caption := 'Documento : ';

         DtmBaseDados.dbBaseDados.Commit;
         MsgDlg('Processamento concluído.','Mensagem do Sistema ',mtConfirmation,[mbOK],0);
      except
         on E: Exception do
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu problema na exclusão da boleta ...'+
                   #13+E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   end;
   QryBuscaPlnCodigo.Close;
   QrySelDespOper.Close;
   QryBuscaBoletas.Close;
   QryBuscaBoletas.ParamByName('dDataRef').AsString := dDataRef.Text;
   QryBuscaBoletas.Open;
end;

procedure TfrmCadExcluiBoletaBMF.FormShow(Sender: TObject);
begin
  inherited;
   dDataRef.Date := DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECHBMF,-1,1,'',True,False,False);
   CmeCadastroAtualizaBotoes(Sender);
end;

procedure TfrmCadExcluiBoletaBMF.dDataRefExit(Sender: TObject);
begin
  inherited;
   if Trim(dDataRef.Text)<> '' then
   begin
      dDataRef.Text := FormatDateTime('DD/MM/YYYY', dDataRef.Date);
      DataProc      := StrToDate(dDataRef.Text);
      QryBuscaBoletas.Close;
      QryBuscaBoletas.ParamByName('dDataRef').AsString := dDataRef.Text;
      QryBuscaBoletas.Open;
      CmeCadastroAtualizaBotoes(Sender);
      if Trim(dblCorretora.Text) = '' then
      begin
         lblBoleta.Caption := 'Boleta : ';
         lblDocumento.Caption := 'Documento : ';
      end
      else
      begin
         lblBoleta.Caption := 'Boleta : ' + QryBuscaBoletas.FieldByName('IDLOTE').AsString;
         lblDocumento.Caption := 'Documento : ' + QryBuscaBoletas.FieldByName('NUMDOCUMENTO').AsString;
      end;
   end;
end;

procedure TfrmCadExcluiBoletaBMF.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled := True;
end;

procedure TfrmCadExcluiBoletaBMF.Habilita;
begin
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;

procedure TfrmCadExcluiBoletaBMF.Desabilita;
begin
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
end;


procedure TfrmCadExcluiBoletaBMF.dblCorretoraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if Trim(dblCorretora.Text) <> '' then
   begin
      lblBoleta.Caption := 'Boleta : ' + QryBuscaBoletas.FieldByName('IDLOTE').AsString;
      lblDocumento.Caption := 'Documento  : ' + QryBuscaBoletas.FieldByName('NUMDOCUMENTO').AsString;
      Habilita;
   end
   else
   begin
      lblBoleta.Caption := 'Boleta :';
      lblDocumento.Caption := 'Documento  : ';
      Desabilita;
   end;
end;

procedure TfrmCadExcluiBoletaBMF.dblCorretoraExit(Sender: TObject);
begin
  inherited;
   if Trim(dblCorretora.Text) <> '' then
   begin
      lblBoleta.Caption    := 'Boleta : ' + QryBuscaBoletas.FieldByName('IDLOTE').AsString;
      lblDocumento.Caption := 'Documento : ' + QryBuscaBoletas.FieldByName('NUMDOCUMENTO').AsString;
      Habilita;
   end
   else
   begin
      lblBoleta.Caption := 'Boleta : ';
      lblDocumento.Caption := 'Documento : ';
      Desabilita;
   end;
end;

procedure TfrmCadExcluiBoletaBMF.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then     
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadExcluiBoletaBMF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   QryBuscaPlnCodigo.Close;
   QrySelDespOper.Close;
   QryBuscaBoletas.Close;
end;

end.
